import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:uae_user/constants/screens.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/delivery_details_screen_args.dart';
import 'package:uae_user/presentation/router/arguments/user_arguments/payment_method_screen_args.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';
import 'package:uae_user/presentation/widgets/delivery_details_form_field.dart';
import '../../../../business_logic/user/check_distance/check_distance_cubit.dart';
import '../../../../business_logic/user/my_addresses/my_addresses_cubit.dart';
import '../../../../constants/constant_methods.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/screens.dart';
import '../../../../constants/shared_preferences_keys.dart';
import '../../../../data/data_provider/local/cache_helper.dart';
import '../../../../data/models/shared_models/shared_classes/api_address.dart';
import '../../../../data/models/user_models/cart/get_my_cart_model.dart';
import '../../../styles/colors.dart';
import '../../../widgets/custome_drop_down_list_inner_text_widget.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class DeliveryDetailsScreen extends StatefulWidget {

 final  DeliveryDetailsScreenArgs deliveryDetailsScreenArgs;

  const DeliveryDetailsScreen({Key? key, required this.deliveryDetailsScreenArgs,})
      : super(key: key);

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController additionalInstructionsController =
      TextEditingController();
  final GlobalKey<FormState> deliveryDetailsFormKey = GlobalKey<FormState>();

  bool isTrue = false;
  String? addressValue;
  late MyAddressesCubit _myAddressesCubit;
   late CheckDistanceCubit _checkDistanceCubit ;


  @override
  void initState() {
    nameController.text = CacheHelper.getDataFromSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY)
        .toString();
    emailController.text =
        CacheHelper.getDataFromSP(key: SharedPreferencesKeys.SP_ACCOUNT_E_MAIL)
            .toString();
    phoneNumberController.text = CacheHelper.getDataFromSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY)
        .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MyAddressesCubit(),
          ),
          BlocProvider(
            create: (context) => CheckDistanceCubit(),
          ),
        ],
        child: BlocListener<CheckDistanceCubit, CheckDistanceState>(
          listener: (context, state) {
            if (state is CheckDistanceSuccessState) {
              _checkDistanceCubit = CheckDistanceCubit.get(context);
              setState(() {

                addressValue = state.apiAddress.address;
                ApiAddress address = state.apiAddress ;
                isTrue = !isTrue;
              });
            } else if (state is CheckDistanceErrorState) {
              showToastMsg(msg: state.message, toastState: ToastStates.ERROR);
            }
          },
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
                        text: AppLocalizations.of(context)!.deliveryDetails,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontFamily: 'Bukra-Regular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                ],
              ),
            ),
            body: Builder(builder: (context) {
              _myAddressesCubit = MyAddressesCubit.get(context);

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: deliveryDetailsFormKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isTrue = !isTrue;
                                });
                                if (isTrue) {
                                  _myAddressesCubit.getMyAddresses();
                                }
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(25)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: DefaultText(
                                        maxLines: 2,
                                        text: addressValue ??
                                            AppLocalizations.of(context)!
                                                .chooseFromMyAddresses,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                color: AppColors.grey
                                                    .withOpacity(0.6)),
                                      )),
                                      Visibility(
                                          replacement: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: AppColors.lightBlue,
                                          ),
                                          visible: isTrue,
                                          child: const Icon(
                                            Icons.keyboard_arrow_up_outlined,
                                            color: AppColors.lightBlue,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isTrue,
                              child: BlocBuilder<MyAddressesCubit,
                                  MyAddressesState>(
                                builder: (context, state) {
                                  if (state is UserGetMyAddressesSuccessState) {
                                    return Visibility(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      ADDING_ADDITIONAL_LOCATION_SCREEN_R,
                                                      arguments:
                                                          _myAddressesCubit);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Expanded(
                                                      child: DefaultText(
                                                          text: AppLocalizations
                                                                  .of(context)!
                                                              .chooseFromTheMap,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color:
                                                          AppColors.lightBlue,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                                child: ListView.builder(
                                                  itemBuilder: (context,
                                                          index) =>
                                                      CustomeDropDownListInnerTextWidget(
                                                    myAddressModel:
                                                        _myAddressesCubit
                                                            .myAddressesModel
                                                            .myAddress[index],
                                                  ),
                                                  itemCount: _myAddressesCubit
                                                      .myAddressesModel
                                                      .myAddress
                                                      .length,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (state
                                      is UserGetMyAddressesLoadingState) {
                                    return const DefaultLoadingIndicator();
                                  } else if (state
                                      is UserGetMyAddressesEmptyState) {
                                    return const Icon(
                                      Icons.add_location_alt_outlined,
                                      size: 48,
                                    );
                                  } else {
                                    return const DefaultErrorWidget();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: DeliveryDetailsFormField(
                            backgroundColor: AppColors.grey.withOpacity(0.3),
                            radius: 25,
                            height: 100,
                            controller: phoneNumberController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return AppLocalizations.of(context)!.required;
                              }
                            },
                            keyboardType: TextInputType.number,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: DeliveryDetailsFormField(
                            backgroundColor: AppColors.grey.withOpacity(0.3),
                            radius: 25,
                            height: 100,
                            controller: emailController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return AppLocalizations.of(context)!.required;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            hintText: AppLocalizations.of(context)!.email,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: DeliveryDetailsFormField(
                            backgroundColor: AppColors.grey.withOpacity(0.3),
                            radius: 25,
                            height: 100,
                            controller: nameController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return AppLocalizations.of(context)!.required;
                              }
                            },
                            keyboardType: TextInputType.name,
                            hintText: AppLocalizations.of(context)!.name,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: DeliveryDetailsFormField(
                            backgroundColor: AppColors.grey.withOpacity(0.3),
                            radius: 25,
                            height: 100,
                            controller: additionalInstructionsController,
                            validator: (_) {},
                            keyboardType: TextInputType.text,
                            hintText: AppLocalizations.of(context)!
                                .addressInstructions,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultMaterialButton(
                                text: AppLocalizations.of(context)!.confirm,
                                onTap: () {
                                  if (deliveryDetailsFormKey.currentState!
                                      .validate() && addressValue != null) {
                                    Navigator.pushNamed(
                                        context, PAYMENT_METHOD_SCREEN_R,
                                        arguments: PaymentMethodScreenArgs(
                                          myAddressesModel: _myAddressesCubit.myAddressesModel,
                                          checkDistanceModel: _checkDistanceCubit.checkDistanceModel,
                                            getMyCartModel:widget.deliveryDetailsScreenArgs.getMyCartModel,
                                            address: addressValue.toString(),
                                            phone: phoneNumberController.text,
                                            email: emailController.text,
                                            name: nameController.text,
                                            additionalInstructions:
                                                additionalInstructionsController
                                                    .text,

                                        ));
                                  }
                                },
                                height: 60,
                                width: 250,
                                color: AppColors.lightBlue,
                                textColor: Colors.white,
                                fontSize: 18,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
