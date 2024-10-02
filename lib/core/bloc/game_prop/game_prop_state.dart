import 'package:equatable/equatable.dart';

class GamePropState extends Equatable {
  final int questionCount;
  final int refreshChance;
  final int lifePoint;
  final int questionNumber;

  const GamePropState(
      {required this.questionCount,
      required this.refreshChance,
      required this.lifePoint,
      this.questionNumber = 1});

  @override
  List<Object?> get props =>
      [questionCount, refreshChance, lifePoint, questionNumber];

  GamePropState copyWith({
    int? questionCount,
    int? refreshChance,
    int? lifePoint,
    int? questionNumber,
  }) {
    return GamePropState(
      questionCount: questionCount ?? this.questionCount,
      refreshChance: refreshChance ?? this.refreshChance,
      lifePoint: lifePoint ?? this.lifePoint,
      questionNumber: questionNumber ?? this.questionNumber,
    );
  }
}
