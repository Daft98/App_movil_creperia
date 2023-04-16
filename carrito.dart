import 'package:flutter/material.dart';
import 'package:godcoffe/model/item.dart';

class Carrito extends ChangeNotifier {
  Map<String, dynamic> _items = {};
  Map<String, dynamic> get items {
    return {..._items};
  }

  int get numeroItems {
    return _items.length;
  }

  double get Total {
    var total = 0.0;
    items.forEach(
        (key, elementos) => total += elementos.precio * elementos.cantidad);
    return total;
  }

  double get impuestos {
    var total = 0.0;
    total = Total * 0.15;
    return total;
  }

  double get subTotal {
    var total = 0.0;
    total = Total - impuestos;
    return total;
  }

  void agregarItem(
    String producto_id,
    String nombre,
    double precio,
    String unidad,
    String imagen,
    int cantidad,
  ) {
    if (_items.containsKey(producto_id)) {
      _items.update(
          producto_id,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad = 1));
    } else {
      _items.putIfAbsent(
          producto_id,
          () => Item(
                id: producto_id,
                nombre: nombre,
                precio: precio,
                unidad: unidad,
                imagen: imagen,
                cantidad: 1,
              ));
    }
    void removerItem(String producto_id) {
      _items.remove(producto_id);
    }

    void removerCarrito() {
      _items = {};
    }
  }

  void decrementarCantidad(String producto_id) {
    if (!_items.containsKey(producto_id)) return;
    if (_items[producto_id].cantidad > 1) {
      _items.update(
          producto_id,
          (old) => Item(
                id: old.id,
                nombre: old.nombre,
                precio: old.precio,
                unidad: old.unidad,
                imagen: old.imagen,
                cantidad: old.cantidad - 1,
              ));
    } else {
      _items.remove(producto_id);
    }
  }

  void incrementarCantidad(String producto_id) {
    if (_items.containsKey(producto_id)) {
      _items.update(
          producto_id,
          (old) => Item(
                id: old.id,
                nombre: old.nombre,
                precio: old.precio,
                unidad: old.unidad,
                imagen: old.imagen,
                cantidad: old.cantidad + 1,
              ));
    }
  }
}
