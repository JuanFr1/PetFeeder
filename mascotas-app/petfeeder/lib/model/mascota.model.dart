class Mascota {
  var id;
  var petName;
  var petAge;
  var petWeight;
  var raze;
  var color;
  var avatar;

  Mascota(
      {this.id,
      this.petName,
      this.petAge,
      this.petWeight,
      this.raze,
      this.color,
      this.avatar});

  factory Mascota.fromJson(Map<String, dynamic> json) {
    return Mascota(
        id: json['_id'] as String? ?? "",
        petName: json['petName'] as String? ?? "",
        petAge: json['petAge'] as String? ?? "",
        petWeight: json['petWeight'] as String? ?? "",
        raze: json['raze'] as String? ?? "",
        color: json['color'] as String? ?? "",
        avatar: json['avatar'] as String? ?? "");
  }
}
