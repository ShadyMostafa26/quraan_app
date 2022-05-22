class JuzModel {
  int? code;
  String? status;
  Data? data;


  JuzModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? number;
  List<Ayahs>? ayahs;
  Surahs? surahs;
  Edition? edition;


  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add( Ayahs.fromJson(v));
      });
    }
    surahs =
    json['surahs'] != null ?  Surahs.fromJson(json['surahs']) : null;
    edition =
    json['edition'] != null ?  Edition.fromJson(json['edition']) : null;
  }
  
}

class Ayahs {
  int? number;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  //bool? sajda;



  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    surah = json['surah'] != null ?  Surah.fromJson(json['surah']) : null;
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
   // sajda = json['sajda'];
  }

}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;


  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
  }

}

class Surahs {
  Surah? s78;
  Surah? s79;
  Surah? s80;
  Surah? s81;
  Surah? s82;
  Surah? s83;
  Surah? s84;
  Surah? s85;
  Surah? s86;
  Surah? s87;
  Surah? s88;
  Surah? s89;
  Surah? s90;
  Surah? s91;
  Surah? s92;
  Surah? s93;
  Surah? s94;
  Surah? s95;
  Surah? s96;
  Surah? s97;
  Surah? s98;
  Surah? s99;
  Surah? s100;
  Surah? s101;
  Surah? s102;
  Surah? s103;
  Surah? s104;
  Surah? s105;
  Surah? s106;
  Surah? s107;
  Surah? s108;
  Surah? s109;
  Surah? s110;
  Surah? s111;
  Surah? s112;
  Surah? s113;
  Surah? s114;



  Surahs.fromJson(Map<String, dynamic> json) {
    s78 = json['78'] != null ?  Surah.fromJson(json['78']) : null;
    s79 = json['79'] != null ?  Surah.fromJson(json['79']) : null;
    s80 = json['80'] != null ?  Surah.fromJson(json['80']) : null;
    s81 = json['81'] != null ?  Surah.fromJson(json['81']) : null;
    s82 = json['82'] != null ?  Surah.fromJson(json['82']) : null;
    s83 = json['83'] != null ?  Surah.fromJson(json['83']) : null;
    s84 = json['84'] != null ?  Surah.fromJson(json['84']) : null;
    s85 = json['85'] != null ?  Surah.fromJson(json['85']) : null;
    s86 = json['86'] != null ?  Surah.fromJson(json['86']) : null;
    s87 = json['87'] != null ?  Surah.fromJson(json['87']) : null;
    s88 = json['88'] != null ?  Surah.fromJson(json['88']) : null;
    s89 = json['89'] != null ?  Surah.fromJson(json['89']) : null;
    s90 = json['90'] != null ?  Surah.fromJson(json['90']) : null;
    s91 = json['91'] != null ?  Surah.fromJson(json['91']) : null;
    s92 = json['92'] != null ?  Surah.fromJson(json['92']) : null;
    s93 = json['93'] != null ?  Surah.fromJson(json['93']) : null;
    s94 = json['94'] != null ?  Surah.fromJson(json['94']) : null;
    s95 = json['95'] != null ?  Surah.fromJson(json['95']) : null;
    s96 = json['96'] != null ?  Surah.fromJson(json['96']) : null;
    s97 = json['97'] != null ?  Surah.fromJson(json['97']) : null;
    s98 = json['98'] != null ?  Surah.fromJson(json['98']) : null;
    s99 = json['99'] != null ?  Surah.fromJson(json['99']) : null;
    s100 = json['100'] != null ?  Surah.fromJson(json['100']) : null;
    s101 = json['101'] != null ?  Surah.fromJson(json['101']) : null;
    s102 = json['102'] != null ?  Surah.fromJson(json['102']) : null;
    s103 = json['103'] != null ?  Surah.fromJson(json['103']) : null;
    s104 = json['104'] != null ?  Surah.fromJson(json['104']) : null;
    s105 = json['105'] != null ?  Surah.fromJson(json['105']) : null;
    s106 = json['106'] != null ?  Surah.fromJson(json['106']) : null;
    s107 = json['107'] != null ?  Surah.fromJson(json['107']) : null;
    s108 = json['108'] != null ?  Surah.fromJson(json['108']) : null;
    s109 = json['109'] != null ?  Surah.fromJson(json['109']) : null;
    s110 = json['110'] != null ?  Surah.fromJson(json['110']) : null;
    s111 = json['111'] != null ?  Surah.fromJson(json['111']) : null;
    s112 = json['112'] != null ?  Surah.fromJson(json['112']) : null;
    s113 = json['113'] != null ?  Surah.fromJson(json['113']) : null;
    s114 = json['114'] != null ?  Surah.fromJson(json['114']) : null;
  }

}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;



  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

}