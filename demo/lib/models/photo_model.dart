class PhotoResModel {
  String? message;
  String? status;
  int? statusCode;

  PhotoResModel({this.message, this.status, this.statusCode});

  PhotoResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    statusCode = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['code'] = statusCode;

    return data;
  }
}
