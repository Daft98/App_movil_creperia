import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrito/carrito.dart';

class PantallaCarrito extends StatefulWidget {
  const PantallaCarrito({super.key});

  @override
  State<PantallaCarrito> createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (
      context,
      carrito,
      child,
    ) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 125, 164),
          appBar: AppBar(
            title: const Text("Pedidos"),
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 241, 125, 164),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: carrito.items.isEmpty
                    ? const Center(
                        child: Text("Carrito vacío"),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var item in carrito.items.values)
                            Card(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/img/" + item.imagen,
                                      width: 100,
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: const EdgeInsets.all(5),
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(item.nombre),
                                          Text("S/. " +
                                              item.precio.toString() +
                                              " x " +
                                              item.unidad),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        carrito
                                                            .decrementarCantidad(
                                                                item.id);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      size: 13,
                                                      color: Colors.white,
                                                    )),
                                                width: 50,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30))),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: Center(
                                                  child: Text(
                                                      item.cantidad.toString()),
                                                ),
                                              ),
                                              Container(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        carrito
                                                            .incrementarCantidad(
                                                                item.id);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  width: 50,
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          30)))),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                                    Container(
                                      height: 100,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          color: Color(0x99fefefe0)),
                                      child: Center(
                                        child: Text(
                                            "S/. ${item.precio * item.cantidad}"),
                                      ),
                                    )
                                  ]),
                            ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text("Subtotal"),
                                ),
                                Text(
                                    "S/. ${carrito.subTotal.toStringAsFixed(2)}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text("Impuesto"),
                                ),
                                Text(
                                    "S/. ${carrito.impuestos.toStringAsFixed(2)}")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text("Total"),
                                ),
                                Text("S/. ${carrito.Total.toStringAsFixed(2)}")
                              ],
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ));
    });
  }
}
