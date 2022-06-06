import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uae_user/business_logic/user/cart/delete_cart/delete_cart_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/data/models/user_models/cart/get_my_cart_model.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_cached_network_image.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import '../../business_logic/user/cart/edit_cart/edit_cart_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CartItem extends StatefulWidget {
  final Carts getMyCartModel;


  const CartItem({Key? key, required this.getMyCartModel,})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int productQuantity;
  late DeleteCartCubit _deleteCartCubit;



  @override
  void initState() {

    productQuantity = widget.getMyCartModel.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsetsDirectional.only(top: 5.0, start: 5.0, end: 5.0),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Card(
              child: Material(
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: DefaultCachedNetworkImage(
                        imageUrl: widget.getMyCartModel.product.images[0],
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultText(
                        text: widget.getMyCartModel.product.name,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: DefaultText(
                          text: '${widget.getMyCartModel.product.price} ${AppLocalizations.of(context)!.appCurrency}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: BlocBuilder<EditCartCubit, EditCartState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: const CircleAvatar(
                                      backgroundColor: AppColors.black,
                                      radius: 15.2,
                                      child: CircleAvatar(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: AppColors.lightBlue,
                                        radius: 15,
                                      ),
                                    ),
                                    onTap: () async{
                                      await decrementProductQuantity();
                                      EditCartCubit().userEditCart(
                                          cartId: widget.getMyCartModel.id,
                                          quantity:
                                          productQuantity);
                                      printTest('${widget.getMyCartModel.id}');

                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: DefaultText(
                                      text: '$productQuantity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: const CircleAvatar(
                                      backgroundColor: AppColors.black,
                                      radius: 15.2,
                                      child: CircleAvatar(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: AppColors.lightBlue,
                                        radius: 15,
                                      ),
                                    ),
                                    onTap: ()async{
                                      await incrementProductQuantity();
                                      EditCartCubit().userEditCart(
                                          cartId: widget.getMyCartModel.id,
                                          quantity:
                                          productQuantity);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      _deleteCartCubit = DeleteCartCubit.get(context);
                      _deleteCartCubit.userDeleteCart(cartId: widget.getMyCartModel.id,);

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(width: 1, color: AppColors.red)),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
   incrementProductQuantity() {
    setState(() {
      if (productQuantity < 99) {
        productQuantity++;
      } else {}
    });
  }

   decrementProductQuantity() {
    setState(() {
      if (productQuantity > 1) {
        productQuantity--;
      } else {}
    });
  }
}

