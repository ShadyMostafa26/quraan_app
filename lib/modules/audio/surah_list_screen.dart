import 'package:flutter/material.dart';
import 'package:quraan_app/models/surah_model.dart';

class SurahListScreen extends StatelessWidget {
  final SurahModel? surahModel;
  const SurahListScreen({Key? key,this.surahModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text('Surah List',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildSurahAudioItem(index,context),
                separatorBuilder: (context, index) => const Divider() ,
                itemCount:surahModel!.data!.length,
            ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildSurahAudioItem (index,context)=> GestureDetector(
    onTap: (){},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.play_circle_fill,color: Colors.blue,size: 35,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${surahModel!.data![index].name}',maxLines: 1,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text('عدد الايات : ${surahModel!.data![index].numberOfAyahs}  ',style: Theme.of(context).textTheme.caption,),
          ],
        ),
      ],
    ),
  );
}
