class PrivacyPolicyModel {
  Data? data;
  bool? success;

  PrivacyPolicyModel({this.data, this.success});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  String? sId;
  String? details;
  int? status;
  bool? isDelete;
  String? createdAt;
  int? iV;

  Data(
      {this.sId,
        this.details,
        this.status,
        this.isDelete,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    details = json['details'];
    status = json['status'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['details'] = details;
    data['status'] = status;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
