import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:uae_user/constants/constants.dart';
import 'package:uae_user/presentation/views/filter_list_tile_item.dart';
import 'package:uae_user/presentation/widgets/default_material_button.dart';
import '../../../styles/colors.dart';
import '../../../widgets/default_text.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isTrue = true;

  late SfRangeValues _initialValues;

  late double firstSliderValue;

  late double secondSliderValue;

  late double max;

  late double min;

  bool isBrand = true;

  @override
  void initState() {
    min = 1;
    max = 1000;
    _initialValues = SfRangeValues(max * 0.2, max * 0.8);
    firstSliderValue = max * 0.2;
    secondSliderValue = max * 0.8;
    super.initState();
  }

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
                  text: AppLocalizations.of(context)!.filtering,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontFamily: 'Bukra-Regular',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          ],
        ),
      ),
      body: Row(
        children: [
          Flexible(
            child: Container(
              color: AppColors.lightBlue,
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/filter.png',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                        DefaultText(
                          text: AppLocalizations.of(context)!.filtering,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                  ),
                        )
                      ],
                    ),
                    height: 40,
                  ),
                  FilterListTileItem(
                    text: AppLocalizations.of(context)!.brand,
                    isColorTrue: isBrand,
                    onTap: () {
                      setState(() {
                        isBrand = true;
                      });

                    },
                  ),
                  FilterListTileItem(
                    text: AppLocalizations.of(context)!.price,
                    isColorTrue: !isBrand,
                    onTap: () {
                      setState(() {
                        isBrand = false;
                      });

                    },
                  ),
                ],
              ),
            ),
          ),
         isBrand == true? Expanded(
            flex: 2,
            child: Container(
                color: AppColors.blue,
                child: ListView.builder(
                  itemBuilder: (context, index) => CheckboxListTile(
                    value: isTrue,
                    onChanged: (p) {},
                    title: DefaultText(
                      text: 'item name',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  itemCount: 30,
                )),
          ) :
          Expanded(
            flex: 2,
            child: Container(
                color: AppColors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bukra-Regular'),
                        text: AppLocalizations.of(context)!.priceRange,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            bottom: 60.0, top: 10.0),
                        child: DefaultText(
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                          text:
                              '${firstSliderValue.round().toString()} - ${secondSliderValue.round().toString()}',
                        ),
                      ),
                      SfRangeSelectorTheme(
                        data: SfRangeSelectorThemeData(
                            tooltipBackgroundColor: AppColors.lightBlue,
                            activeTrackColor: AppColors.lightBlue,
                            inactiveTrackColor: AppColors.lightBlue,
                            thumbColor: Colors.white,
                            inactiveRegionColor: Colors.transparent,
                            activeRegionColor: Colors.white38),
                        child: SfRangeSelector(
                          min: min,
                          max: max,
                          initialValues: _initialValues,
                          enableTooltip: true,
                          onChanged: (value) {
                            setState(() {
                              firstSliderValue = value.start;
                              secondSliderValue = value.end;
                            });
                          },
                          child: SizedBox(
                            child: buildChart(),
                            height: 100,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: DefaultMaterialButton(
                          text: AppLocalizations.of(context)!.filtering,
                          onTap: () {},
                          height: 60,
                          width: 120,
                          fontSize: 20,
                          textColor: Colors.white,
                          color: AppColors.lightBlue,
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }

  Widget buildChart() {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
      series: <ChartSeries>[
        ColumnSeries<Data, double>(
            dataSource: getChartData(),
            color: AppColors.lightBlue,
            trackBorderColor: Colors.transparent,
            trackColor: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            width: 0.6,
            spacing: 0.4,
            xValueMapper: (Data sales, int index) => sales.x,
            yValueMapper: (Data sales, int index) => sales.y)
      ],
    );
  }

  List<Data> getChartData() {
    return <Data>[
      Data(x: max * 0.05, y: 100),
      Data(x: max * 0.1, y: 200),
      Data(x: max * 0.15, y: 150),
      Data(x: max * 0.2, y: 300),
      Data(x: max * 0.25, y: 250),
      Data(x: max * 0.3, y: 170),
      Data(x: max * 0.35, y: 260),
      Data(x: max * 0.4, y: 90),
      Data(x: max * 0.45, y: 180),
      Data(x: max * 0.5, y: 120),
      Data(x: max * 0.55, y: 230),
      Data(x: max * 0.6, y: 138),
      Data(x: max * 0.65, y: 290),
      Data(x: max * 0.7, y: 220),
      Data(x: max * 0.75, y: 129),
      Data(x: max * 0.8, y: 226),
      Data(x: max * 0.85, y: 56),
      Data(x: max * 0.9, y: 122),
      Data(x: max * 0.95, y: 195),
    ];
  }
}

// Expanded(
//             flex: 2,
//             child: Container(
//                 color: AppColors.blue,
//                 child: ListView.builder(
//                   itemBuilder: (context, index) => CheckboxListTile(
//                     value: isTrue,
//                     onChanged: (p) {},
//                     title: const DefaultText(
//                       text: 'item name',
//                     ),
//                     controlAffinity: ListTileControlAffinity.leading,
//                   ),
//                   itemCount: 30,
//                 )),
//           )

class Data {
  Data({required this.x, required this.y});

  final double x;
  final double y;
}
