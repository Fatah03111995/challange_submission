import 'package:bloc/bloc.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_event.dart';
import 'package:challange_submission/core/bloc/quiz/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizInitial()) {
    on<ChangeNominator>(_onChangeNominator);
    on<ChangeDenominator>(_onChangeDenominator);
    on<TestAnswer>(_onTestAnswer);
  }

  void _onChangeNominator(ChangeNominator event, Emitter emit) {
    if (state is QuizInitial) {
      emit((state as QuizInitial).copyWith(nominator: event.newNominator));
    }
  }

  void _onChangeDenominator(ChangeDenominator event, Emitter emit) {
    if (state is QuizInitial) {
      emit((state as QuizInitial).copyWith(denominator: event.newDenominator));
    }
  }

  void _onTestAnswer(TestAnswer event, Emitter emit) {
    emit(QuizLoading());
    try {
      if (state is QuizInitial) {
        int nominator = (state as QuizInitial).nominator;
        int denominator = (state as QuizInitial).denominator;

        emit(QuizSuccess(
            result: nominator == event.rightAnswer.nominator &&
                denominator == event.rightAnswer.denominator));
      }
    } catch (e) {
      emit(QuizFailed(message: e.toString()));
    }
  }
}
