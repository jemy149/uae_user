import '../../../../data/models/user_models/cart/get_my_cart_model.dart';

class DeliveryDetailsScreenArgs{
  final GetMyCartModel getMyCartModel;
  final int? index;
  DeliveryDetailsScreenArgs(  { this.index,required this.getMyCartModel,});

}