import 'dart:io';
import 'package:flutter/material.dart';

class skip extends StatelessWidget {
  const skip( {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("skip"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Theme(
              data: ThemeData.from(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),

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