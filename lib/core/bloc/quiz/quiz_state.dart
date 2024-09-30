// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  final int nominator;
  final int denominator;

  const QuizInitial({this.nominator = 0, this.denominator = 1});

  @override
  List<Object?> get props => [nominator, denominator];

  QuizInitial copyWith({
    int? nominator,
    int? denominator,
  }) {
    return QuizInitial(
      nominator: nominator ?? this.nominator,
      denominator: denominator ?? this.denominator,
    );
  }
}

class QuizLoading extends QuizState {
  @override
  List<Object?> get props => [];
}

class QuizSuccess extends QuizState {
  final bool result;

  const QuizSuccess({required this.result});
  @override
  List<Object?> get props => [];
}

class QuizFailed extends QuizState {
  final String message;

  const QuizFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
