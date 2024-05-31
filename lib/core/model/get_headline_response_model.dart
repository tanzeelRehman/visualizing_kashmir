// ignore_for_file: no_leading_underscores_for_local_identifiers

class GetHeadLineResponseModel {
  GetHeadLineResponseModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final List<Data> data;

  GetHeadLineResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.heading,
    required this.description,
    required this.gallery,
    required this.date,
    required this.createdDate,
    required this.updatedDate,
  });
  late final int id;
  late final String? heading;
  late final String? description;
  late final List<String>? gallery;
  late final String? date;
  late final String? createdDate;
  late final String? updatedDate;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['description'];
    gallery = List.castFrom<dynamic, String>(json['gallery']);
    date = json['date'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['heading'] = heading;
    _data['description'] = description;
    _data['gallery'] = gallery;
    _data['date'] = date;
    _data['createdDate'] = createdDate;
    _data['updatedDate'] = updatedDate;
    return _data;
  }
}
