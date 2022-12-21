import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clase2/providers/provider_product.dart';
import 'package:flutter/services.dart' as rootBundle;

class ReadJson extends StatelessWidget{

  const ReadJson({Key? Key }): super(key: Key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Lectura de archivos JSON'),
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(items[index].name.toString(),style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: EdgeInsets.only(left: 20,right: 8),child: Text(items[index].oldPrice.toString()),)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }
  //Map<String, dynamic> json = await loadJSON('http://example.com/file.json');

  Future<void> ReadJsonData() async {
    final client = RetryClient(http.Client());
    try {
      print(await client.read(Uri.http('', '')));
    } finally {
      client.close();
    }
  }


}