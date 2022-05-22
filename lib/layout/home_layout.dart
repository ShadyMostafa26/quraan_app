import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: (AppCubit.get(context).currentIndex ==2)? AppBar(
            title: Text('مواقيت الصلاه'),
            centerTitle: true,
          ) : null,
          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.blue,
              items:  [
                TabItem(icon: Image.asset('assets/images/home.png'), title: 'Home'),
                TabItem(icon: Image.asset('assets/images/holyQuran.png'), title: 'Quraan'),
              //  TabItem(icon: Image.asset('assets/images/audio.png'), title: 'Audio'),
                TabItem(icon: Image.asset('assets/images/mosque.png'), title: 'Prayer'),
              ],
              initialActiveIndex: 0,
              onTap: (index) => AppCubit.get(context).changeIndex(index),
            )
        );
      } ,
    );
  }
}
