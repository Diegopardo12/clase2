import 'dart:io';
import 'package:flutter/material.dart';

class dert extends StatelessWidget {
  const dert( {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dert"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Theme(
              data: ThemeData.from(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),

              ),
              child: Builder(
                builder: (BuildContext context) {
                  return Container(
                    width:900,
                    height: 700,
                    color: Theme.of(context).colorScheme.primary,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}