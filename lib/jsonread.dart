import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Lectura extends StatelessWidget {
  const Lectura({Key? Key}) : super(key: Key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Itinerario de zapatos de 2022'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<dynamic>;
            print(items);
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 50,
                          margin: EdgeInsets.only(right: 40.0),
                          child: Image(
                            image: NetworkImage(
                                items[index]['imageUrl'].toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${items[index]['price']}',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              items[index]['name'],
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> getData() async {
    String url = "https://viae.ec/data.json";
    final response = await http.get(Uri.parse(url));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

}
