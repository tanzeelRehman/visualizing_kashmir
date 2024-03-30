import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';

import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/language/languages.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/features/Language/view/language_page.dart';
import 'package:visualizing_kashmir/features/home/view/home_screen.dart';
import 'package:visualizing_kashmir/features/search/view/search_screens.dart';
import 'package:visualizing_kashmir/splash_screen.dart';
import 'dependency_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: GetMaterialApp(
            translations: Languages(),
            locale: const Locale('en', 'US'),
            theme: AppTheme.lightTheme,
            navigatorKey: navigatorKeyGlobal,
            debugShowCheckedModeBanner: false,
            title: 'Visualizing Kashmir',
            initialRoute: AppPages.splashPage,
            getPages: [
              GetPage(
                  name: AppPages.splashPage, page: () => const SplashScreen()),
              GetPage(
                name: AppPages.languagePage,
                page: () => const LanguagePage(),
              ),
              GetPage(
                name: AppPages.homePage,
                page: () => const HomeScreen(),
              ),
              GetPage(
                name: AppPages.searchPage,
                page: () => const SearchScreen(),
              ),
            ],
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
