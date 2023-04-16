class Item {
  late String id;
  late String nombre;
  late double precio;
  late String unidad;
  late String imagen;
  late int cantidad;

  Item({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad,
  });
  Item.Map(dynamic o) {
    id = o["id"];
    nombre = o["nombre"];
    precio = o["precio"];
    unidad = o["unidad"];
    imagen = o["imagen"];
    cantidad = o["cantidad"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["nombre"] = nombre;
    map["precio"] = precio;
    map["unidad"] = unidad;
    map["imagen"] = imagen;
    map["cantidad"] = cantidad;
    return map;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["nombre"] = nombre;
    data["precio"] = precio;
    data["unidad"] = unidad;
    data["imagen"] = imagen;
    data["cantidad"] = cantidad;
    return data;
  }
}
