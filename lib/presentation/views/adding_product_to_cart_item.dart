import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styles/colors.dart';
import '../widgets/default_material_button.dart';
import '../widgets/default_text.dart';

class AddingProductToCartItem extends StatelessWidget {
  const AddingProductToCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0,top: 10.0,end: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: 'product name',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bukra-Regular'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DefaultText(
                    text:
                    'product info product info product info product info product info product info product info ',
                    maxLines: 4,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
                DefaultText(
                  text: '${250.00} AED',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: CheckboxListTile(
                        value: true,
                        onChanged: (p) {},
                        title: DefaultText(
                          text: 'item',
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
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
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
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultText(
                              text: '${1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const CircleAvatar(
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
                        ],
                      ),
                    ),
                    DefaultText(
                      text: '${1200} AED',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: CheckboxListTile(
                        value: true,
                        onChanged: (p) {},
                        title: DefaultText(
                          text: 'item',
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
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
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
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultText(
                              text: '${1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const CircleAvatar(
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
                        ],
                      ),
                    ),
                    DefaultText(
                      text: '${1200} AED',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: CheckboxListTile(
                        value: true,
                        onChanged: (p) {},
                        title: DefaultText(
                          text: 'item',
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
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
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
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultText(
                              text: '${1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const CircleAvatar(
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
                        ],
                      ),
                    ),
                    DefaultText(
                      text: '${1200} AED',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultMaterialButton(
                  text: '${AppLocalizations.of(context)!.addToCart}',
                  onTap: () {},
                  height: 50,
                  width: 260,
                  color: Colors.white,
                  textColor: AppColors.lightBlue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
