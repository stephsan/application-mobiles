import 'package:brave/models/devis.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'Content-type': 'application/json'}));
  // Recuperer la liste des devis
  Future<List<DevisModel>> getDevis() async {
    try {
      final response = await _dio.get('/todos');
      return (response.data as List)
          .map((devi) => DevisModel.fromJson(devi))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
