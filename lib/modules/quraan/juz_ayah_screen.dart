import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/models/juz_model.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';
import 'package:quraan_app/shared/cubit/states.dart';

class JuzAyahScreen extends StatelessWidget {


   const JuzAyahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildAyaItem(AppCubit.get(context).juzModel!,index,context),
              separatorBuilder:(context, index) => const Divider(thickness: 2,) ,
              itemCount: AppCubit.get(context).juzModel!.data!.ayahs!.length,
            )
        );
      },
    );
  }
  Widget buildAyaItem (JuzModel model,index, context)=> Align(
    alignment: AlignmentDirectional.topCenter,
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${model.data!.ayahs![index].numberInSurah}'),
            Text('${model.data!.ayahs![index].text}'),
            Text('${model.data!.ayahs![index].surah!.name}',style: Theme.of(context).textTheme.caption,),
          ],
        ),
      ),
    ),
  );
}
