class DevisModel {
  int? id;
  String designation;
  String entreprise;
  String statut;
  String description;
  int montant_devis;
  int montant_avance;
  int nombre_de_paiement;
  DevisModel(
      {required this.designation,
      required this.entreprise,
      required this.description,
      required this.montant_avance,
      required this.montant_devis,
      required this.statut,
      required this.nombre_de_paiement,
      this.id});
  // Methode pour convertir les données json en model Devis
  factory DevisModel.fromJson(Map<String, dynamic> json) {
    return DevisModel(
        id: json['id'],
        designation: json['designation'],
        statut: json['statut'],
        entreprise: json['entreprise'],
        description: json['description'],
        montant_avance: json['montant_avance'],
        montant_devis: json['montant_devis'],
        nombre_de_paiement: json['nombre_de_paiement']);
  }

  // Methode pour convertir model Devis en données json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'designation': designation,
      'entreprise': entreprise,
      'entreprise': statut,
      'description': description,
      'montant_avance': montant_avance,
      'montant_devis': montant_devis,
      'nombre_de_paiement': nombre_de_paiement
    };
  }
}
