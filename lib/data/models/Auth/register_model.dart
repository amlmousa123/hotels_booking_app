class RegisterModel{
  statusData? status;

  RegisterModel({this.status});

  RegisterModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'] != null ? statusData.fromJson(json['status']) : null;
  }

}


class statusData{
  int? type;
  titleData? title;
  statusData({this.type,this.title});

  statusData.fromJson(Map<String, dynamic> json)
  {
    type = json['type'];
    title = json['title'] != null ? titleData.fromJson(json['title']) : null;
  }

}

class titleData{
  String? ar;
  String? en;

  titleData({this.ar, this.en,});

  titleData.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }
}