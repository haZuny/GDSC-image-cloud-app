import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as IMG;

class Classifier {
  // 이미지
  late File imgFile;
  late TensorImage _inputImage;
  late TensorImage tensorImage;
  // tflite 인터프리터
  late Interpreter interpreter;
  // 모델
  String modelName = 'ml/toy_project.tflite';

  // 생성자
  Classifier(File imgFile){
    this.imgFile = imgFile;
  }

  // 사진 초기화
  Future<TensorImage> preProcess() async {
    _inputImage = TensorImage(interpreter.getInputTensor(0).type);
    _inputImage.loadImage(IMG.decodeImage(imgFile.readAsBytesSync())!);
    int cropSize = min(_inputImage.height, _inputImage.width);
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
        interpreter.getInputTensor(0).shape[1], interpreter.getInputTensor(0).shape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(NormalizeOp(127.5, 127.5))
        // .add(NormalizeOp())
        .build()
        .process(_inputImage);
  }

  // 모델 불러오기
  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset(modelName);
  }

  // 분류
  Future<String> classify() async {
    await loadModel();
    tensorImage = await preProcess();
    var output = List<double>.filled(6, 0).reshape([1, 6]);
    interpreter.run(tensorImage.buffer, output);
    int maxIdx = 0;
    double maxVal = 0;
    for (int i = 0; i < output[0].length; i++){
      if(output[0][i] > maxVal){
        maxIdx = i;
        maxVal = output[0][i];
      }
    }
    String category = '';
    switch(maxIdx){
      case 0:
        category = 'animal';
        break;
      case 1:
        category = 'food';
        break;
      case 2:
        category = 'indoor';
        break;
      case 3:
        category = 'mobility';
        break;
      case 4:
        category = 'outdoor';
        break;
      case 5:
        category = 'person';
        break;
      default:
        category='other';
        break;
    }
    return category;
  }
}
