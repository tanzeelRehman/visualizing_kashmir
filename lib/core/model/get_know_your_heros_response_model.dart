// ignore_for_file: no_leading_underscores_for_local_identifiers

class GetKnowYourHerosResponseModel {
  GetKnowYourHerosResponseModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final List<HerosData> data;

  GetKnowYourHerosResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => HerosData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class HerosData {
  HerosData({
    required this.id,
    required this.name,
    required this.birth,
    required this.death,
    required this.profile,
    required this.description,
    this.link,
    required this.createdDate,
    required this.updatedDate,
    required this.history,
  });
  late final int id;
  late final String name;
  late final String birth;
  late final String death;
  late final String profile;
  late final String description;
  late final String? link;
  late final String createdDate;
  late final String updatedDate;
  late final List<History> history;

  HerosData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birth = json['birth'];
    death = json['death'];
    profile = json['profile'];
    description = json['description'];
    link = json['link'] ?? '';
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    history =
        List.from(json['history']).map((e) => History.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['birth'] = birth;
    _data['death'] = death;
    _data['profile'] = profile;
    _data['description'] = description;
    _data['link'] = link;
    _data['createdDate'] = createdDate;
    _data['updatedDate'] = updatedDate;
    _data['history'] = history.map((e) => e.toJson()).toList();
    return _data;
  }
}

class History {
  History({
    required this.id,
    required this.title,
    required this.file,
    required this.description,
    required this.createdDate,
    required this.updatedDate,
  });
  late final int id;
  late final String title;
  late final String file;
  late final String description;
  late final String createdDate;
  late final String updatedDate;

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
    description = json['description'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['file'] = file;
    _data['description'] = description;
    _data['createdDate'] = createdDate;
    _data['updatedDate'] = updatedDate;
    return _data;
  }
}
