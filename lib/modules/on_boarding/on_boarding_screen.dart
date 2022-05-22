import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quraan_app/layout/home_layout.dart';
import 'package:quraan_app/shared/components/components.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<PageViewModel> list = [
      PageViewModel(
        title:"Read Quraan",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [


          ],
        ),
        image: Image.asset('assets/images/quran.png'),
      ),
      PageViewModel(
        title:"Pray",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [


          ],
        ),
        image: Image.asset('assets/images/prayer.png'),
      ),
    ];
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: IntroductionScreen(
            pages: list,
            onDone: () {
              navigateTo(context, const HomeLayout());
            },
            onSkip: () {

            },
            showBackButton: false,
            showSkipButton: true,
            skip: const Text('SKIP'),
            next: const Icon(Icons.arrow_forward_ios_sharp),
            done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Theme.of(context).primaryColor,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                )
            ),
          ),
        );
      },
    );
  }
}
