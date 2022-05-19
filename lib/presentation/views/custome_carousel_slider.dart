import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uae_user/data/models/user_models/ads/ads_model.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<Ads> groups ;
   const CustomCarouselSlider({Key? key,required this.groups,}) : super(key: key);


  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int activeIndex ;
  @override
  void initState() {
    activeIndex =0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 220,
            enableInfiniteScroll: true,
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Image.network(widget.groups[index].image,fit: BoxFit.contain,),
                ),
              ), itemCount: widget.groups.length,
        ),
        Center(
          child: AnimatedSmoothIndicator(
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
            count: widget.groups.length,
            activeIndex: activeIndex,
            effect: const ScrollingDotsEffect(
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
