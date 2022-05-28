import 'package:uae_user/data/models/user_models/get_orders/get_orders_model.dart';


class TrackingOrderScreenArgs{
  final int index ;
  final GetOrdersModel getOrdersModel;


  TrackingOrderScreenArgs({required this.index,required this.getOrdersModel});
}