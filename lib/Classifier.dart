import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as IMG;

import 'package:flutter/services.dart';

// Import tflite_flutter
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // 모델 라벨 경로
  final _modelFile = 'ml/toy_project.tflite';

  // Maximum length of sentence
  final int _sentenceLen = 256;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  late Map<String, int> _dict;

  // 텐서플로우 인터프리터
  late Interpreter _interpreter;

  Future classify(File img) async {
    // 텐서플로우 인터프리터 생성
    _interpreter = await Interpreter.fromAsset(_modelFile);

    // 이미지 비트맵 변환, 사이즈 변환
    var imgByte = await img.readAsBytes();
    IMG.Image? imgBitOrigin = IMG.decodeImage(imgByte);
    IMG.Image? imgBit = IMG.copyResize(imgBitOrigin!, width: 224, height: 224);
    // 이미지 픽셀 바이트 저장
    var input = List<double>.filled(150528, 0).reshape([1, 224, 224, 3]);
    for (int x = 0; x < 224; x++){
      for (int y = 0; y < 224; y++){
        var pixel = imgBit?.getPixel(x, y);
        input[0][x][y][0] = pixel!.r.toDouble();
        input[0][x][y][1] = pixel!.g.toDouble();
        input[0][x][y][2] = pixel!.b.toDouble();
      }
    }
    print("=================");
    print(imgBit?.width);
    print(imgBit?.height);
    print(imgBit?.getPixel(imgBit!.width-1, imgBit!.height-1));
    // print(imgBit?.pixel);

    // output of shape [1,2].
    var output = List<double>.filled(6, 0).reshape([1, 6]);

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output);
    return output[0];
  }
}