import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quraan_app/modules/home/try_audio.dart';
import 'package:quraan_app/shared/components/components.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .22,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/background_img.jpg'),
                      ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEE, d MMM yyyy').format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                                child: Text(
                                    HijriCalendar
                                        .now()
                                        .hDay
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                            WidgetSpan(
                              child: Text(
                                  '  ' +
                                      HijriCalendar
                                          .now()
                                          .longMonthName
                                          .toString() +
                                      '    ',
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                  ),
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                  HijriCalendar
                                      .now()
                                      .hYear
                                      .toString() + '',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0,1),
                        ),
                      ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ايه اليوم', style: TextStyle(color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            AppCubit.get(context).getAya();
                          }, icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      const Divider(thickness: 0.5,color: Colors.black,),
                      Wrap(
                        children: [
                          Text('${cubit.ayaModel!.data![0].text}' ' ${cubit.ayaModel!.data![2].numberInSurah}',textAlign: TextAlign.center,),
                         // Text('${cubit.ayaModel!.data![0].surah!.number}'),
                        ],
                      ),
                      Text('${cubit.ayaModel!.data![1].text}',textAlign: TextAlign.center),

                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children:<InlineSpan> [
                            WidgetSpan(
                              child: Text('${cubit.ayaModel!.data![0].surah!.name}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),


                            /*WidgetSpan(
                              child: Text('${cubit.ayaModel!.data![0].surah!.number}'),
                            ),*/
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
