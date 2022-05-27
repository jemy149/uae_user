import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/business_logic/user/change_favorite/favorite_change_cubit.dart';
import 'package:uae_user/business_logic/user/get_favorite/get_favorite_cubit.dart';
import 'package:uae_user/presentation/views/user_favourites_item.dart';
import 'package:uae_user/presentation/widgets/DefaultSvg.dart';
import 'package:uae_user/presentation/widgets/default_error_widget.dart';
import 'package:uae_user/presentation/widgets/default_loading_indicator.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late GetFavoriteCubit _getFavoriteCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavoriteCubit()..getFavorite(),
        ),

      ],
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightBlue,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(text: AppLocalizations.of(context)!.fav),
                ],
              ),

            ),
            body: BlocListener<ChangeFavoriteCubit, ChangeFavoriteStates>(
              listener: (context, state) {
                if (state is FavoriteChangeSuccessState) {
                  _getFavoriteCubit.removeItem(state.productId);
                }
              },
              child: BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
                builder: (context, state) {
                  if (state is GetFavoriteSuccessState||state is RemoveItemState) {
                    _getFavoriteCubit = GetFavoriteCubit.get(context);
                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 20, bottom: 20),
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
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5),
                                  child: DefaultText(
                                    text:
                                        '(${_getFavoriteCubit.favoriteModel.products.length} items)',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 38.h),
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return UserFavouritesItem(
                                productModel: _getFavoriteCubit
                                    .favoriteModel.products[index]);
                          },
                              childCount: _getFavoriteCubit
                                  .favoriteModel.products.length),
                        ),
                      ],
                    );
                  } else if (state is GetFavoriteLoadingState) {
                    return const DefaultLoadingIndicator();
                  } else if (state is GetFavoriteEmptyState) {
                    return const Center(
                      child: DefaultSvg(
                        imagePath: 'assets/icons/add_to_favorite.svg',
                        height: 48,
                        width: 48,color: AppColors.lightBlue,
                      ),
                    );
                  } else {
                    return const DefaultErrorWidget();
                  }
                },
              ),
            )),
      ),
    );
  }
}
