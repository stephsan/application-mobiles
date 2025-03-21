import 'package:brave/pages/detail_devis_page.dart';
import 'package:brave/pages/devis_page.dart';
import 'package:brave/pages/factures_page.dart';
import 'package:brave/providers/devis.dart';
import 'package:brave/providers/item.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:provider/provider.dart'; // Import pour quitter l'application

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<DevisProvider>(context, listen: false).fetchDevis();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //Provider.of<DevisProvider>(context, listen: false).fetchDevis();
    final devisProvider = Provider.of<DevisProvider>(context);
    return Scaffold(
      appBar: MyAppBar(),
      // AppBar(
      //   title: const Text('Brave women BF'),
      //   elevation: 18,
      //   // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
      //   ],
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            //Le titre du menu
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text('Menu')),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SearchSection(),
          PrincipalSection(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DevisProvider>(context, listen: false).fetchDevis();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: null,
      //   icon: Icon(Icons.arrow_back),
      //   color: Colors.grey[100],
      // ),
      title: Text(
        'Brave Women BF',
        // style: GoogleFonts.nunito(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   color: Colors.black,
        //   letterSpacing: 1.5,
        // ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 18, 10),
      child: Column(
        children: [
          Row(
            children: [
              //Expanded prend tt le reste de l'espace sur le row
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                height: 50,

                ///color: Colors.blue,
                //ajout du champ recherche
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Nom de l'entreprise",
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                ),
              )),
              //Mettre un espace entre les deux container
              SizedBox(width: 10),
              //Le container du boutton search
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 4, offset: Offset(0, 4))
                ], borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.green,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(10)),
                ),
              ),
            ],
          ),
          Row(
            //Espace entre les éléments de la ligne
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Devis en attente',
                      style: TextStyle(
                        //fontSize: 20,
                        color: Colors.grey,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Espacer les deux lignes
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '50',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Factures en attentes',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PrincipalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devisProvider = Provider.of<DevisProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '200 entreprises trouvées',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text('Filtre',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    IconButton(
                        onPressed: () {},
                        color: Colors.green,
                        icon: Icon(Icons.filter_list_outlined))
                  ],
                )
              ],
            ),
          ),
          Container(color: Colors.white, child: Text('tes'))
        ],
      ),
    );
  }
}
