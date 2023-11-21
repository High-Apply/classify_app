import 'package:carousel_slider/carousel_slider.dart';
import 'package:classify_app/styles/custom_color_style.dart';
import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<SlideItem> sliderItems = [
      const SlideItem(
        title: '새로운 교육, 새로운 앱',
        body: '전면 개정되는 교육 제도에 알맞게 새로운 어플리케이션을 사용해보세요.',
        image: 'teacher',
        imageSize: 350,
      ),
      const SlideItem(
        title: '고교학점제 지원',
        body: '개인별 시간표와 선택 과목을 앱 안에서 빠르고 편리하게 관리하세요.',
        image: 'hscredit_logo',
        imageSize: 350,
      ),
      const SlideItem(
        title: '',
        body: '공유 시간표 기능을 사용하여 과제, 시험 일정을 친구들과 공유해보세요.',
        image: 'calendar',
        imageSize: 350,
      ),
      const SlideItem(
        title: '',
        body: '여러분의 미래를 그려나가는 데 필요한 도구들을 사용해보세요.',
        image: 'learning',
        imageSize: 350,
      ),
    ];

    Widget indicator() => Expanded(
      child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: sliderItems.length,
              effect: JumpingDotEffect(
                  dotWidth: 6.5,
                  dotHeight: 6.5,
                  activeDotColor: CustomColor.midNight,
                  dotColor: CustomColor.midNight.withOpacity(0.6)),
            ),
          ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(
                (double.infinity - 70), 10, 0, 0),
            child: Logo(),
          ),
          const SizedBox(
            height: 80,
          ),
          CarouselSlider.builder(
              itemCount: sliderItems.length,
              itemBuilder: (BuildContext context, int idx, int realIdx) {
                return sliderItems[idx];
              },
              options: CarouselOptions(
                  height: 500,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (int idx, CarouselPageChangedReason reason) {
                    setState(() {
                      _currentPage = idx;
                    });
                  })),
          const Expanded(child: SizedBox()),
          SizedBox(
              width: (MediaQuery.of(context).size.width / 3 + 20),
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLoginScreen()));
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white)),
                child: Text(
                  '로그인',
                  style: CustomTextStyle.callout.copyWith(
                      fontWeight: FontWeight.w800,
                      color: CustomColor.midNight)
                ),
              )),
          indicator(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logos/logo_midnight.svg',
      width: 40,
      height: 40,
    );
  }
}

class SlideItem extends StatelessWidget {
  final String? image;
  final double imageSize;
  final String title;
  final String body;

  const SlideItem({
    Key? key,
    required this.image,
    required this.imageSize,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/images/$image.png',
        width: imageSize,
        height: imageSize,
      ),
      const SizedBox(
        height: 40,
      ),
      Text(
        title,
        style: CustomTextStyle.titleLarge
            .copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: (MediaQuery.of(context).size.width - 100),
        child: Text(
          textAlign: TextAlign.center,
          body,
          style: CustomTextStyle.body,
        ),
      )
    ]);
  }
}
