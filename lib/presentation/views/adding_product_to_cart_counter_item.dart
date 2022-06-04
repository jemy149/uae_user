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
  List<bool> listOfCheckBoxesValue = [];

  @override
  void initState() {
    super.initState();
    productQuantity = 0;

    if (widget.getProductsModel.prices.isEmpty) {
      productQuantity = widget.getProductsModel.quantity;
    } else {
      listOfCheckBoxesValue=List.generate(widget.getProductsModel.prices.length, (index) => false);

      for (var element in widget.getProductsModel.prices) {
        listOfQuantities.add(element.quantity);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.getProductsModel.prices.isEmpty
        ? Column(
          children: [
            Row(
            children: [
              Flexible(
                flex: 30,
                child: CheckboxListTile(
                  value: true,
                  onChanged: (p) {},
                  title: DefaultText(
                    text: widget.getProductsModel.name,
                    maxLines: 10,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,


                ),
              ),
            ],
          ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                            onTap: () {
                              decrementProductQuantity();
                            },
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
                              style:
                                  Theme.of(context).textTheme.bodyText1?.copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              incrementProductQuantity();
                            },
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
                  const Spacer(flex: 5,),
                  Flexible(
                    flex: 30,
                    child: DefaultText(
                      text:
                          '${(widget.getProductsModel.price*productQuantity).toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
          ],
        )
        : Column(
            children: List.generate(
                listOfQuantities.length,
                (index) => Column(
                  children: [
                    Row(
                    children: [
                      Flexible(
                        flex: 30,
                        child: SizedBox(
                          child: CheckboxListTile(
                            value: listOfCheckBoxesValue[index],
                            onChanged: (value) {
                              setState(() {
                                listOfCheckBoxesValue[index]=value!;
                              });
                            },
                            title: DefaultText(
                              text:
                              widget.getProductsModel.prices[index].name,
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
                    ],
                  ),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                      onTap: () {
                                        if (listOfCheckBoxesValue[index]) {
                                          setState(() {
                                            if (listOfQuantities[index] > 1) {
                                              listOfQuantities[index]--;
                                            }
                                          });
                                        }
                                      },
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DefaultText(
                                        text: listOfQuantities[index].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (listOfCheckBoxesValue[index]) {
                                          setState(() {
                                            if (listOfQuantities[index] < 99) {
                                              listOfQuantities[index]++;
                                            }
                                          });
                                        }
                                      },
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
                            const Spacer(flex: 5,),
                            Flexible(
                              flex: 30,
                              child: DefaultText(
                                text:
                                    '${(widget.getProductsModel.prices[index].price* listOfQuantities[index]).toStringAsFixed(2)} ${AppLocalizations.of(context)!.appCurrency}',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                  ],
                )),
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
