import 'package:crypto_currency_price/features/crypto_currency/presentation/tickers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency Price',
      theme: AppTheme.darkTheme(),
      home: const TickersPage(),
    );
  }
}
