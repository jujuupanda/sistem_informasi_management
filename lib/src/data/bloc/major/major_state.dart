part of 'major_bloc.dart';

abstract class MajorState extends Equatable {
  const MajorState();
}

class MajorInitial extends MajorState {
  @override
  List<Object> get props => [];
}
