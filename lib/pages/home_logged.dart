

import 'package:flutter/material.dart';
import 'package:flutter_app/themes/default.dart';

import '../widgets/widgets.dart';

class HomeLogged extends StatelessWidget {
  const HomeLogged({super.key});

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
        elevation: 10.0,
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: (1/3*width)-25,
                  height: 140,
                  child: Stack(
                    children:[
                    const ClipOval(
                      child: FadeInImage(
                        image: AssetImage('assets/images/background.png'),
                        placeholder: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill,
                    ),),
                    Positioned(
                      top:95,
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 50,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: DefaultTheme.primaryLight,
                          ),
                          child: const Text("160",textAlign: TextAlign.center,)
                      ),
                    ),
                    
                    ]
                  ),
                ),
                SizedBox(
                  width: (2/3*width)-25,
                  height: 120,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                      color: Colors.transparent,
                      child: const Text("Invocador",style: TextStyle(
                      color: Color.fromARGB(255, 217, 219, 209),
                      fontSize: 25, 
                      fontWeight: FontWeight.w800,
                      ),),),
                      const SizedBox(height: 5),
                      Container(
                      color: Colors.transparent,
                      child: const Text("Platino 4",style: TextStyle(
                      color: Color.fromARGB(255, 217, 219, 209),
                      fontSize: 15, 
                      fontWeight: FontWeight.w400,
                      ),),),
                      ]),
                  ),
                ),
              
          ]),
          const SizedBox(height: 60,width: double.infinity),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: const Color.fromRGBO(174, 145, 75, 1),
            ),
            onPressed: (){Navigator.pushReplacementNamed(context, 'home');},
            child: const Text('Buscar')
            ),
          const SizedBox(height: 40,width: double.infinity),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 50),
              backgroundColor: const Color.fromRGBO(174, 145, 75, 1),
            ),
            onPressed: (){Navigator.pushReplacementNamed(context, 'champions');},
            child: const Text('Lista de campeones')
            )
          ],

        ),
      ));
  }
}