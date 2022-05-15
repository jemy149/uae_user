import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/user_favourites_item.dart';
import '../../../../constants/screens.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightBlue,
          leading: IconButton(
            icon: Image.asset('assets/images/bell1.png'),
            onPressed: () {Navigator.pushNamed(context, NOTIFICATIONS_SCREEN_R);},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultText(text: AppLocalizations.of(context)!.fav),
            ],
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.topRight,
                children: const [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.lightGreenAccent,
                    radius: 5.0,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    text: 'List of My Favourites',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    child: DefaultText(text: '(4 items)',style: Theme.of(context).textTheme.caption,),
                  ),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 300),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return UserFavouritesItem(addToFavourites: (){},remove: (){},);
                }),
          ],
        ),
      ),
    );
  }
}
