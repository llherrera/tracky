import 'package:flutter/material.dart';

TextEditingController _controller = TextEditingController();
String _searchText = "";

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF4093CE),
                      Color(0xFF9BCEF3),
                    ])),
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    //FILA 1 - PARA EL ICONO DE LEADERBOARD
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.leaderboard, size: 80),
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 5.0, left: 130.0),
                          onPressed: () {
                            // TODO: implementar el foto upload
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    // ROW 2 - TEXT
                    Row(
                      children: const [
                        Padding(padding: EdgeInsets.all(40)),
                        Text(
                          'Positions Table',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20.0),
                    // ROW 3 - BUTTONS

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Agregar funcionalidades del boton aqui
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor:
                                const Color.fromRGBO(47, 118, 148, 1.000),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: const Text(
                            'Cycling',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Agregar funcionalidades del botón aquí
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor:
                                const Color.fromRGBO(172, 172, 172, 1.000),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: const Text(
                            'Running',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    // ROW 4 SEARCHBOX
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 80.0),
// ROW 4- POSITIONS TABLE
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                'User',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'User 1',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'User 2',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'User 3',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                'Avg Time',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '2 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '3 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '4 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                'Best Time',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '1 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '2 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '3 min',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            // Agregar funcionalidades del botón aquí
                          },
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                width: 3.0, color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                          ),
                          child: const Text(
                            'Agregar Segmento +',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
       


  


/*BackBtn(),
        Row(),
        EditProfileBtn(),
        Statistics(),
        LastActivity()*/

