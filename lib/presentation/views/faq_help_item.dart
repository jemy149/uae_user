import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../widgets/default_text.dart';

class FAQHelpItem extends StatefulWidget {
  bool isTrue =false ;
  final String questionText;
  final String answerText;
   FAQHelpItem({Key? key,required this.questionText,required this.answerText,}) : super(key: key);



  @override
  State<FAQHelpItem> createState() => _FAQHelpItemState();
}

class _FAQHelpItemState extends State<FAQHelpItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          setState(() {
            widget.isTrue =  !widget.isTrue;
          });
        },
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DefaultText(
                          maxLines: 5,
                          text: widget.questionText,
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.isTrue,
                          child:const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 30,
                        color: AppColors.lightBlue,
                      ),
                      replacement: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                        color: AppColors.lightBlue,
                      ),
                      ),

                    ],
                  ),
                ),
                Visibility(
                  visible: widget.isTrue,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 10.0),
                    child: DefaultText(
                      text: widget.answerText,
                      maxLines: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
