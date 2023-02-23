class AnimesModel {
  bool? success;
  List<Data>? data = [];
  AnimesModel({this.success, this.data});

  AnimesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    json['data'].forEach((e) {
      data!.add(Data.fromJson(e));
    });
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data({
    this.id,
    this.name,
    this.image,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['anime_id'];
    name = json['anime_name'];
    image = json['anime_img'];
  }
}

