import 'package:flutter/material.dart';

class MyFacturePage extends StatefulWidget {
  MyFacturePage({super.key});
  @override
  State<StatefulWidget> createState() => _MyFacturePageState();
}

class _MyFacturePageState extends State<MyFacturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Liste des factures'),
          elevation: 18,
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.file_copy),
                Text('Facture1'),
                //Icon(Icons.thumb_down)
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.file_copy),
                Text('Facture2'),
                //Icon(Icons.thumb_down)
              ],
            )
          ],
        ));
  }
}
