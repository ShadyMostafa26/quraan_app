import 'package:flutter/material.dart';
import 'package:quraan_app/layout/home_layout.dart';
import 'package:quraan_app/shared/components/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), ()=> navigateAndFinish(context, const HomeLayout()) );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text(
                'Muslim App',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/islamic.png'),
            )
          ],
        ),
      ),
    );
  }
}
