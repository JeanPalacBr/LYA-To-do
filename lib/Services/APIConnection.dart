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
      print('${response.body}');

      for (var i = 0; i < jsonlist["data"].length; i++) {
        factList.add(Fact.fromJson(jsonlist["data"][i]));
        // Ofert of = new Ofert(
        //     nombre: jsonlist["data"][i]["nombre"],
        //     categoria: jsonlist["data"][i]["categoria"].toString(),
        //     descripcion: jsonlist["data"][i]["descripcion"],
        //     idcategoria: jsonlist["data"][i]["idcategoria"].toString(),
        //     precio: jsonlist["data"][i]["precio"].toString(),
        //     dto: jsonlist["data"][i]["dto"].toString(),
        //     idarticulo: jsonlist["data"][i]["idarticulo"].toString(),
        //     cantidad: jsonlist["data"][i]["cantidad"],
        //     imagen: jsonlist["data"][i]["imagen"],
        //     disponible: "",
        //     formulario: true);
        //ofertList.add(of);
      }
    } else {
      print("request failed");
      print('${response.body}');
    }
  } catch (e) {}
  return factList;
}
