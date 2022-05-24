import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/business_logic/user/my_addresses/my_addresses_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';
import 'package:uae_user/constants/enums.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/presentation/views/user_addresses_card_item.dart';
import 'package:uae_user/presentation/widgets/default_error_widget.dart';
import 'package:uae_user/presentation/widgets/default_loading_indicator.dart';

import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

class UserAddressesScreen extends StatefulWidget {
  const UserAddressesScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressesScreen> createState() => _UserAddressesScreenState();
}

class _UserAddressesScreenState extends State<UserAddressesScreen> {
  late MyAddressesCubit _myAddressesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAddressesCubit()..getMyAddresses(),
      child: SafeArea(
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
                      text: AppLocalizations.of(context)!.myAddresses,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
          ),
          body: Builder(
            builder: (context) {
              _myAddressesCubit = MyAddressesCubit.get(context);

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 20.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ADDING_ADDITIONAL_LOCATION_SCREEN_R,
                                    arguments: _myAddressesCubit);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Flexible(
                                      child: Icon(Icons.add_box_outlined)),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 15.0),
                                    child: DefaultText(
                                        text: AppLocalizations.of(context)!
                                            .addNewAddress),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocConsumer<MyAddressesCubit, MyAddressesState>(
                    listener: (context, state) {
                      if (state is UserDeleteAddressSuccessState) {
                        showToastMsg(
                            msg: state.message, toastState: ToastStates.SUCCESS);
                      } else if (state is UserEditAddressSuccessState) {
                        showToastMsg(
                            msg: state.message, toastState: ToastStates.SUCCESS);
                      }else if (state is UserEditAddAddressErrorState) {
                        showToastMsg(
                            msg: state.message, toastState: ToastStates.SUCCESS);
                      }

                    },
                    builder: (context, state) {
                      if (state is UserGetMyAddressesSuccessState ||
                          state is UserDeleteAddressSuccessState ||
                          state is UserEditAddressSuccessState ||
                          state is UserEditAddAddressErrorState) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => UserAddressesCardItem(
                              myAddress: _myAddressesCubit
                                  .myAddressesModel.myAddress[index],
                              myAddressesCubit: _myAddressesCubit,
                              index: index,
                            ),
                            childCount:
                                _myAddressesCubit.myAddressesModel.myAddress.length,
                          ),
                        );
                      } else if (state is UserGetMyAddressesLoadingState ||
                          state is UserDeleteAddressLoadingState) {
                        return const SliverFillRemaining(
                            child: DefaultLoadingIndicator());
                      } else if (state is UserGetMyAddressesEmptyState) {
                        return const SliverFillRemaining(
                            child: Icon(
                          Icons.add_location_alt_outlined,
                          size: 48,
                        ));
                      } else {
                        return const SliverFillRemaining(
                            child: DefaultErrorWidget());
                      }
                    },
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
