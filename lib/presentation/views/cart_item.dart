
import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5.0,start: 5.0,end: 5.0),
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
                    child: Image.asset(
                      'assets/images/chocolate.png',
                      fit: BoxFit.cover,
                    )),
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
                    text: 'item name item name ',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DefaultText(
                      text: '${10.00} AED',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 2.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(15)),
                      padding:const EdgeInsets.symmetric(horizontal: 2),
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultText(
                              text: '${1}',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                  )
              ],
            ),
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                      border: Border.all(width: 1,color: AppColors.red)
                      ),
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
}
