import '../../../../data/models/user_models/get_orders/get_orders_model.dart';

class DeliveryInformationScreenArgs {

  final GetOrdersModel getOrdersModel;
  final int index;


  DeliveryInformationScreenArgs( {required this.getOrdersModel, required this.index,});
}