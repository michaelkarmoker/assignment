import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {

  NavbarCubit() : super(const NavbarState()) {}

  setIndex(int index) {
    emit(state.copyWith(index: index));
  }

  clear(){
    emit(const NavbarState());
  }

  setIsShowCaseFinished(bool isFinished) {
    emit(state.copyWith(isShowCaseFinished: isFinished, index: 0));
  }
}
