class Title{
  String ? en;
  String? ar;
  Title(this.en,this.ar);
  Title.fromJson(Map<String, dynamic> json) {
    en=json["en"];
    ar=json["ar"];
  }




}