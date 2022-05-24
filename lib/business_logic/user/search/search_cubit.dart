import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/search/search_model.dart';
import '../../../data/requests/search/price_model.dart';
import '../../../data/requests/search/search_request.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(UserSearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel searchModel = SearchModel();

   userSearch({
    int? categoryId,
    required int page,
    int? barcode,
    List? brandId,
    String? keyword,
    Price? rangPrice,
  }) {
    emit(UserSearchLoadingState());
    SearchRequest()
        .searchRequest(
      page: page,
      categoryId: categoryId,
      barcode: barcode,
      brandId: brandId,
      keyword: keyword,
      rangPrice: rangPrice,
    )
        .then((value) {
      if (value.status == 200) {
        searchModel = value;
        emit(UserSearchSuccessState(products: searchModel.products));
      } else if(value.status == 204) {
        emit(UserSearchEmptyState());

      }else{
        emit(UserSearchErrorState());
      }
    }).catchError((error) {
      printResponse('userSearch' + error.toString());
    });
  }
}
