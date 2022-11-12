import 'package:flutter/material.dart';
import 'package:risin/pages/Settings.dart';

class Analogclck extends StatelessWidget {
  const Analogclck({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.album, size: 45),
            title: Text('Sonu Nigam'),
            subtitle: Text('Best of Sonu Nigam Song'),
          ),
        ],
      ),
    );
  }
}
