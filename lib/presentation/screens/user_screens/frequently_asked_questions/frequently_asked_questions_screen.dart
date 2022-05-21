import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uae_user/presentation/views/faq_help_item.dart';
import '../../../../business_logic/user/faq_questions/faq_questions_cubit.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';
import '../../../widgets/default_text.dart';

class FrequentlyAskedQuestionsScreen extends StatelessWidget {
  const FrequentlyAskedQuestionsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => FaqQuestionsCubit()..userFaqQuestions(),
  child: SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
                  text: AppLocalizations.of(context)!.titleHelp,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          ],
        ),
      ),
      body: BlocBuilder<FaqQuestionsCubit, FaqQuestionsState>(
  builder: (context, state) {
    if (state is UserFaqQuestionsSuccessState) {
      return ListView.builder(itemBuilder: (context, index) => FAQHelpItem(
        questionText: state.faqs[index].question,
        answerText: state.faqs[index].answer,
      ),
      itemCount: state.faqs.length,
      );

    }  else if (state is UserFaqQuestionsLoadingState) {
      return const DefaultLoadingIndicator();
    } else {
      return const DefaultErrorWidget();
    }

  },
),
    )),
);
  }
}
