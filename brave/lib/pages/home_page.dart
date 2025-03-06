import 'package:brave/pages/devis_page.dart';
import 'package:brave/pages/factures_page.dart';
import 'package:brave/providers/devis.dart';
import 'package:brave/providers/item.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart'; // Import pour quitter l'application

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   final itemsProvider = Provider.of<ItemProvider>(context, listen: false);
  //   itemsProvider.fetchItems();
  //   //print(devisProvider);
  // }

  @override
  Widget build(BuildContext context) {
    final devisProvider = Provider.of<DevisProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brave women BF'),
        elevation: 18,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //Le titre du menu
            DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 189, 12, 151),
                ),
                child: Text('Menu')),
            //Liens clicable
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.settings),
              title: Text("Parametres"),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.account_box),
              title: Text("Profil"),
              //Les trailings viennent apres le title
              trailing: Icon(Icons.chevron_right),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.help),
              title: Text("Devis"),
              // action lorsqu'onclique sur le lien
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyDevisPage();
                }));
              },
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.close),
              title: Text("Factures"),
              // action lorsqu'onclique sur le lien
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyFacturePage();
                }));
              },
            ),
            Divider(),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.close),
              title: Text("Quittez"),
              // action lorsqu'onclique sur le lien
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmer'),
                    content:
                        Text('Voulez-vous vraiment quitter l\'application ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          exit(0); // Quitter l'application
                        },
                        child: Text('Oui', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Consumer<DevisProvider>(
        builder: (context, devisProvider, child) {
          if (devisProvider.devis.isEmpty) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else {
            return ListView.builder(
              itemCount: devisProvider.devis.length,
              itemBuilder: (context, index) {
                final devis = devisProvider.devis[index];
                return ListTile(
                  title: Text(devis.description),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DevisProvider>(context, listen: false).fetchDevis();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
