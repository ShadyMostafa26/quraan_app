import 'package:flutter/material.dart';
import 'package:quraan_app/models/qurah_model.dart';
import 'package:quraan_app/modules/audio/surah_list_screen.dart';
import 'package:quraan_app/shared/components/components.dart';
import 'package:quraan_app/shared/cubit/cubit.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildQurahItem(AppCubit.get(context).qurah[index], context),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: AppCubit.get(context).qurah.length,
    );
  }

  Widget buildQurahItem(QurahModel model, context) => GestureDetector(
        onTap: () {
          navigateTo(context, SurahListScreen(surahModel: AppCubit.get(context).surahModel,));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '${model.arabicName}',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
