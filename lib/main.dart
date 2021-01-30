/*import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'people.dart';
void main()=>runApp(MiApp());
class MiApp extends StatelessWidget {
  const MiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Image",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List data;
  Future <String> getData() async {
    var response= await http.get(
        Uri.encodeFull("https://webapipersonawm.azurewebsites.net/api/people"),
        headers: {"Accept":"application/json"}
    );
    if(response.statusCode ==200){
    data= json.decode(response.body);
    print(data);
    //return data.map((people)=> new People.fromJson(people)).toList();
    }
    /* else {
      throw Exception('Falló al llamar a la Api');
    }*/
    return "Satisfactorio";
  }

  _InicioState(){
    this.getData();
  }  

  @override
  void initState(){
    this.getData()
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Mi App con Imagen"),
         ),
         body: ListView( 
           children: <Widget>[
               Container(
                padding: EdgeInsets.all(20.0),
                child: Image.network("https://s1.eestatic.com/2020/08/06/actualidad/actualidad_510959894_157148069_1024x576.jpg"),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Image.network("https://www.biocodexmicrobiotainstitute.com/sites/default/files/styles/gp_articles/public/2020-07/GP_Actu_syndrome%20post%C3%A9rieur%20mouill%C3%A9%20koalas_icono.jpg?itok=6Tt-9ipK"),
              ),
              Center(
                child: new RaisedButton(
                  child: new Text("Obtener datos"),
                  onPressed: getData)
              ),
              new ListView.builder(
                itemCount: data == null?: data.lentgh,
                itemBuilder: (BuildContext context, int index){
                  return new Card(
                    child:
                  )
                },
              )
           ]
         ),
    );
  }
}
*/

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://webapipersonawm.azurewebsites.net/api/people"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    
    print(data[1]["Name"]);
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["Name"]),
          );
        },
      ),
    );
  }
}