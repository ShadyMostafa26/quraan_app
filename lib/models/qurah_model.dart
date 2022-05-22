class QurahModel {
  int? id;
  String? name;
  String? arabicName;
  String? relativePath;
  String? fileFormats;
  int? sectionId;
  bool? home;
  String? torrentFilename;
  String? torrentInfoHash;
  int? torrentSeeders;
  int? torrentLeechers;



  QurahModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    arabicName = json['arabic_name'];
    relativePath = json['relative_path'];
    fileFormats = json['file_formats'];
    sectionId = json['section_id'];
    home = json['home'];
    torrentFilename = json['torrent_filename'];
    torrentInfoHash = json['torrent_info_hash'];
    torrentSeeders = json['torrent_seeders'];
    torrentLeechers = json['torrent_leechers'];
  }


}