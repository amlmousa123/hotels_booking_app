import 'Title_model.dart';

class errorclass{

  int ?type;
  Title? title;

  errorclass({this.type, this.title});

  errorclass.fromJson(Map<String, dynamic> json) {
    type =
    json['type'] ;
    title =
    json['title'] != null ? new Title.fromJson(json['tite']) : null;

  }











}