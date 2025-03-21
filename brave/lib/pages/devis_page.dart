import 'package:brave/pages/detail_devis_page.dart';
import 'package:brave/providers/devis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MyDevisPage extends StatefulWidget {
  MyDevisPage({super.key});
  @override
  State<StatefulWidget> createState() => _MyDevisPageState();
}

class _MyDevisPageState extends State<MyDevisPage> {
  final dio = Dio();
  List pays = [];
  final formatteurMontant = NumberFormat.currency(
    locale: 'fr_FR',
    symbol: 'FCFA',
    decimalDigits: 0,
  );
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DevisProvider>(context, listen: false).fetchDevis();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<DevisProvider>(context, listen: false).fetchDevis();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Dévis á valider'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Consumer<DevisProvider>(
            builder: (context, devisProvider, child) {
              if (devisProvider.devis.isEmpty) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else {
                return ListView.builder(
                  itemCount: devisProvider.devis.length,
                  itemBuilder: (context, index) {
                    final devis = devisProvider.devis[index];
                    return Card(
                        color: Colors.white.withOpacity(0.9),
                        child: SizedBox(
                            width: 200, // Largeur fixe
                            // height: 50, // Hauteur fixe
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      devis.entreprise,
                                      textAlign: TextAlign.justify,
                                    ),
                                    width: 150,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text(
                                      formatteurMontant
                                          .format(devis.montant_devis),
                                    ),
                                    width: 120,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DevisDetailScreen(
                                                    test: devisProvider
                                                        .devis[index]),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.arrow_forward,
                                          color: Colors.green)),
                                ],
                              ),
                            )));
                    ;
                  },
                );
              }
            },
          )),
    );
  }
}
