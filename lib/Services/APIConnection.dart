import 'dart:convert';

import 'package:lya_to_do/Models/fact.dart';
import 'package:http/http.dart' as http;

Future<List<Fact>> getFacts(String cantidad) async {
  List<Fact> factList = <Fact>[];
  try {
    var url = Uri.https("catfact.ninja", "/facts", {
      'limit': [cantidad]
    });
    final http.Response response = await http.get(url);
    print('${response.body}');
    print('${response.statusCode}');
    if (response.statusCode == 200) {
      print('${response.body}');
      Map<dynamic, dynamic> jsonlist = json.decode(response.body);
      for (var i = 0; i < jsonlist["data"].length; i++) {
        factList.add(Fact.fromJson(jsonlist["data"][i]));
      }
    } else {
      print("request failed");
      print('${response.body}');
    }
  } catch (e) {}
  return factList;
}
