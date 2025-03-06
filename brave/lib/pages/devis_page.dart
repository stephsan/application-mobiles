import 'package:brave/providers/devis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDevisPage extends StatefulWidget {
  MyDevisPage({super.key});
  @override
  State<StatefulWidget> createState() => _MyDevisPageState();
}

class _MyDevisPageState extends State<MyDevisPage> {
  final dio = Dio();
  List pays = [];
  getCountrie() async {
    //final response = await dio.get("http://10.60.16.85/api/lister/devis");
    final devisProvider = Provider.of<DevisProvider>(context);
    setState(() {
      pays = devisProvider.devis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Devis'),
        elevation: 18,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              getCountrie();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: pays.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                pays[index]["designation"],
                style: TextStyle(fontSize: 25),
              ),
              title: Text(pays[index]['designation']["designation"]),
            );
          }),
    );
  }
}
