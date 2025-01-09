import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ai_app/constants/colors.dart';
import 'package:ai_app/constants/gemini_api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/splash_screen/splash_screen.dart';

void main() {
  Gemini.init(apiKey: Gemini_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return AdaptiveTheme(
          light: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColor.white,
            primaryColor: AppColor.black,
            shadowColor: AppColor.border_color,
            //hintColor: AppColor.border_color,
            //focusColor: AppColor.black,
            // cardColor: AppColors.BSubColor,
            // dividerColor: Color(0xFFC8C8C8),
            // highlightColor: Color(0xFF0047CC),
            // hoverColor: AppColors.buttonColor,
            // indicatorColor: AppColors.insideBorder

          ),
          dark: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.white,
            primaryColor: AppColors.black,
            shadowColor: AppColors.black,
            //hintColor: AppColors.color3,
            //focusColor: AppColors.black,
            // cardColor: AppColor.BSubColor,
            // dividerColor: Color(0xFFC8C8C8),
            // highlightColor: Colors.white,
            // hoverColor: AppColor.buttonColor,
            // indicatorColor: AppColor.insideBorder,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}