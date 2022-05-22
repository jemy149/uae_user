import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uae_user/data/requests/search/price_model.dart';
import 'package:uae_user/data/requests/search/search_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/search/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(UserSearchInitialState());

  SearchModel searchModel = SearchModel();

  void userSearch({int? subCategoryId,required int page,int? barcode,int? brandId,String? keyword,Price? rangPrice}) {
    emit(UserSearchInitialState());
    SearchRequest()
        .searchRequest(
      page: page,
      categoryId: subCategoryId,
      barcode: barcode,
      brandId: brandId,
      keyword: keyword,
      rangPrice: rangPrice,
    )
        .then((value) {
      if (value.status == 200) {
        searchModel = value;
        emit(UserSearchSuccessState(products: searchModel.products));
      } else {
        emit(UserSearchErrorState());
      }
    }).catchError((error) {
      printResponse('userSearch' + error.toString());
    });
  }
}
