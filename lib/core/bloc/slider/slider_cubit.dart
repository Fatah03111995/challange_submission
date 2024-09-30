import 'package:bloc/bloc.dart';
import 'package:challange_submission/core/bloc/slider/slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(const SliderState());

  void changeAbsis(int newVal) {
    emit(state.copyWith(absis: newVal));
  }

  void changeOrdinat(int newVal) {
    emit(state.copyWith(ordinat: newVal));
  }
}
