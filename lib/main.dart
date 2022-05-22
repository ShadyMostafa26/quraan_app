import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/modules/splash_screen/splash_screen.dart';
import 'package:quraan_app/shared/components/helpers.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';
import 'package:quraan_app/shared/network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(() {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAya()..getSurah()..getQurah()..getLoc(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays: [SystemUiOverlay.top]);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quraan',
            theme: ThemeData(
              fontFamily: 'Poppins',
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
