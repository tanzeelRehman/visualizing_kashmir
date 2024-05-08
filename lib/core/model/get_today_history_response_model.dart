// ignore_for_file: no_leading_underscores_for_local_identifiers

class GetTodayHistoryResponseModel {
  GetTodayHistoryResponseModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final List<Data> data;

  GetTodayHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.servey,
    required this.type,
    required this.publishBy,
    required this.heading,
    required this.heading1,
    required this.description,
    required this.longDescription,
    required this.thumbnail,
    this.gallery,
    required this.date,
    required this.page,
    required this.createdDate,
    required this.updatedDate,
  });
  late final int id;
  late final String servey;
  late final String type;
  late final String publishBy;
  late final String heading;
  late final String heading1;
  late final String description;
  late final String longDescription;
  late final String thumbnail;
  late final Null gallery;
  late final String date;
  late final int page;
  late final String createdDate;
  late final String updatedDate;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servey = json['servey'];
    type = json['type'];
    publishBy = json['publishBy'];
    heading = json['heading'];
    heading1 = json['heading1'];
    description = json['description'];
    longDescription = json['long_description'];
    thumbnail = json['thumbnail'];
    gallery = null;
    date = json['date'];
    page = json['page'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['servey'] = servey;
    _data['type'] = type;
    _data['publishBy'] = publishBy;
    _data['heading'] = heading;
    _data['heading1'] = heading1;
    _data['description'] = description;
    _data['long_description'] = longDescription;
    _data['thumbnail'] = thumbnail;
    _data['gallery'] = gallery;
    _data['date'] = date;
    _data['page'] = page;
    _data['createdDate'] = createdDate;
    _data['updatedDate'] = updatedDate;
    return _data;
  }
}
