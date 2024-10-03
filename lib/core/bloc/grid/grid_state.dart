// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class GridState extends Equatable {
  final List<int> selectedGrid;

  const GridState({this.selectedGrid = const []});

  @override
  List<Object> get props => [selectedGrid];
}
