import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomeCarouselSlider extends StatefulWidget {
  const CustomeCarouselSlider({Key? key}) : super(key: key);

  @override
  _CustomeCarouselSliderState createState() => _CustomeCarouselSliderState();
}

class _CustomeCarouselSliderState extends State<CustomeCarouselSlider> {
  int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 220,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval:const Duration(seconds: 3),
            autoPlayAnimationDuration:const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder:
              (BuildContext context, int index, int realIndex) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Image.asset('assets/images/fruits.png'),
                ),
              ), itemCount: 3,
        ),
        Center(
          child: AnimatedSmoothIndicator(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            count: 3,
            activeIndex: activeIndex,
            effect: const ScrollingDotsEffect(
              fixedCenter: true,
              maxVisibleDots: 7,
              dotColor: Colors.black12,
              activeDotColor: Colors.black,
              dotHeight: 6,
              dotWidth: 9,
              spacing: 6,
            ),
          ),
        ),
      ],
    );
  }
}
