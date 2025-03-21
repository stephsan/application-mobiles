import 'package:brave/pages/devis_page.dart';
import 'package:brave/pages/home_page.dart';
import 'package:brave/providers/devis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brave/models/devis.dart';

class DevisDetailScreen extends StatelessWidget {
  final DevisModel test;

  DevisDetailScreen({required this.test});

  @override
  Widget build(BuildContext context) {
    final devisProvider = Provider.of<DevisProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Détails sur le Devis'),
          elevation: 18,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tâche ID: ${test.id}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Titre: ${test.entreprise}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Montant: ${test.montant_devis}",
                      style: TextStyle(fontSize: 16),
                    ),
                    // SizedBox(height: 20),
                    Center(
                        child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 68, 68),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("Retour"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirmer'),
                                content: Text('Voulez-vous valider le devis ?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('Annuler'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      int? te = test.id;
                                      int te1 = te ?? 0;
                                      //Navigator.of(context).pop();
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MyDevisPage();
                                      }));
                                      devisProvider.updateDevis(te1);
                                      Provider.of<DevisProvider>(context,
                                              listen: false)
                                          .fetchDevis();
                                    },
                                    child: Text('Oui',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 68, 255, 146),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("Valider"),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            )));
  }
}
