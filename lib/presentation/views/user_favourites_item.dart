import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uae_user/presentation/styles/colors.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserFavouritesItem extends StatelessWidget {
  final Function() addToFavourites;
  final Function() remove;
  const UserFavouritesItem({Key? key,required this.addToFavourites,required this.remove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 160,
            width: 150,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 160,
                    width: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Image.asset(
                      'assets/images/fruits.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsetsDirectional.only(start: 10, top: 15),
                      child: InkWell(
                        onTap: addToFavourites,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white
                          ),
                          child:const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    )),
                 Padding(
                  padding:const EdgeInsetsDirectional.only(end: 10, top: 15),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: remove,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white
                          ),
                          child:const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: DefaultText(
                  textAlign: TextAlign.center,
                  text: 'item name item name item name item name item name item name',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontFamily: 'Bukra-Regular',
                      ),
                ),
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(text:AppLocalizations.of(context)!.price ,style:Theme.of(context).textTheme.bodyText1,),
                    const Padding(
                      padding:EdgeInsetsDirectional.only(start: 5),
                      child: DefaultText(text: '(4500)'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
