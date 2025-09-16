import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppProgressBar.dart';
import 'config/AppRoutes.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      builder:
          (context, child) => MaterialApp.router(
            routerConfig: AppRoutesHelper.router,
            title: "Pdd Flutter",
            showSemanticsDebugger: false,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            builder:
                (context, child) =>
                    AppProgressBarWrapper(child: SafeArea(child: child!)),
          ),
    );
  }
}
