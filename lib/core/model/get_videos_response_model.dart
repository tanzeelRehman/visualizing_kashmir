// ignore_for_file: no_leading_underscores_for_local_identifiers

class GetVideosResponseModel {
  GetVideosResponseModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final List<VideosData> data;

  GetVideosResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => VideosData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class VideosData {
  VideosData({
    required this.id,
    required this.title,
    required this.type,
    required this.file,
    required this.createdDate,
    required this.updatedDate,
  });
  late final int id;
  late final String title;
  late final String type;
  late final String file;
  late final String createdDate;
  late final String updatedDate;

  VideosData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    file = json['file'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['type'] = type;
    _data['file'] = file;
    _data['createdDate'] = createdDate;
    _data['updatedDate'] = updatedDate;
    return _data;
  }
}
