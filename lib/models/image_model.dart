 class ImageModel {
  String? path;
  String? fileName;

  ImageModel({this.path, this.fileName});

  ImageModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['fileName'] = fileName;
    return data;
  }
}
