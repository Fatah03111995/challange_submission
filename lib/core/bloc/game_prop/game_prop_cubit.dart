import 'package:challange_submission/core/bloc/game_prop/game_prop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamePropCubit extends Cubit<GamePropState> {
  GamePropCubit()
      : super(const GamePropState(
            questionCount: 0, refreshChance: 0, lifePoint: 0));

  ///
  void startGame(
      {required int questionCount,
      required int refreshChance,
      required int lifePoint}) {
    emit(GamePropState(
        questionCount: questionCount,
        refreshChance: refreshChance,
        lifePoint: lifePoint));
  }

  void decreaseState(
      {int? decreaseQuestion,
      int? decreaseRefreshChance,
      int? decreaseLifePoint}) {
    int newQuestionCount = state.questionCount - (decreaseQuestion ?? 0);
    int newRefreshChance = state.questionCount - (decreaseRefreshChance ?? 0);
    int newLifePoint = state.questionCount - (decreaseLifePoint ?? 0);

    emit(GamePropState(
      questionCount: newQuestionCount < 0 ? 0 : newQuestionCount,
      refreshChance: newRefreshChance < 0 ? 0 : newRefreshChance,
      lifePoint: newLifePoint < 0 ? 0 : newLifePoint,
    ));
  }

  void increaseState(
      {int? decreaseQuestion,
      int? decreaseRefreshChance,
      int? decreaseLifePoint}) {
    int newQuestionCount = state.questionCount + (decreaseQuestion ?? 0);
    int newRefreshChance = state.questionCount + (decreaseRefreshChance ?? 0);
    int newLifePoint = state.questionCount + (decreaseLifePoint ?? 0);

    emit(GamePropState(
      questionCount: newQuestionCount,
      refreshChance: newRefreshChance,
      lifePoint: newLifePoint,
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
}
