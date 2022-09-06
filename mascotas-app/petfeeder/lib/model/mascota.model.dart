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
        id: json['_id'],
        petName: json['petName'],
        petAge: json['PetAge'],
        petWeight: json['petWeight'],
        raze: json['raze'],
        color: json['color'],
        avatar: json['avatar']);
  }
}
