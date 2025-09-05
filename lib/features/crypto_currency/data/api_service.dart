import 'package:dio/dio.dart';

import '/core/network/api_exceptions.dart';
import '/core/network/dio_client.dart';
import '/features/crypto_currency/data/models/tickers_model.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<TickersModel> fetchTickers({required int start}) async {
    try {
      final response = await dioClient.dio.get(
        '/tickers/?start=$start&limit=100',
      );
      return TickersModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExceptions(e.toString());
    }
  }
}
