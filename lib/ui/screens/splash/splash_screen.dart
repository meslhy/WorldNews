import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  static const String roteName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), (){
      Navigator.pushReplacementNamed(context, HomeScreen.roteName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.splashBackground),
              fit: BoxFit.cover),
        ),
          ),
          Center(
            child: Lottie.asset("assets/icons/news_splash.json"),
          ),
        ],
      ),
          backgroundColor :  AppColors.white,
    );
  }
}
