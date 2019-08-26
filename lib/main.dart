import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _resultado = "Info";

  void _resetField(){
    pesoController.text = "";
    alturaController.text = "";
    _resultado = "Informe os dados";
  }

  void _calcurateImc(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text)/100;
      double imc = peso/(altura*altura);
      if(imc < 18.6){
        _resultado = "Abaixo do peso ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 18.6 && imc < 24.9){
        _resultado = "Peso ideal! ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 24.9 && imc < 29.9){
        _resultado = "Levemente acima do peso: ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 29.9 && imc < 34.9){
        _resultado = "Obesidade I ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 34.9 && imc < 40.0){
        _resultado = "Obesidade II ${imc.toStringAsPrecision(2)}";
      }else if(imc >= 40.0){
        _resultado = "Obesidade III ${imc.toStringAsPrecision(2)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: (){
            _resetField();
          })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //ocupa td a largura
          children: <Widget>[
            Icon(Icons.perm_identity,size: 120,color: Colors.black),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso (Kg):",
                  labelStyle: TextStyle(color: Colors.black)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25
              ),
              controller: pesoController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm):",
                  labelStyle: TextStyle(color: Colors.black)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25
              ),
              controller: alturaController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    _calcurateImc();
                  },
                  child: Text("Calcular",style: TextStyle(color: Colors.white,fontSize: 25)),
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
