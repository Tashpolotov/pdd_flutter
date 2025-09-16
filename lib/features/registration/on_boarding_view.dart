import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppButton.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppRoutes.dart';
import '../../config/SharedPrefsHelper.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> _onboardingData = [
    {
      'title': "Изучай ПДД!",
      'description': "Начни путешествие по миру ПДД и стань экспертом на дорогах.",
    },
    {
      'title': "Уроки на каждый день",
      'description': "Ежедневные уроки помогут тебе осваивать правила без перегрузки.",
    },
    {
      'title': "Получай награды!",
      'description': "Зарабатывай баллы и награды за успешное прохождение уроков!",
    },
    {
      'title': "Начни сейчас!",
      'description': "Присоединяйся и сделай первый шаг к безопасному вождению!",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return _buildPage(
                  imagePath: Assets.images.arrowLeft.path,
                  title: _onboardingData[index]['title']!,
                  description: _onboardingData[index]['description']!,
                  index: index,
                  isLastPage: index == _onboardingData.length - 1,
                );
              },
              onPageChanged: (int page) {
                _currentPageNotifier.value = page; // Обновление только в onPageChanged
              },
            ),
          ),
          _buildPageIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: AppButton(
              buttonText: _currentPageNotifier.value == _onboardingData.length - 1 ? 'Начать' : 'Дальше',
              onClick: () {
                if (_currentPageNotifier.value == _onboardingData.length - 1) {
                  String? token = SharedPrefsHelper.getToken();
                  if (token == null) {
                    context.go(AppRoutes.registrationPath);
                  } else {
                    context.go(AppRoutes.homePath);
                  }
                  SharedPrefsHelper.setOnboardingShown(true);
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imagePath,
    required String title,
    required String description,
    required int index,
    bool isLastPage = false,
  }) {
    return Padding(
      key: PageStorageKey('onboarding_page_$index'),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_onboardingData.length, (index) {
        return ValueListenableBuilder<int>(
          valueListenable: _currentPageNotifier,
          builder: (context, currentPage, child) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 30 : 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          },
        );
      }),
    );
  }
}