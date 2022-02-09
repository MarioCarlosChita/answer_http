import 'dart:async';
import 'dart:convert';

class ApiService {
  Future<Item> FetchItem() async {
    try {
      final _response = await http.get("https://www.moharaj.com.bd/_public/cartToContent");
      final _convertResponse = json.decode(_response);
      return Item.fromJson(_convertResponse['cart_content']['996967e04abbe91f1fb5985fe4cefe4f']);
    } catch (exception) {
      throw exception;
    }
  }
}
