
import 'package:clase2/dert.dart';
import 'package:clase2/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}): super(key: key);
  @override
  _SplashState createState() => _SplashState();



}
class _SplashState extends State<Splash>{
  @override
  void initState(){
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome() async{
    await Future.delayed(Duration(milliseconds: 15500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
    MyHomePage(title: 'Flutter',)));
  }



  @override
  Widget build(BuildContext context){
    final button1 =  ElevatedButton(
      child: Text("dert"),
      style: ElevatedButton.styleFrom(primary: Colors.deepOrange,onPrimary: Colors.black),
      onPressed: (){
        print("/dert");
        Navigator.pushNamed(context, "/dert");
      },
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/qw.png'),
            fit: BoxFit.fill
            //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.saturation)
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(image: AssetImage('utpl.png')),
              Container(
                child: Text(
                    'Asistencia UTPL'
                ),
              ),
              button1,
              Container(
                child:Center(
                  child: ElevatedButton(
                      child: Text("Skip"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/inicio');
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}