import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/core/extensions/intl_extension.dart';
import '/features/crypto_currency/data/models/tickers_model.dart';
import 'percent_change_widget.dart';

class TickerItem extends StatelessWidget {
  const TickerItem({super.key, required this.ticker});

  final Data ticker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Tooltip(
        message: '${ticker.name}',
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: SvgPicture.asset(
                    'assets/svg/${ticker.symbol!.toLowerCase()}.svg',
                    errorBuilder: (_, _, _) => const Icon(Icons.error_outline),
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5,
                      children: [
                        Text(
                          '${ticker.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text('${ticker.symbol}'),
                      ],
                    ),
                  ),
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
                          ticker.priceUsd.toString(),
                        ),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge,
                      ),
                    ),
                    PercentChangeWidget(
                      percentChange: ticker.percentChange7d.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
