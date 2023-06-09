// ignore_for_file: avoid_unnecessary_containers

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ulearning/main.dart';

import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_events.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      },
                      children: [
                        _page(
                          1,
                          context,
                          "Next",
                          "First see learning",
                          "Forget about other apps",
                          "assets/images/reading.png",
                        ),
                        _page(
                          2,
                          context,
                          "Next",
                          "Connect with everyone",
                          "Always keep in touch with your tutor!",
                          "assets/images/man.png",
                        ),
                        _page(
                          3,
                          context,
                          "Get Started",
                          "Learn Anywhere",
                          "Anytime, wnerever you want, wherever you are",
                          "assets/images/boy.png",
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page.toDouble(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title, String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(top: 10.h),
          alignment: Alignment.center,
          child: Text(
            subTitle,
            style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.sp, fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
