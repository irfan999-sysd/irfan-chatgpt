// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:ai_app/constants/colors.dart';
// import 'package:ai_app/custom_widget/custom_text.dart';
// import 'package:ai_app/view/ai_chat/ai_chat.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:intl/intl.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   String formatDate(DateTime date) {
//     final DateFormat dayFormat = DateFormat('EEE'); // e.g., Sat
//     final DateFormat dayMonthFormat = DateFormat('d MMM yyyy'); // e.g., 22 Jun 2024
//     return '${dayFormat.format(date).toLowerCase()}, ${dayMonthFormat.format(date)}';
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: Stack(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.center,
//                 colors: [
//                   Color(0xFF00EE26),
//                   Color(0xFF8E8930),
//                   Color(0xFFFF3939),
//                 ],
//               ),
//             ),
//             child: Column(
//               children: [
//                 SizedBox(height: 120..h),
//                 Text(
//                   'Cloudy',
//                   style: TextStyle(
//                     color: AppColor.white,
//                     fontSize: 32..sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.only(top: 25,bottom: 10),
//               decoration: BoxDecoration(
//                   color: Theme.of(context).scaffoldBackgroundColor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30..r),
//                     topRight: Radius.circular(30..r),
//                   )
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           child: Row(
//                             children: [
//                               SvgPicture.asset('assets/icons/cloud.svg'),
//                               SizedBox(width: 5.w),
//                               Text(
//                                 '40°',
//                                 style: TextStyle(
//                                   color: Theme.of(context).primaryColor,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 32.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Text14(
//                               text: 'Partly cloudy',
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             Text(
//                               formatDate(DateTime.now()),
//                               style: TextStyle(
//                                 color: Theme.of(context).shadowColor,
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 40),
//                         Container(
//                           width:20,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 15..h),
//                   Divider(
//                     color: Theme.of(context).shadowColor,
//                     thickness: 2,
//                   ),
//                   SizedBox(height: 20..h),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Curiosity is key',
//                               style: TextStyle(
//                                 color: AppColor.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12..sp,
//                               ),
//                             ),
//                             GestureDetector(
//                                 onTap: (){
//                                   AdaptiveTheme.of(context).toggleThemeMode();
//                                 },
//                                 child: SvgPicture.asset('assets/icons/sync.svg',color: Theme.of(context).primaryColor,)),
//                           ],
//                         ),
//                         SizedBox(height: 20..h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                                 width:MediaQuery.of(context).size.width*.43,
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).scaffoldBackgroundColor,
//                                     borderRadius: BorderRadius.circular(13..r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Theme.of(context).shadowColor,
//                                         blurRadius: 4,
//                                       )
//                                     ]
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 32..w,
//                                       height: 32..h,
//                                       decoration: BoxDecoration(
//                                         color: AppColor.white,
//                                         border: Border.all(
//                                           color: Color(0xFFF1F2F4),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6..r),
//                                       ),
//                                       child: Center(
//                                           child: SvgPicture.asset('assets/icons/bubble.svg')
//                                       ),
//                                     ),
//                                     SizedBox(width: 5..w),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Daily ideas',
//                                           style: TextStyle(
//                                               color: Theme.of(context).primaryColor,
//                                               fontSize: 13..sp,
//                                               fontWeight: FontWeight.w500
//                                           ),
//                                         ),
//                                         Text(
//                                           'Get daily ideas',
//                                           style: TextStyle(
//                                             fontSize: 10..sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: Theme.of(context).shadowColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                             ),
//                             Container(
//                                 width:MediaQuery.of(context).size.width*.43,
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).scaffoldBackgroundColor,
//                                     borderRadius: BorderRadius.circular(13..r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Theme.of(context).shadowColor,
//                                         blurRadius: 4,
//                                       )
//                                     ]
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 32..w,
//                                       height: 32..h,
//                                       decoration: BoxDecoration(
//                                         color: AppColor.white,
//                                         border: Border.all(
//                                           color: Color(0xFFF1F2F4),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6..r),
//                                       ),
//                                       child: Center(
//                                           child: SvgPicture.asset('assets/icons/food.svg')
//                                       ),
//                                     ),
//                                     SizedBox(width: 5..w),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Food recipe',
//                                           style: TextStyle(
//                                               color: Theme.of(context).primaryColor,
//                                               fontSize: 13..sp,
//                                               fontWeight: FontWeight.w500
//                                           ),
//                                         ),
//                                         Text(
//                                           'Inspired recipes',
//                                           style: TextStyle(
//                                             fontSize: 10..sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: Theme.of(context).shadowColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 12..h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                                 width:MediaQuery.of(context).size.width*.43,
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).scaffoldBackgroundColor,
//                                     borderRadius: BorderRadius.circular(13..r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Theme.of(context).shadowColor,
//                                         blurRadius: 4,
//                                       )
//                                     ]
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 32..w,
//                                       height: 32..h,
//                                       decoration: BoxDecoration(
//                                         color: AppColor.white,
//                                         border: Border.all(
//                                           color: Color(0xFFF1F2F4),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6..r),
//                                       ),
//                                       child: Center(
//                                           child: SvgPicture.asset('assets/icons/pencil.svg')
//                                       ),
//                                     ),
//                                     SizedBox(width: 5..w),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Help with essay',
//                                           style: TextStyle(
//                                               color: Theme.of(context).primaryColor,
//                                               fontSize: 13..sp,
//                                               fontWeight: FontWeight.w500
//                                           ),
//                                         ),
//                                         Text(
//                                           'School essay',
//                                           style: TextStyle(
//                                             fontSize: 10..sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: Theme.of(context).shadowColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                             ),
//                             Container(
//                                 width:MediaQuery.of(context).size.width*.43,
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).scaffoldBackgroundColor,
//                                     borderRadius: BorderRadius.circular(13..r),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Theme.of(context).shadowColor,
//                                         blurRadius: 4,
//                                       )
//                                     ]
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 32..w,
//                                       height: 32..h,
//                                       decoration: BoxDecoration(
//                                         color: AppColor.white,
//                                         border: Border.all(
//                                           color: Color(0xFFF1F2F4),
//                                         ),
//                                         borderRadius: BorderRadius.circular(6..r),
//                                       ),
//                                       child: Center(
//                                           child: SvgPicture.asset('assets/icons/suggestion.svg')
//                                       ),
//                                     ),
//                                     SizedBox(width: 5..w),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Fun suggestion',
//                                           style: TextStyle(
//                                               color: Theme.of(context).primaryColor,
//                                               fontSize: 13..sp,
//                                               fontWeight: FontWeight.w500
//                                           ),
//                                         ),
//                                         Text(
//                                           'Funny Ideas',
//                                           style: TextStyle(
//                                             fontSize: 10..sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: Theme.of(context).shadowColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 12..h),
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => AiChat()));
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: 60..h,
//                             decoration: BoxDecoration(
//                               color: Colors.transparent,
//                               borderRadius: BorderRadius.circular(15..r),
//                               border: GradientBoxBorder(
//                                 width: 2,
//                                 gradient: LinearGradient(colors: [
//                                   AppColor.color1,
//                                   AppColor.color2,
//                                   AppColor.color3,
//                                 ],
//                                 ),
//                               ),),
//                             child: Center(
//                               child: Text(
//                                 'AI Chat',
//                                 style: TextStyle(
//                                   color: Theme.of(context).primaryColor,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 32.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30..h),
//                   Divider(
//                     color: Theme.of(context).shadowColor,
//                     thickness: 2,
//                   ),
//                   SizedBox(height: 15..h),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy  ',
//                           style: TextStyle(
//                             color: Theme.of(context).shadowColor,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10..sp,
//                           ),
//                         ),
//                         Text(
//                           'Learn more',
//                           style: TextStyle(
//                             color: Theme.of(context).primaryColor,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 10..sp,
//                           ),
//                         ),
//                         SizedBox(height: 15..h),
//                         Container(
//                           width: 120..w,
//                           height: 4..h,
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).primaryColor,
//                             borderRadius: BorderRadius.circular(5..r),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }