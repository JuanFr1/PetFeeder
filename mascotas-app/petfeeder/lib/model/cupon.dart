List<Cupon> cuponesFromJson(dynamic str) => List<Cupon>.from((str).map((x) =>  Cupon.fromJson(x)));

//un objeto tipo cupon
class Cupon{
  late String? cuponName;
  late String? cuponLocal;
  late String? cuponFecha;
  late String? cuponBeneficio;
  late String? cuponCodigo;
  late String? cuponCategoria;

  Cupon({
    this.cuponName,
    this.cuponLocal,
    this.cuponFecha,
    this.cuponBeneficio,
    this.cuponCodigo,
    this.cuponCategoria});

  Cupon.fromJson(Map<String, dynamic> json){
    cuponName = json['cuponName'];
    cuponLocal = json['cuponLocal'];
    cuponFecha= json['cuponFecha'];
    cuponBeneficio = json['cuponBeneficio'];
    cuponCodigo = json['cuponCodigo'];
    cuponCategoria = json['cuponCategoria'];
  }

  Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};

    _data["cuponName"] = cuponName;
    _data["cuponLocal"] = cuponLocal;
    _data["cuponFecha"] = cuponFecha;
    _data["cuponBeneficio"] = cuponBeneficio;
    _data["cuponCodigo"] = cuponCodigo;
    _data["cuponCategoria"] = cuponCategoria;

    return _data;
  }

}