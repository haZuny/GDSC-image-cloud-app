import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:image/image.dart' as IMG;
import 'package:collection/collection.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class Classifier {
  // 텐서플로우 인터프리터
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;

  // 인풋, 아웃풋 리스트
  late List<int> _inputShape;
  late List<int> _outputShape;

  // 입력 사진 객체, 아웃풋 버퍼
  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  // 입력, 출력 타입
  late TfLiteType _inputType;
  late TfLiteType _outputType;

  late var _probabilityProcessor;

  late List<String> labels;

  // String modelName = 'ml/toy_project.tflite';
  String modelName = 'ml/mobilenet_v1_1.0_224_quant.tflite';

  NormalizeOp preProcessNormalizeOp = NormalizeOp(0, 0);
  // NormalizeOp get postProcessNormalizeOp;

  // 생성자
  Classifier({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }
  }

  // 모델 불러오기
  Future<void> loadModel() async {
    interpreter =
        await Interpreter.fromAsset(modelName, options: _interpreterOptions);

    _inputShape = interpreter.getInputTensor(0).shape;
    _outputShape = interpreter.getOutputTensor(0).shape;
    _inputType = interpreter.getInputTensor(0).type;
    _outputType = interpreter.getOutputTensor(0).type;

    _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
    // _probabilityProcessor =
    //     TensorProcessorBuilder().add(postProcessNormalizeOp).build();
  }

  // 이미지 전처리
  TensorImage _preProcess() {
    int cropSize = min(_inputImage.height, _inputImage.width);
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
        _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(preProcessNormalizeOp)
        .build()
        .process(_inputImage);
  }

  predict(File imageFile) async {
    await loadModel();
    IMG.Image? image =
        IMG.decodeJpg(imageFile.readAsBytesSync());
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image!);
    _inputImage = _preProcess();
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());

    // Map<String, double> labeledProb = TensorLabel.fromList(
    //     labels, _probabilityProcessor.process(_outputBuffer))
    //     .getMapWithFloatValue();
    // final pred = getTopProbability(labeledProb);
    //
    // return Category(pred.key, pred.value);
    return _outputBuffer.getDoubleList();
  }

  void close() {
    interpreter.close();
  }
}
//
// MapEntry<String, double> getTopProbability(Map<String, double> labeledProb) {
//   var pq = PriorityQueue<MapEntry<String, double>>(compare);
//   pq.addAll(labeledProb.entries);
//
//   return pq.first;
// }
//
// int compare(MapEntry<String, double> e1, MapEntry<String, double> e2) {
//   if (e1.value > e2.value) {
//     return -1;
//   } else if (e1.value == e2.value) {
//     return 0;
//   } else {
//     return 1;
//   }
// }
