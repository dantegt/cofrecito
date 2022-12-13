import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class MessageScreen extends StatefulWidget{
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  final _formKey = GlobalKey<FormState>();

  var dropdownvalue = '¿De que se trata su consulta?';
  bool? _listTileCheckBox = false;

  var items = [
    '¿De que se trata su consulta?',
    'Cuenta',
    'Campeones',
    'Informacion sobre los cofres',
    'Otros',
    'Sobre nosotros',
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('COFRECITO',
            style:
                TextStyle(fontFamily: 'Beaufort', fontWeight: FontWeight.w800)),
      ),
      drawer: const DrawerMenu(),
      body: 
      SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[ 
            const Padding(padding: EdgeInsets.all(10)),
          Container(
            padding: const EdgeInsets.only(left: 9,top: 5, bottom: 6, right: 20),
            decoration:  BoxDecoration(color:Colors.white,
            borderRadius: const BorderRadius.only( topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
            ),
            border: Border.all(
              color: const Color.fromARGB(255, 217, 219, 209),
              width: 3
              )),
              width:370,
              height: 40,
            child: DropdownButton<String>(
              style: TextStyle(color: Color.fromARGB(255, 217, 219, 209), fontSize: 18, fontWeight: FontWeight.w500),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(42, 66, 82, 20),),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items, style: TextStyle(fontFamily: 'DMSans', color: items != '¿De que se trata su consulta?'
                  ? Color.fromRGBO(174, 145, 75, 1) : Colors.black,)),
                  enabled: items != '¿De que se trata su consulta?',
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            )),
            const Padding(padding: EdgeInsets.all(5)),
            Container (
              decoration: BoxDecoration(color:Colors.white,
              borderRadius: const BorderRadius.only( topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color.fromARGB(255, 217, 219, 209),
                width: 3
                )
                ),
                width: 370,
                height: 270,
                padding: EdgeInsets.only(top: 5,left: 10),
                child:TextField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  cursorRadius: Radius.circular(200),
                  cursorWidth: 2.0,
                  textInputAction: TextInputAction.send,
                  decoration: new InputDecoration.collapsed(hintText: 'Describe el paso a paso para\nreproducir el error.', hintStyle: TextStyle(fontFamily: 'DMSans',fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black ))
                  ),),
                const Padding(padding: EdgeInsets.only(top: 240)),
                 Container(
                  child: (CheckboxListTile(value: _listTileCheckBox, activeColor: Color.fromRGBO(174, 145, 75, 1), title: Text('Enviarme una copia a mi email', style: TextStyle(fontFamily: 'DMSans')), onChanged:(value) {
                setState(() {
                  _listTileCheckBox = value;
                });
                ListTileControlAffinity.leading;
              },
              controlAffinity: ListTileControlAffinity.leading,)),
              ),
              Form(
                key: _formKey,
                child: 
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(370, 40),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            topLeft: Radius.circular(13)
                            )),
                            backgroundColor: const Color.fromRGBO(174, 145, 75, 1) ,
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enviando Mensaje')),
                                );
                              }
                            },
                            child: const Text('Enviar Mensaje', style: TextStyle(fontFamily: 'DMSans',fontSize: 16,fontWeight: FontWeight.w700, color: Color.fromARGB(255, 217, 219, 209)),),
                          ),
                        ]
                        )
      )],
            ),
    ));
  }
}