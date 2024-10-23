import 'dart:convert';

import 'package:tokokita/helper/api.dart';
import 'package:tokokita/helper/api_url.dart';
import 'package:tokokita/model/produk.dart';
import 'package:http/http.dart' as http;
class ProdukBloc {
static Future<List<Produk>> getProduks() async {
  Uri apiUrl = Uri.parse(ApiUrl.listProduk); 
  var response = await http.get(apiUrl); 
  var jsonObj = json.decode(response.body);
  List<dynamic> listProduk = jsonObj['data']; 
  List<Produk> produks = listProduk.map((json) => Produk.fromJson(json)).toList();
  return produks;
}



static Future<Map<String, dynamic>> addProduk({Produk? produk}) async {
  String apiUrl = ApiUrl.createProduk;

  var body = {
    "kode_produk": produk!.kodeProduk,
    "nama_produk": produk.namaProduk,
    "harga": produk.hargaProduk.toString()
  };

  var response = await Api().post(apiUrl, body);
  var jsonObj = json.decode(response.body);
  var addedProduct = jsonObj['product'];

  var message = jsonObj['message'];

  return {
    "product": addedProduct,
    "message": message
  };
}


static Future<bool> updateProduk({required Produk produk}) async {
  try {
    String apiUrl = ApiUrl.updateProduk(produk.id!);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    var message = jsonObj['message'];
    var updatedProduk = jsonObj['product'];
  
    if (message == 'Successfully updated') {
      return true;
    } else {
      print("Error updating product: $message");
      return false;
    }
  } catch (error) {
    print("Error updating product: $error");
    return false;
  }
}

static Future<bool> deleteProduk({required Produk produk}) async {
  String apiUrlString = ApiUrl.deleteProduk(produk.id!);
  Uri apiUrl = Uri.parse(apiUrlString);

  var response = await Api().delete(apiUrl);
  var jsonObj = json.decode(response.body);
  return (jsonObj as Map<String, dynamic>)['data'];
}


}
