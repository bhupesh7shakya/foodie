import 'dart:convert';

import 'package:http/http.dart';

class UserModal {
  String search;
  UserModal(this.search);
  Future<List> getSearch() async {
    try {
      var response = await get(Uri.parse(
          'http://192.168.100.85/foodie/API/search.php?search=' + search));
      List searchResult = jsonDecode(response.body);
      return searchResult;
    } catch (e) {
      List error = [e];
      return error;
    }
  }
}
// To parse this JSON data, do
//
//     final getSearchData = getSearchDataFromJson(jsonString);

