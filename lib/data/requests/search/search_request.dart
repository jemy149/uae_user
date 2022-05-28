import 'package:dio/dio.dart';
import 'package:uae_user/data/requests/search/price_model.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/constants.dart';
import '../../../constants/end_points.dart';
import '../../data_provider/remote/dio_helper.dart';
import '../../models/user_models/search/search_model.dart';

class SearchRequest {
  Future searchRequest({
    required int page,
    String? keyword,
    int? barcode,
    int? categoryId,
    List? brandId,
    Price? rangPrice,
  }) async {
    try {
      final requestData = <String, dynamic>{};
      void addIfNotNull(String key, dynamic value) {
        if (value != null) {
          requestData[key] = value;
        }
      }
      addIfNotNull('page', page,);
      addIfNotNull('type', 'product',);
      addIfNotNull('keyword', keyword,);
      addIfNotNull('barcode', barcode,);
      addIfNotNull('categoryId', categoryId,);
      addIfNotNull('brandId', brandId,);
      addIfNotNull('rangPrice', rangPrice?.toJson(),);
      addIfNotNull('apiToken', apiToken);
      Response response = await DioHelper.postData(url: EP_SEARCH, data: requestData);
      printResponse(response.data.toString());
      return SearchModel.fromJson(response.data);
    } catch (error) {
      printError('searchRequest ' + error.toString());
      return null;
    }
  }
}