import 'package:bakery_app/utils/themeData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerField extends StatefulWidget {
  const BannerField({super.key, required this.list});
  final List<Widget> list;

  @override
  State<BannerField> createState() => _BannerFieldState();
}

class _BannerFieldState extends State<BannerField> with SingleTickerProviderStateMixin {
  RxInt activeIndex = 0.obs;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 24.h,
      child: Stack(
            children: [
              mainBannerSlider(widget.list),
              Align(alignment: Alignment.bottomCenter, child: indicator(widget.list.length))
            ],
      ),
    );
  }

  Widget mainBannerSlider(List<Widget> list){
    return CarouselSlider(
      items: list.map((element) => ScaleTransition(
                scale: Tween(begin: 1.0, end: 0.9).animate(CurvedAnimation(parent: _controller, curve: Curves.ease)),
                child: element)).toList(),
      options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    activeIndex.value = index;
                  },
                  height: 23.h,
                  // aspectRatio: 16/9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
          );
  }

  Widget indicator(int length) {
    return Obx(() => AnimatedSmoothIndicator(
          activeIndex: activeIndex.value,
          count: length,
          effect: JumpingDotEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: CC.mainColor,
              dotColor: CC.secondaryColor),
        ));
  }
}


