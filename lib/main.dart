import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Principal(),
    );
  }
}

List<Persona> _personas = [
  Persona('humberto.', 'velasco', '20177652'),
  Persona('Mar F.', 'ricardo', '20193368'),
  Persona('Jose de Jesus', 'perez', '20197043'),
  Persona('Jose Nabor', 'Ramirez', '20101589'),
];
final nom = TextEditingController();
final ape = TextEditingController();
final cue = TextEditingController();

String tnom = '';
String tape = '';
String tcue = '';
class Principal extends StatefulWidget {
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),

      //Incorporar boton de pantalla inicial
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.people_alt_outlined),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Principal2()));
        },
        ),

      body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_personas[index].name + ' ' + _personas[index].lastName),
              subtitle: Text(_personas[index].cuenta),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0,1)),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        )
    );
  }
}

class Principal2 extends StatefulWidget {
  @override
  State<Principal2> createState() => _PrincipalState2();
}

class _PrincipalState2 extends State<Principal2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar User'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Container(
            child: TextField(
              controller: nom,
              decoration: InputDecoration(
              hintText: 'Nombre',
              filled: true,
              fillColor: Colors.white),              
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            child: TextField(
              controller: ape,
              decoration: InputDecoration(
              hintText: 'Apellidos',
              filled: true,
              fillColor: Colors.white),              
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            child: TextField(
              controller: cue,
              decoration: InputDecoration(
              hintText: 'No.Cuenta',
              filled: true,
              fillColor: Colors.white),              
            ),
          ),
          SizedBox(height: 50.0),
          Container(
              child: OutlinedButton(
                child: Text('Guardar', style: TextStyle(fontSize: 25.0, color: Colors.white),),
                style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                  tnom = nom.text;
                  tape = ape.text;
                  tcue = cue.text;
                  _personas.add(Persona(tnom, tape, tcue));
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Principal()));
                },
              ),
      ),
        ],
        
      ),),
    );
  }
}

class Persona{
  String name;
  String lastName;
  String cuenta;
  //Constructor
  Persona(this.name, this.lastName, this.cuenta);
}