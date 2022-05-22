import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:quraan_app/models/aya_model.dart';
import 'package:quraan_app/models/juz_model.dart';
import 'package:quraan_app/models/qurah_model.dart';
import 'package:quraan_app/models/surah_model.dart';
import 'package:quraan_app/modules/audio/audio_screen.dart';
import 'package:quraan_app/modules/home/home_screen.dart';
import 'package:quraan_app/modules/prayer/prayer_screen.dart';
import 'package:quraan_app/modules/quraan/quraan_screen.dart';
import 'package:quraan_app/shared/cubit/states.dart';
import 'package:quraan_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const QuraanScreen(),
    // const AudioScreen(),
     PrayerScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndex());
  }

  late int ayaNumber;
  AyaModel? ayaModel;

  void getAya() {
    Random random = Random();
    ayaNumber = random.nextInt(6236) + 1;

    DioHelper.getData(
      url: 'ayah/$ayaNumber/editions/quran-uthmani,en.asad,en.pickthall',
    ).then((value) {
      ayaModel = AyaModel.fromJson(value.data);
      emit(GetAyaSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAyaErrorState());
    });
  }

  SurahModel? surahModel;

  void getSurah() {
    emit(GetSurahLoadingState());
    DioHelper.getData(url: 'surah').then((value) {
      surahModel = SurahModel.fromJson(value.data);

      emit(GetSurahSuccessState());
    }).catchError((error) {
      emit(GetSurahErrorState());
    });
  }

  JuzModel? juzModel;

  Future<void> getJuz(int index) async {
    emit(GetJuzLoadingState());
    await DioHelper.getData(url: 'juz/$index/quran-uthmani').then((value) {
      juzModel = JuzModel.fromJson(value.data);
      emit(GetJuzSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetJuzErrorState());
    });
  }

  List<QurahModel> qurah = [];

  void getQurah() {
    DioHelper.getData(url: 'https://quranicaudio.com/api/qaris').then((value) {
      if (qurah.length < 20) {
        qurah =
            (value.data as List).map((e) => QurahModel.fromJson(e)).toList();
      }
      emit(GetQurahSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetQurahErrorState());
    });
  }

///////////////////////////////////
   Location? location;
  LocationData? currentPosition;
  double? latitude, longitude;

  getLoc() async {

    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location!.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location!.requestService();
    }
    permissionStatus = await location!.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location!.requestPermission();
    }

    currentPosition = await location!.getLocation();
    latitude = currentPosition!.latitude;
    longitude = currentPosition!.longitude;

    emit(GetLocationState());
  }
}
