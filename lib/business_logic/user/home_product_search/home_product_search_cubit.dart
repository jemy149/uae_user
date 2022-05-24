import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/models/user_models/search/search_model.dart';
import 'package:uae_user/data/requests/search/search_request.dart';
import '../../../constants/constant_methods.dart';
part 'home_product_search_state.dart';

class UserProductSearchCubit extends Cubit<UserProductSearchStates> {
  UserProductSearchCubit() : super(HomeProductSearchInitial());

  static UserProductSearchCubit get(context) => BlocProvider.of(context);
  SearchModel? userSearchModel;
  int nextPage = 2;
  bool isLoadingMoreData = false;

  void userProductSearch({
    String? keyword,
    int? barcode,
    required int page,
  }) async {
    if (page == 1) {
      nextPage=2;
      emit(UserProductSearchLoadingState());
    } else {
      isLoadingMoreData = true;
    }

    SearchRequest().searchRequest(page: page,keyword: keyword,barcode: barcode)
        .then((value) {
      if (value.status == 200) {
        if (page == 1) {
          userSearchModel = value;
        } else {
          SearchModel tempUserProductSearchModel = value;
          userSearchModel?.products
              ?.addAll(tempUserProductSearchModel.products!);
          isLoadingMoreData = false;

          nextPage+=1;
        }
        emit(UserProductSearchSuccessState());
      } else if (value.status == 204) {
        if (page == 1) {
          emit(UserProductSearchEmptyState());
        }else{
          isLoadingMoreData = false;

        }
      }
    }).catchError((error) {
      emit(UserProductSearchErrorState());
      printError('userProductSearch ' + error.toString());
    });
  }
}
