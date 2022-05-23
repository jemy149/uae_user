import 'package:flutter/material.dart';
import '../../../styles/colors.dart';
import '../../../views/adding_product_to_cart_item.dart';

class AddingProductToCartScreen extends StatefulWidget {
  final int productId;
  const AddingProductToCartScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<AddingProductToCartScreen> createState() => _AddingProductToCartScreenState();
}

class _AddingProductToCartScreenState extends State<AddingProductToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //         padding: const EdgeInsetsDirectional.only(end: 60),
        //         child: DefaultText(
        //           text: AppLocalizations.of(context)!.offers,
        //           style: Theme.of(context).textTheme.headline6?.copyWith(
        //             fontFamily: 'Bukra-Regular',
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         )),
        //   ],
        // ),
      ),
      backgroundColor: AppColors.lightBlue,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    )),
                child: Center(
                  child: Image.asset(
                    'assets/images/coffee.png',
                  height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                right: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightBlue
                  ),
                  child:const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ),),

            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: AddingProductToCartItem(),
            ),
          )
        ],
      ),
    ));
  }
}
