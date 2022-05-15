
import 'package:flutter/material.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styles/colors.dart';
import '../widgets/custome_drop_down_list_inner_text_widget.dart';

class CustomeDropDownList extends StatefulWidget {
  const CustomeDropDownList({Key? key}) : super(key: key);

  @override
  State<CustomeDropDownList> createState() => _CustomeDropDownListState();
}

class _CustomeDropDownListState extends State<CustomeDropDownList> {
  bool isTrue =false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              isTrue = !isTrue;
            });
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25)),
            padding:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            margin:const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                      child: DefaultText(
                    text: AppLocalizations.of(context)!.chooseFromMyAddresses,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.grey.withOpacity(0.6)),
                  )),
                   Visibility(
                     replacement:  const Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.lightBlue,),
                       visible: isTrue,
                       child: const Icon(Icons.keyboard_arrow_up_outlined, color: AppColors.lightBlue,))
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isTrue,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){Navigator.pushNamed(context, ADDING_ADDITIONAL_LOCATION_SCREEN_R);},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: DefaultText(
                              text: AppLocalizations.of(context)!.chooseFromTheMap,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1),
                            ),
                        const Icon(Icons.location_on_outlined,color: AppColors.lightBlue,)
                      ],
                    ),
                  ),
                  ListView.builder(itemBuilder: (context, index) =>
                      CustomeDropDownListInnerTextWidget(),
                  itemCount: 2,
                  shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
