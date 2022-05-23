import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uae_user/business_logic/user/category/category_cubit.dart';
import 'package:uae_user/constants/constant_methods.dart';

import '../styles/colors.dart';
import '../widgets/default_error_widget.dart';
import '../widgets/default_loading_indicator.dart';
import '../widgets/default_text.dart';

class ProductsInStockItem extends StatelessWidget {
  final int subCategoryId;
  final Function() onTap;
  ProductsInStockItem({Key? key,required this.onTap,required this.subCategoryId}) : super(key: key);
 
  late CategoryCubit _categoryCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CategoryCubit()..userSearch(page: 0,
      categoryId: subCategoryId
  ),
  child: BlocBuilder<CategoryCubit, CategoryStates>(
  builder: (context, state) {

    _categoryCubit = CategoryCubit.get(context);
    if (state is UserSearchSuccessState) {
      return InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.products.length, (index) => SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.network(
                        state.products[index].images.first,
                        fit: BoxFit.contain,
                      ),
                    ),),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 8.0,start: 5.0,end: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:const [
                          Icon(
                            Icons.favorite_outline,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Flexible(child: InkWell(
                        onTap: (){},
                        child: const Icon(Icons.add_shopping_cart_outlined,color: AppColors.lightBlue,))),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:List.generate(state.products.length, (index) => Expanded(
                              child: DefaultText(
                                text: state.products[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(fontFamily: 'Bukra-Regular',fontWeight: FontWeight.bold),
                              ),
                            ),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:const [
                              DefaultText(text: '${80.00} RS'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else if (state is UserSearchLoadingState) {
      return const DefaultLoadingIndicator();
    } else {
      return const DefaultErrorWidget();
    }
  },
),
);
  }
}
