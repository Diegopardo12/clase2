  import 'package:clase2/dert.dart';
import 'package:clase2/screens/readjson.dart';
import 'package:clase2/skip.dart';
  import 'package:clase2/splash.dart';
  import 'package:flutter/material.dart';

  void main() async {
    //WidgetsFlutterBinding.ensureInitialized();
    //await MongoDB.conectar();
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Splash(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: <String, WidgetBuilder>{
        //  "/productosmongodb" : (BuildContext context) => ProductosMongo(),
          "/productosjson" : (BuildContext context) => ReadJson(),
          "/Splash":(BuildContext context)=>Splash(),
          '/dert' : (BuildContext context) => dert(),
          '/skip' : (BuildContext context) => skip(),
          "/inicio" : (BuildContext context) => MyHomePage(title: 'Flutter',)

        },

      );
    }
  }

  class MyHomePage extends StatefulWidget {
    MyHomePage({Key? key, required this.title}) : super(key: key);
    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();

  }

  class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      //Botones
      final button1 = new ElevatedButton(
        child: Text("Productos Json"),
        style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            onPrimary: Colors.white,
            elevation: 5,
            shadowColor: Colors.black
        ),
        onPressed: (){
          Navigator.pushNamed(context, "/productosjson");
          print("Ir al home");
        },
        onLongPress: (){
          print("Long hello raiced button");
        },
      );
      final button2 = IconButton(
        icon: Icon(
          Icons.adb,
          size: 20,
          color: Colors.red,
        ),
        tooltip:'Presioname',
        onPressed: (){
          Navigator.pushNamed(context, "/productos");
        },
      );

      final button3 = ElevatedButton.icon(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 20.0,
        ),
        label: Text('Boton con iconos'),
        onPressed: () {
          Navigator.pushNamed(context, "second");
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
      );
      final button4 = ElevatedButton.icon(
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 20.0,
        ),
        label: Text('Productos Mongo'),
        onPressed: () {
          Navigator.pushNamed(context, "/productosmongodb");
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
      );


      return Scaffold(
          appBar: AppBar(
            title: Text('Pantalla principal'),
          ),
          body: Center(
            child:Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  button1,

                ],
              ),
            ),
          )
      );
    }


  }