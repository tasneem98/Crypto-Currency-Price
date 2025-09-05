import 'package:crypto_currency_price/features/crypto_currency/data/api_repository.dart';
import 'package:crypto_currency_price/features/crypto_currency/data/models/tickers_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TickersNotifier extends StateNotifier<AsyncValue<List<Data?>>> {
  final ApiRepository _apiRepository;
  int _start = 0;

  bool _isLoading = false;

  TickersNotifier(this._apiRepository) : super(const AsyncValue.loading()) {
    fetchTickers();
  }

  Future<void> fetchTickers() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      final currentTickers =
          state.valueOrNull ??
          []; // Get current data or empty list if null/error

      state = await AsyncValue.guard(() async {
        final tickers = await _apiRepository.getTickers(start: _start);
        final newTickers = tickers.data;

        if (newTickers == null) {
          return [...currentTickers];
        }

        _start += 100;
        return [...currentTickers, ...newTickers];
      });
    } on Exception catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> sortTickersByName() async {
    state = await AsyncValue.guard(() async {
      final tickers = state;
      tickers.value?.sort((a, b) => a!.name!.compareTo(b!.name!));
      return [...tickers.value!];
    });
  }

  Future<void> sortTickersByRank() async {
    state = await AsyncValue.guard(() async {
      final tickers = state;
      tickers.value?.sort((a, b) => a!.rank!.compareTo(b!.rank!));
      return [...tickers.value!];
    });
  }
}
