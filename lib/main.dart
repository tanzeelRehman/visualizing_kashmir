import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';

import 'package:visualizing_kashmir/core/globle/globle.dart';
import 'package:visualizing_kashmir/core/language/languages.dart';
import 'package:visualizing_kashmir/core/theme/app_theme.dart';
import 'package:visualizing_kashmir/features/Headline/views/headline_screen.dart';
import 'package:visualizing_kashmir/features/Hero/view/know_your_hero_detail.dart';
import 'package:visualizing_kashmir/features/Language/view/language_page.dart';
import 'package:visualizing_kashmir/features/home/view/home_screen.dart';
import 'package:visualizing_kashmir/features/search/view/search_screens.dart';
import 'package:visualizing_kashmir/features/textDetails/view/text_details_screen.dart';
import 'package:visualizing_kashmir/features/todayHistory/views/today_in_history_screen.dart';
import 'package:visualizing_kashmir/features/videoAudioDetails/views/video_audio_details.dart';
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
            initialRoute: AppPages.todayInHistoryPage,
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
                page: () => SearchScreen(),
              ),
              GetPage(
                name: AppPages.videoAudioPage,
                page: () => const VideoAudioDetails(),
              ),
              GetPage(
                name: AppPages.knowYourHeroPage,
                page: () => const KnowYourHeroDetail(),
              ),
              GetPage(
                name: AppPages.textDetailsPage,
                page: () => const TextDetailsScreen(),
              ),
              GetPage(
                name: AppPages.headLinePage,
                page: () => const HeadLineScreen(),
              ),
              GetPage(
                name: AppPages.todayInHistoryPage,
                page: () => const TodayInHistory(),
              ),
            ],
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
