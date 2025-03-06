import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:brave/models/item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        _items =
            (response.data as List).map((item) => Item.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
