import 'package:challange_submission/core/model/question_model.dart';
import 'package:equatable/equatable.dart';

class GamePropState extends Equatable {
  final int questionCount;
  final int refreshChance;
  final int lifePointCount;
  final int lifePoint;
  final int questionNumber;
  final QuestionModel? question;

  const GamePropState(
      {required this.questionCount,
      required this.refreshChance,
      required this.lifePoint,
      required this.lifePointCount,
      this.question,
      this.questionNumber = 1});

  @override
  List<Object?> get props => [
        questionCount,
        refreshChance,
        lifePoint,
        questionNumber,
        lifePointCount,
        question,
      ];

  GamePropState copyWith({
    int? questionCount,
    int? refreshChance,
    int? lifePoint,
    int? questionNumber,
    int? lifePointCount,
    QuestionModel? question,
  }) {
    return GamePropState(
      questionCount: questionCount ?? this.questionCount,
      refreshChance: refreshChance ?? this.refreshChance,
      lifePoint: lifePoint ?? this.lifePoint,
      lifePointCount: lifePointCount ?? this.lifePointCount,
      questionNumber: questionNumber ?? this.questionNumber,
      question: question ?? this.question,
    );
  }
}
