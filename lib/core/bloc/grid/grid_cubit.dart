import 'package:bloc/bloc.dart';
import 'package:challange_submission/core/bloc/grid/grid_state.dart';

class GridCubit extends Cubit<GridState> {
  GridCubit() : super(const GridState());

  void initial() {
    emit(const GridState());
  }

  void toggleSelection(int index) {
    List<int> selectedItem = [...state.selectedGrid];
    if (selectedItem.contains(index)) {
      selectedItem.remove(index);
      emit(GridState(selectedGrid: selectedItem));
    } else {
      selectedItem.add(index);
      emit(GridState(selectedGrid: selectedItem));
    }
  }
}
