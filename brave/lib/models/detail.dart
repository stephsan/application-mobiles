class DetailModel {
  int subvention_accorde_aop;
  int subvention_accorde_mpme;
  int contre_partie_mobilise;
  int montant_facture_payee;

  DetailModel({
    required this.subvention_accorde_aop,
    required this.contre_partie_mobilise,
    required this.subvention_accorde_mpme,
    required this.montant_facture_payee,
  });
  // Methode pour convertir les données json en model Devis
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      subvention_accorde_aop: json['subvention_accorde_aop'],
      contre_partie_mobilise: json['contre_partie_mobilise'],
      subvention_accorde_mpme: json['entreprise'],
      montant_facture_payee: json['montant_facture_payee'],
    );
  }

  // Methode pour convertir model Devis en données json
  Map<String, dynamic> toJson() {
    return {
      'subvention_accorde_aop': subvention_accorde_aop,
      'contre_partie_mobilise': contre_partie_mobilise,
      'subvention_accorde_mpme': subvention_accorde_mpme,
      'montant_facture_payee': montant_facture_payee,
    };
  }
}
