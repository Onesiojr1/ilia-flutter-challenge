class Videos {
  String id;
  String key;
  String site;
  String type;

  Videos.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      key = json['key'],
      site = json['site'],
      type = json['type'];
}

class VideoResponse {
  int id;
  List<Videos> results;

  VideoResponse.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      results = (json['results'] as List).map((e) => Videos.fromJson(e)).toList();
}