import 'package:crypto_currency_price/core/extensions/intl_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/features/crypto_currency/providers/tickers_provider.dart';

class TickersPage extends StatefulWidget {
  const TickersPage({super.key});

  @override
  State<TickersPage> createState() => _TickersPageState();
}

class _TickersPageState extends State<TickersPage>
        //ToDo: Add AutomaticKeepAliveClientMixin
        with
        AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currency'),
      ),
      resizeToAvoidBottomInset: true,
      //ToDo: Pull to refresh
      //ToDo: LoadMore
      body: Consumer(
        builder: (context, ref, child) {
          final tickers = ref.watch(tickersProvider);
          return tickers.when(
            data: (data) => ListView.builder(
              addAutomaticKeepAlives: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              cacheExtent: 100,
              itemCount: data.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Card(
                    child: ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/${data.data![index].symbol!.toLowerCase()}.svg',
                        errorBuilder: (_, _, _) =>
                            const Icon(Icons.error_outline),
                      ),
                      title: Text(
                        '${data.data![index].name}',
                      ),
                      subtitle: Text('${data.data![index].symbol}'),
                      trailing: Text(
                        NumberFormatExtension.formatCurrency(
                          data.data![index].priceUsd.toString(),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                );
              },
            ),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
