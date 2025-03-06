import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:brave/models/devis.dart';

class DevisProvider with ChangeNotifier {
  List<DevisModel> _devis = [];
  bool _isLoading = false;

  List<DevisModel> get devis => _devis;
  bool get isLoading => _isLoading;

  Future<void> fetchDevis() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await Dio().get('http://10.60.16.109/api/lister/devis/');
      if (response.statusCode == 200) {
        _devis = (response.data as List)
            .map((devi) => DevisModel.fromJson(devi))
            .toList();
      } else {
        throw Exception('Failed to load devis');
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
