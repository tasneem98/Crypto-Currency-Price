import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/network/dio_client.dart';
import '/features/crypto_currency/data/api_repository.dart';
import '/features/crypto_currency/data/api_service.dart';
import '/features/crypto_currency/data/models/tickers_model.dart';

// DioClient provider
final dioClientProvider = Provider<DioClient>((ref) => DioClient());

// ApiService provider
final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiService(ref.watch(dioClientProvider)),
);

// ApiRepository provider
final apiRepositoryProvider = Provider<ApiRepository>(
  (ref) => ApiRepository(ref.watch(apiServiceProvider)),
);

// Tickers provider
final tickersProvider = FutureProvider<TickersModel>(
  (ref) async => await ref.watch(apiRepositoryProvider).getTickers(),
);
