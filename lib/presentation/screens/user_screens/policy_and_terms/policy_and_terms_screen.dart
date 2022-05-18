import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/widgets/default_text.dart';

import '../../../../business_logic/shared/all_app_setting/all_app_setting_cubit.dart';
import '../../../styles/colors.dart';

class PolicyAndTermsScreen extends StatelessWidget {
  const PolicyAndTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllAppSettingCubit? cubit;
    return BlocProvider(
      create: (context) => AllAppSettingCubit()..getTerms(),
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
                      text: AppLocalizations.of(context)!.policyAndTerms,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontFamily: 'Bukra-Regular',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.lightBlue,
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/images/whiteLogo.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                BlocBuilder<AllAppSettingCubit, AllAppSettingStates>(
                  builder: (context, state) {
                    cubit = AllAppSettingCubit.get(context);
                    return ConditionalBuilder(
                      condition: cubit?.terms?.appInfo?.policy != null,
                      fallback: (context) => const Expanded(
                          child: Center(child: CircularProgressIndicator())),
                      builder:(context)=> Padding(
                        padding: const EdgeInsetsDirectional.all(12.0),
                        child: DefaultText(
                          text: '${cubit?.terms?.appInfo?.policy}',
                          maxLines: 100,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
