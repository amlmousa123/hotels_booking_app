import 'package:freezed_annotation/freezed_annotation.dart';
import 'errorClass.dart';





class ErrorModel {
  errorclass? status;


  ErrorModel(this.status);
  ErrorModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new errorclass.fromJson(json['status']) : null;
    }


}