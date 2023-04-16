import 'package:flutter/material.dart';
import 'package:godcoffe/pant_cart.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 50, top: 50),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 125, 164),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    ),
                  ),
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Las Mejores Creps",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          letterSpacing: 5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/img/ic_logo.png",
                  width: MediaQuery.of(context).size.width / 0.1,
                  height: 500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext) => const PantallaCarta()));
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25.0),
                    backgroundColor: const Color.fromARGB(255, 241, 125, 164)),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
