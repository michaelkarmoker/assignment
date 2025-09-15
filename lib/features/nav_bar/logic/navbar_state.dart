part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final int index;

  const NavbarState({
     this.index = 0,
  });

  NavbarState copyWith({
    int? index,
    bool? isShowCaseFinished,
  }) {
    return NavbarState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}
