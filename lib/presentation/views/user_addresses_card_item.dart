import 'package:flutter/material.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

class UserAddressesCardItem extends StatelessWidget {
  const UserAddressesCardItem({Key? key,required this.remove}) : super(key: key);
  final Function() remove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 10.0,top: 5.0,bottom: 5.0),
                  child: DefaultText(text: 'user address',style: Theme.of(context).textTheme.bodyText1,),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15.0,bottom: 5.0,top: 5.0),
                  child: InkWell(
                    onTap: remove,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.red
                        )
                      ),
                      child:const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
              color:AppColors.grey,
              height: 1,
              width: double.maxFinite,
            ),
            Image.asset('assets/images/abstract-city.png',height: 120,fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}
