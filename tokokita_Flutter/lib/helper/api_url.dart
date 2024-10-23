  class ApiUrl {
    static const String baseUrl = 'http://127.0.0.1:8000/api';

    static const String registrasi = baseUrl + '/register';
    static const String login = baseUrl + '/login';
    static const String listProduk = baseUrl + '/produk';
    static const String createProduk = baseUrl + '/produk/create';

    static String updateProduk(int id) {
      return baseUrl + '/produk/update/' + id.toString();
    }

    static String showProduk(int id) {
      return baseUrl + '/produk/show/' + id.toString();
    } 

    static String deleteProduk(int id) {
      return baseUrl + '/produk/delete/' + id.toString();
    }
  }
