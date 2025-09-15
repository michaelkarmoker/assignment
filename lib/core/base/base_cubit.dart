import 'package:bloc/bloc.dart';

abstract class BaseCubit<T> extends Cubit<T>{
  BaseCubit(super.initialState);

  void clear();

}