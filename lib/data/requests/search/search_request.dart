import 'package:dio/dio.dart';
import 'package:uae_user/data/requests/search/price_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/search/search_model.dart';

class SearchRequest {
   Future searchRequest({
    required int page,
    String? keyword,
    int? barcode,
    int? categoryId,
    int? brandId,
    Price? rangPrice,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_SEARCH, data: {
        'page': page,
        'type': 'product',
        'keyword': keyword,
        'barcode': barcode,
        'categoryId': categoryId,
        'brandId': brandId,
        'rangPrice': rangPrice,
      });
      printResponse(response.data.toString());
      return SearchModel.fromJson(response.data);
    } catch (error) {
      printError('searchRequest '+error.toString());
      return null;
    }
  }
}