part of 'shopping_cubit.dart';


final class ShoppingState extends Equatable {
  final bool loading;



  const ShoppingState({
    this.loading = false,


  });

  ShoppingState copyWith({
    bool? loading,

  }) {
    return ShoppingState(
      loading: loading ?? this.loading,

      // Added the missing comma here
    );
  }

  @override
  List<Object?> get props => [loading,];


}
