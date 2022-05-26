import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/get_offers/get_offers_cubit.dart';
import 'package:uae_user/presentation/views/home_offers_card_item.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  text: AppLocalizations.of(context)!.offers,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          ],
        ),
      ),
      body: BlocBuilder<GetOffersCubit, GetOffersState>(
        builder: (context, state) {
          if (state is UserGetOffersSuccessState) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 12.0,
                start: 12.0,
                end: 12.0,
              ),
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 190),
                      itemCount: state.offers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HomeOffersCardItem(offer: state.offers[index],productId: state.offers[index].product.id,);
                      }),
                ],
              ),
            );
          } else if (state is UserGetOffersLoadingState) {
            return const DefaultLoadingIndicator();
          } else if (state is UserGetOffersEmptyState) {
            return Center(
              child: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DefaultSvg(
                      imagePath: 'assets/icons/no_search_data.svg',
                      color: AppColors.lightBlue2,
                    ),
                    DefaultText(
                      text: AppLocalizations.of(context)!.noResultsFound,
                      style: const TextStyle(color: Colors.white),
                      textStyle: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const DefaultErrorWidget();
          }

        },
      ),
    );
  }
}
