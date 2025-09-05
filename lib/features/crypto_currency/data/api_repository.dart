import 'package:crypto_currency_price/features/crypto_currency/data/api_service.dart';
import 'package:crypto_currency_price/features/crypto_currency/data/models/tickers_model.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  Future<TickersModel> getTickers({required int start}) async {
    final result = await apiService.fetchTickers(start: start);
    return result;
  }
}
