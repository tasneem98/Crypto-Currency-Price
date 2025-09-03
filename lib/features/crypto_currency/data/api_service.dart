import 'package:crypto_currency_price/core/network/api_exceptions.dart';
import 'package:crypto_currency_price/core/network/dio_client.dart';
import 'package:crypto_currency_price/features/crypto_currency/data/models/tickers_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<TickersModel> fetchTickers() async {
    try {
      final response = await dioClient.dio.get('/tickers/');
      return TickersModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExceptions(e.toString());
    }
  }
}
