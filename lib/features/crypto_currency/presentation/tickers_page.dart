import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/extensions/intl_extension.dart';
import '/features/crypto_currency/providers/tickers_provider.dart';
import '/widgwts/percent_change_widget.dart';

class TickersPage extends StatefulWidget {
  const TickersPage({super.key});

  @override
  State<TickersPage> createState() => _TickersPageState();
}

class _TickersPageState
    extends
        State<TickersPage> // ToDo: Add AutomaticKeepAliveClientMixin
    with AutomaticKeepAliveClientMixin {
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
      // ToDo: Pull to refresh
      // ToDo: LoadMore
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 5,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/${data.data![index].symbol!.toLowerCase()}.svg',
                            errorBuilder: (_, _, _) =>
                                const Icon(Icons.error_outline),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${data.data![index].name}'),
                              Text('${data.data![index].symbol}'),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 5,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Text(
                                  NumberFormatExtension.formatCurrency(
                                    data.data![index].priceUsd.toString(),
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge,
                                ),
                              ),
                              PercentChangeWidget(
                                percentChange: data.data![index].percentChange7d
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
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
