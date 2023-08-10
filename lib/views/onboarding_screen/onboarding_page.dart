import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/onboarding_screen/onboarding_bottom.dart';
import 'package:four_hours_client/views/onboarding_screen/pages/fifth_page.dart';
import 'package:four_hours_client/views/onboarding_screen/pages/first_page.dart';
import 'package:four_hours_client/views/onboarding_screen/pages/fourth_page.dart';
import 'package:four_hours_client/views/onboarding_screen/pages/second_page.dart';
import 'package:four_hours_client/views/onboarding_screen/pages/third_page.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  static const String path = '/onboarding';

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.page!.round() != currentPage) {
        setState(() {
          currentPage = pageController.page!.round();
        });
      }
    });
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonWrapper(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              children: const [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
                FourthPage(),
                FifthPage()
              ],
            ),
          ),
          OnboardingBottom(
            nextPage: nextPage,
            currentPage: currentPage,
          )
        ],
      ),
    );
  }
}
