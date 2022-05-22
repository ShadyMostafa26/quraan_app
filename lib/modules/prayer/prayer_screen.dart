import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class PrayerScreen extends StatelessWidget {
   PrayerScreen({Key? key}) : super(key: key);

 static final  coordinates = Coordinates(30.0444, 31.2357);
 static final params = CalculationMethod.egyptian.getParameters();

  final prayersTimes = PrayerTimes.today(coordinates, params);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.fajr)),
                  const Text('الفجر'),
                ],
              ),
              const Divider(thickness: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.sunrise)),
                  const Text('الشروق'),
                ],
              ),
              const Divider(thickness: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.dhuhr)),
                  const Text('الضهر'),
                ],
              ),
              const Divider(thickness: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.asr)),
                  const Text('العصر'),
                ],
              ),
              const Divider(thickness: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.maghrib)),
                  const Text('المغرب'),
                ],
              ),
              const Divider(thickness: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat.jm().format(prayersTimes.isha)),
                  const Text('العشاء'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
