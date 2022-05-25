import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/data/models/user_models/get_products/get_products_model.dart';

import '../styles/colors.dart';
import '../widgets/default_text.dart';

class AddingProductToCartCounterItem extends StatefulWidget {
  final Product getProductsModel;

  const AddingProductToCartCounterItem(
      {Key? key, required this.getProductsModel})
      : super(key: key);

  @override
  State<AddingProductToCartCounterItem> createState() =>
      _AddingProductToCartCounterItemState();
}

class _AddingProductToCartCounterItemState
    extends State<AddingProductToCartCounterItem> {
  late int productQuantity;
   List<int> listOfQuantities = [];
  late List<bool> listOfCheckBoxesValue;

  @override
  void initState() {
    if (widget.getProductsModel.prices.isEmpty) {
      productQuantity = widget.getProductsModel.quantity;
    } else {
      listOfQuantities = List.generate(
        widget.getProductsModel.prices.length,
        (index) => listOfQuantities[index] =
            widget.getProductsModel.prices[index].quantity,
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.getProductsModel.prices.isEmpty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 30,
            child: SizedBox(
              child: CheckboxListTile(
                value: true,
                onChanged: (p) {},
                title: DefaultText(
                  text: widget.getProductsModel.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.white),
                ),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              width: 100,
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DefaultText(
                      text: productQuantity.toString(),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 30,
            child: DefaultText(
              text:
                  '${widget.getProductsModel.price} ${AppLocalizations.of(context)!.appCurrency}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      replacement: Column(
        children: List.generate(
            widget.getProductsModel.prices.length,
            (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 30,
                      child: SizedBox(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (p) {},
                          title: DefaultText(
                            text: widget.getProductsModel.prices[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: Colors.white),
                          ),
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        width: 100,
                      ),
                    ),
                    Expanded(
                      flex: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightBlue,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
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
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: DefaultText(
                                text: '${listOfQuantities[index]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 30,
                      child: DefaultText(
                        text:
                            '${widget.getProductsModel.prices[index].price} ${AppLocalizations.of(context)!.appCurrency}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                )),
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
