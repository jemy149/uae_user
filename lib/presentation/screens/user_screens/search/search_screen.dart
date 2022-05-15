import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/widgets/delivery_details_form_field.dart';

import '../../../styles/colors.dart';
import '../../../views/home_grid_view_item.dart';
import '../../../widgets/default_text.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsetsDirectional.only(end: 60),
                  child: DefaultText(
                    text: AppLocalizations.of(context)!.search,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'Bukra-Regular',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
              child: DeliveryDetailsFormField(
                controller: searchController,
                validator: (_) {},
                keyboardType: TextInputType.text,
                radius: 25,
                height: 50,
                hintText: AppLocalizations.of(context)!.search,
                backgroundColor: AppColors.grey.withOpacity(0.3),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 150),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return HomeGridViewItem(
                    onTap: () {},
                  );
                }),
          ],
        ),
      ),
    );
  }
}
