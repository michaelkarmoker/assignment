class ContactViewModel {
  List<Data>? data;

  ContactViewModel({this.data});

  ContactViewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? message;
  int? status;
  bool? isDelete;
  String? createdAt;
  int? iV;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.message,
        this.status,
        this.isDelete,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    message = json['message'];
    status = json['status'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['message'] = message;
    data['status'] = status;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}
