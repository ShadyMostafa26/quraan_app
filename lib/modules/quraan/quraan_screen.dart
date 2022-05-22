import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/models/surah_model.dart';
import 'package:quraan_app/modules/quraan/juz_ayah_screen.dart';
import 'package:quraan_app/modules/quraan/surah_audio.dart';
import 'package:quraan_app/shared/components/components.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class QuraanScreen extends StatelessWidget {
  const QuraanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 10,
                  centerTitle: true,
                  bottom: const TabBar(
                    tabs: [
                      Text(
                        'Surah',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Juz',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildSurahItem(AppCubit.get(context).surahModel!, index, context),
                        separatorBuilder: (context, index) =>
                        const Divider(thickness: 0.9),
                        itemCount: AppCubit
                            .get(context)
                            .surahModel!
                            .data!
                            .length,
                      ),

                      GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(30, (index) => buildJuzItem(index,context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  Widget buildSurahItem(SurahModel model, index, context) => InkWell(
        onTap: () {
          navigateTo(context,  SurahAudioScreen(title: model.data![index].name,totalAya: model.data![index].numberOfAyahs,index: index,));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: FittedBox(
                  child: Text(
                    '${model.data![index].number}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model.data![index].englishName}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${model.data![index].englishNameTranslation}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .caption),
                  ],
                ),
              ),
              const Spacer(),
              FittedBox(
                child: Text(
                  '${model.data![index].name}',

                  style: Theme
                      .of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildJuzItem (index,context)=> GestureDetector(
    onTap: (){
      print(index +1);
      AppCubit.get(context).getJuz(index + 1).then((value) {
        navigateTo(context, JuzAyahScreen());
      });
    },
    child: Container(
      margin: const EdgeInsets.all(3),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal,
      ),
      child:  Text('${index +1}',style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
    ),
  );


}
