// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final int absis;
  final int ordinat;

  const SliderState({this.absis = 1, this.ordinat = 1});

  @override
  List<Object> get props => [absis, ordinat];

  SliderState copyWith({
    int? absis,
    int? ordinat,
  }) {
    return SliderState(
      absis: absis ?? this.absis,
      ordinat: ordinat ?? this.ordinat,
    );
  }
}
