class UserDataModel {
  String? name;
  String? description;
  String? image;
  String? email;

  UserDataModel({
    this.name,
    this.description,
    this.image,
    this.email,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['email'] = email;
    return data;
  }
}
