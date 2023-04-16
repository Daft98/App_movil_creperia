import 'package:flutter/material.dart';
import 'package:godcoffe/carrito/carrito.dart';
import 'package:godcoffe/model/carta.dart';
import 'package:godcoffe/pant_carr.dart';
import 'package:godcoffe/pant_ini.dart';
import 'package:provider/provider.dart';

class PantallaCarta extends StatefulWidget {
  const PantallaCarta({super.key});

  @override
  State<PantallaCarta> createState() => _PantallaCartaState();
}

class _PantallaCartaState extends State<PantallaCarta> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder: (
      context,
      carrito,
      child,
    ) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 241, 125, 164),
          appBar: AppBar(
            title: const Text(
              "Carta",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 241, 125, 164),
            elevation: 0,
            bottom: const TabBar(
              labelColor: Colors.blueAccent,
              indicatorColor: Colors.blueAccent,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Crepes"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Waffles"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text("Gelatos"),
                  ),
                )
              ],
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      carrito.numeroItems != 0
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext) => PantallaCarrito()))
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: const Text(
                                "Agregar un producto",
                                textAlign: TextAlign.center,
                              )),
                            );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        carrito.numeroItems.toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          drawer: const MenuLateral(),
          body: TabBarView(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                    itemCount: crepes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/img/${crepes[index].imagen}",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                crepes[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "S/. ${crepes[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItem(
                                        crepes[index].id.toString(),
                                        crepes[index].nombre,
                                        crepes[index].precio,
                                        "1",
                                        crepes[index].imagen,
                                        1);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 125, 164),
                                  foregroundColor: Colors.blueAccent,
                                ),
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text("Agregar"))
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: waffles.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/img/${waffles[index].imagen}",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                waffles[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "S/. ${crepes[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItem(
                                        waffles[index].id.toString(),
                                        waffles[index].nombre,
                                        waffles[index].precio,
                                        "1",
                                        waffles[index].imagen,
                                        1);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 125, 164),
                                  foregroundColor: Colors.blueAccent,
                                ),
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text("Agregar"))
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: gelatos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x000005cc),
                                  blurRadius: 30,
                                  offset: Offset(10, 10))
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/img/${gelatos[index].imagen}",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                gelatos[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "S/. ${crepes[index].precio}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    carrito.agregarItem(
                                        gelatos[index].id.toString(),
                                        gelatos[index].nombre,
                                        gelatos[index].precio,
                                        "1",
                                        gelatos[index].imagen,
                                        1);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 241, 125, 164),
                                  foregroundColor: Colors.blueAccent,
                                ),
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text("Agregar"))
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 249, 249, 250),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "La 4 Gelateria",
              style: TextStyle(color: Colors.blueAccent),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 125, 164),
            ),
            accountEmail: null,
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Inicio",
                style: TextStyle(color: Color.fromARGB(255, 241, 125, 164)),
              ),
              leading: Icon(
                Icons.home,
                color: Color.fromARGB(255, 241, 125, 164),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaInicio()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Carta",
                style: TextStyle(color: Color.fromARGB(255, 241, 125, 164)),
              ),
              leading: Icon(
                Icons.airplay,
                color: Color.fromARGB(255, 241, 125, 164),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaCarta()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Carrito",
                style: TextStyle(color: Color.fromARGB(255, 241, 125, 164)),
              ),
              leading: Icon(
                Icons.add_shopping_cart,
                color: Color.fromARGB(255, 241, 125, 164),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaCarrito()));
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text(
                "Restaurant",
                style: TextStyle(color: Color.fromARGB(255, 241, 125, 164)),
              ),
              leading: Icon(
                Icons.account_box,
                color: Color.fromARGB(255, 241, 125, 164),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext) => const PantallaCarta()));
            },
          )
        ],
      ),
    );
  }
}
