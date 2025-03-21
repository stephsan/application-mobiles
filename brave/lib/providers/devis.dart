import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:brave/models/devis.dart';

class DevisProvider with ChangeNotifier {
  List<DevisModel> _devis = [];
  bool _isLoading = false;
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.60.16.139/api'));

  List<DevisModel> get devis => _devis;
  bool get isLoading => _isLoading;
  List<DevisModel> get tasks => _devis;

  Future<void> fetchDevis() async {
    _isLoading = true;
    notifyListeners();

    try {
      Response response = await _dio.get('/lister/devi');
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

  Future<void> updateDevis(int id) async {
    try {
      Response response = await _dio.get(
        '/devis/$id',
      );
      if (response.statusCode == 200) {
        int index = _devis.indexWhere((devi) => devi.id == id);
        if (index != -1) {
          notifyListeners();
        }
      }
    } catch (e) {
      print("Erreur lors de la mise à jour de la tâche : $e");
    }
  }
}
