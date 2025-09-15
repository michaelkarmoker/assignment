import 'package:assignment/features/shopping/repository/shopping_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


import 'package:meta/meta.dart';

import '../../../api/model/api_response.dart';
import '../../../core/base/base_cubit.dart';
import '../../../main.dart';


part 'shopping_state.dart';

class ShoppingCubit extends BaseCubit<ShoppingState> {


  final ShoppingRepository shoppingRepository;
  ShoppingCubit({required this.shoppingRepository}) : super(ShoppingState());

  final shippingAddressFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameCtr = TextEditingController();
  final TextEditingController lastNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneNumberCtr = TextEditingController();
  final TextEditingController streetAddressCtr = TextEditingController();
  final TextEditingController buildingNumberCtr = TextEditingController();
  final TextEditingController postCodeCtr = TextEditingController();








  // Future<List<CategoryModel>> getCategoryList(int page ) async {
  //
  //   emit(state.copyWith(loading: true));
  //   // var deviceToken = await NotificationService.getDeviceToken();
  //   ApiResponse apiResponse = await categoryRepository.getCategoryList( page);
  //
  //   if ((apiResponse.response?.statusCode ??
  //       AppConstants.STATUS_CODE_UNDEFINED) ==
  //       200) {
  //      try {
  //
  //
  //     final List<dynamic> responseData =apiResponse.response?.data; // Your raw JSON list
  //     final categories = responseData.map((e) => CategoryModel.fromJson(e)).toList();
  //
  //     emit(state.copyWith(loading: false,categories: categories));
  //     return categories;
  //
  //      }catch(e){
  //        emit(state.copyWith(loading: false));
  //        showSnackBar(e.toString(),mustShowInReleaseMode: false);
  //        return [];
  //      }
  //
  //
  //
  //   } else {
  //     // dismissLoaderDialog();
  //     emit(state.copyWith(loading: false));
  //     return [];
  //
  //   }
  // }
  //
  //
  //
  // Future<void> createCategory( ) async {
  //
  //   String name= categoryName.text;
  //   String? parentCateId= null;
  //   String?  selectedStatus= state.selectedStatus;
  //   if(selectedStatus==null){
  //     showSnackBar("Please select a status");
  //     return;
  //   }
  //
  //   emit(state.copyWith(loading: true));
  //
  //
  //
  //   ApiResponse apiResponse = await categoryRepository.createCategory( name,selectedStatus, parentCateId );
  //
  //   if ((apiResponse.response?.statusCode ??
  //       AppConstants.STATUS_CODE_UNDEFINED) ==
  //       200) {
  //       try {
  //
  //
  //
  //
  //
  //
  //
  //         clearControllers();
  //         emit(state.copyWith(loading: false ));
  //         showSnackBar(
  //           apiResponse.response?.data['message'] ?? "Successfully created category",
  //           isError: false,
  //         );
  //          Navigator.pop(Get.context!);
  //
  //
  //
  //
  //
  //       } catch (err) {
  //        emit(state.copyWith(loading: false));
  //        showSnackBar("$err", mustShowInReleaseMode: false);
  //
  //       }
  //   } else {
  //
  //     emit(state.copyWith(loading: false));
  //
  //   }
  // }


    void clearControllers() {

    }


  @override
  void clear() {
    emit(ShoppingState());
  }

}


