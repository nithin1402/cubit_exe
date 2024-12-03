import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{

  CounterCubit() : super(0);

  void incrementValue(){
    emit(state+1);
  }

  void decrementValue(){
    emit(state-1);
  }

}