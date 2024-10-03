import 'package:challange_submission/core/brain/brain.dart';
import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePropCubit extends Cubit<GamePropState> {
  GamePropCubit()
      : super(const GamePropState(
            questionCount: 0,
            refreshChance: 0,
            lifePoint: 0,
            lifePointCount: 0));

  ///
  void startGame({
    required int questionCount,
    required int refreshChance,
    required int lifePointCount,
  }) {
    emit(GamePropState(
        questionCount: questionCount,
        refreshChance: refreshChance,
        lifePointCount: lifePointCount,
        lifePoint: lifePointCount,
        question: Brain.generateQuestion()));
  }

  void generateQuestion() {
    emit(state.copyWith(question: Brain.generateQuestion()));
  }

  void decreaseState(
      {int? decreaseQuestion,
      int? decreaseRefreshChance,
      int? decreaseLifePointCount}) {
    int newQuestionCount = state.questionCount - (decreaseQuestion ?? 0);
    int newRefreshChance = state.refreshChance - (decreaseRefreshChance ?? 0);
    int newLifePointCount =
        state.lifePointCount - (decreaseLifePointCount ?? 0);
    int newLifePoint = state.lifePoint - (decreaseLifePointCount ?? 0);

    emit(GamePropState(
      questionCount: newQuestionCount < 0 ? 0 : newQuestionCount,
      refreshChance: newRefreshChance < 0 ? 0 : newRefreshChance,
      lifePointCount: newLifePointCount < 0 ? 0 : newLifePointCount,
      lifePoint: newLifePoint < 0 ? 0 : newLifePoint,
    ));
  }

  void increaseState({
    int? increaseQuestion,
    int? increaseRefreshChance,
    int? increaseLifePointCount,
  }) {
    int newQuestionCount = state.questionCount + (increaseQuestion ?? 0);
    int newRefreshChance = state.refreshChance + (increaseRefreshChance ?? 0);
    int newLifePointCount =
        state.lifePointCount + (increaseLifePointCount ?? 0);
    int newLifePoint = state.lifePoint + (increaseLifePointCount ?? 0);

    emit(GamePropState(
      questionCount: newQuestionCount,
      refreshChance: newRefreshChance,
      lifePoint: newLifePoint,
      lifePointCount: newLifePointCount,
    ));
  }

  void increaseQuestionNumber() {
    int newQuestionNumber = state.questionNumber + 1;
    emit(state.copyWith(
        questionNumber: newQuestionNumber > state.questionCount
            ? state.questionCount
            : newQuestionNumber));
  }

  void decreaseQuestionNumber() {
    int newQuestionNumber = state.questionNumber - 1;
    emit(state.copyWith(
        questionNumber: newQuestionNumber < 0 ? 0 : newQuestionNumber));
  }

  void increaseLifePoint() {
    int newLifePoint = state.lifePoint + 1;
    emit(state.copyWith(
        lifePoint: newLifePoint > state.lifePointCount
            ? state.questionCount
            : newLifePoint));
  }

  void decreaseLifePoint() {
    int newLifePoint = state.lifePoint - 1;
    emit(state.copyWith(lifePoint: newLifePoint < 0 ? 0 : newLifePoint));
  }
}
