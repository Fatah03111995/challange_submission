import 'package:challange_submission/core/model/answer_model.dart';

class QuizEvent {}

class ChangeNominator extends QuizEvent {
  final int newNominator;

  ChangeNominator({required this.newNominator});
}

class ChangeDenominator extends QuizEvent {
  final int newDenominator;

  ChangeDenominator({required this.newDenominator});
}

class TestAnswer extends QuizEvent {
  final AnswerModel rightAnswer;

  TestAnswer({required this.rightAnswer});
}
