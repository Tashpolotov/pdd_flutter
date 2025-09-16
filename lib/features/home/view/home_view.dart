import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/appbar_custom.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../components/LevelProgressCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = PageController(viewportFraction: 0.90);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        titleAppBar: "Home",
        showBackButton: false,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 24, left: 24),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      S.of(context)!.hello_i_am_enot_pdd,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SvgPicture.asset(
                  Assets.images.onboard1.path,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 16),
                child: SizedBox(
                  height: 240,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      bool isFirstOrLast = index == 0 || index == 4;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isFirstOrLast ? 0 : 8,
                        ),
                        child: LevelProgressCard(
                          level: "Уровень ${index + 1}",
                          theme: "Тема: Общее положение",
                          progressText: "${(index + 1) * 40} из 200",
                          progressValue: (index + 1) / 5,
                          lessonsText: "Пройдено уроков: ${index + 1} из 10",
                          onSeeLessonsPressed: () {
                            print("Перейти к урокам уровня ${index + 1}");
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


