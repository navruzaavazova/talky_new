class UserDataModel {
  String? name;
  String? description;
  String? image;

  UserDataModel({
    this.name,
    this.description,
    this.image,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
