import 'dart:ui' as ui;

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false, //indice de masa corporal
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<MyCalculator> {
  final controller_cantidad = TextEditingController();
  final controller_cambio = TextEditingController();
  final controller_atole = TextEditingController();
  final d = Decimal;

  String muestreTotal = "";
  String muestreCambio = "";

  //Formula para hacer una operacion arimetica
  //lo que esten perdidos con la formula vamos a crear una mas simple
  void OperacionMatematica() {
    //realizamos las validaciones si algun campo este vacio
    double numero1 = double.parse(controller_cantidad.text);
    double numero2 = double.parse(controller_atole.text);
    double numero3 = double.parse(controller_cambio.text);

    double result = (numero1 * 13) + numero2;
    double result2 = numero3 - result;
    //lo puede cambiar por +  o  - o *
    if(numero3 == 0 && numero2 >= 0){
    setState(() {
      muestreTotal = "El resultado es: $result";
    });
    }else if (result > numero3) {
      muestreCambio = "Te hace falta: $result2";
    } else {
      setState(() {
        muestreCambio = "El cambio a dar es: $result2";
      });
    }
    /*
    if (result > numero3) {
      muestreCambio = "Te hace falta: $result2";
    } else {
      setState(() {
        muestreCambio = "El cambio a dar es: $result2";
      });
    }*/
  }

//ahora realizaremos el layout o diseño de nuestra calculadora
//de indice de masa corporal
  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tamales ALI'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(90),
                          bottomLeft: Radius.circular(90)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: new Image(
                            width: 180.0,
                            height: 110.0,
                            image: new AssetImage('assets/images/1.png'),
                          ),
                        )
                      ],
                    ),
                  ),

                  //agregamos un Container
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 225,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_atole,
                            validator: (value) {
                              if (value.isEmpty) return "Cantidad de atole:";
                            },
                            decoration: InputDecoration(
                                hintText: "Cantidad de atole",
                                icon: Icon(Icons.account_balance_wallet,
                                    color: Colors.blueGrey)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 225,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_cantidad,
                            validator: (value) {
                              if (value.isEmpty) return "Cantidad de tamales:";
                            },
                            decoration: InputDecoration(
                                hintText: "Cantidad de tamales",
                                icon: Icon(Icons.account_balance_wallet,
                                    color: Colors.blueGrey)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 225,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_cambio,
                            validator: (value) {
                              if (value.isEmpty) return "Cantidad de dinero:";
                            },
                            decoration: InputDecoration(
                                hintText: "Cantidad de dinero",
                                icon: Icon(Icons.add_box,
                                    color: Colors.blueGrey)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      VerticalDivider(),
                      FlatButton(
                        onPressed: OperacionMatematica,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.lightBlueAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Icon(Icons.add), Text('Calcular')],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  //caja de resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFf81F7F3), Color(0xFFf04B4AE)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultado del TextFormField
                    child: Center(
                      child: Text(
                        muestreTotal,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFf04B4AE), Color(0xFFf81F7F3)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultador del TextFormField
                    child: Center(
                      child: Text(
                        muestreCambio,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 10,
                  ),
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 450.0,
                            height: 200.0,
                            image: new AssetImage('assets/images/2.jpg'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
