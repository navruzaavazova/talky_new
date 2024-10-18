class UserDataModel {
  final String? name;
  final String? description;
  final String? image;
  final String? uid;

  UserDataModel({
    this.name,
    this.description,
    this.image,
    this.uid,
  });

  factory UserDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      UserDataModel(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        uid: json['uid'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['uid'] = uid;
    return data;
  }
}
