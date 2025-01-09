import 'package:ai_app/constants/colors.dart';
import 'package:ai_app/custom_widget/custom_text.dart';
import 'package:ai_app/view/ai_chat/ai_chat.dart';
import 'package:ai_app/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Container(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: 3,
              onPageChanged: (value) => {
                setState(() {
                  _currentIndex = value;
                })
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 120..h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                            child: Image.asset('assets/images/splash.png')),
                      ),
                      SizedBox(height: 90..h),
                      Text(
                        'Your own',
                        style: TextStyle(
                          fontSize: 36..sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.white,
                        ),
                      ),
                      GradientText(
                        'AI Assistant',
                        style: TextStyle(
                            fontSize: 36..sp,
                            fontWeight: FontWeight.w600
                        ),
                        colors: [
                          AppColor.color1,
                          AppColor.color2,
                          AppColor.color3,
                        ],
                      ),
                      SizedBox(height: 25..h),
                      Text14(
                        text: 'CleverUP can answer for followup \n'
                            'questions and be your own advisor',
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: _currentIndex == index ? 16 : 4,
                        height: 3.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.white,
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AiChat()));
                    },
                    child: Container(
                      width: 60..w,
                      height: 60..h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          width: 2,
                          gradient: LinearGradient(colors: [
                            AppColor.color1,
                            AppColor.color2,
                            AppColor.color3,
                          ],
                          ),
                        ),),
                      child: Center(child: SvgPicture.asset('assets/icons/arrow.svg'),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}