import 'dart:async';

import 'package:crypto_currency_price/widgets/ticker_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/crypto_currency/providers/tickers_provider.dart';

class TickersPage extends ConsumerStatefulWidget {
  const TickersPage({super.key});

  @override
  ConsumerState<TickersPage> createState() => _TickersPageState();
}

class _TickersPageState extends ConsumerState<TickersPage>
    with AutomaticKeepAliveClientMixin {
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // Load more data when user scroll to bottom
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_debounce?.isActive ?? false) {
          _debounce!.cancel();
        }
        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (!ref.read(tickersProvider).isLoading) {
            ref.watch(tickersProvider.notifier).fetchTickers();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce!.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final tickersP = ref.watch(tickersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currency'),
        actions: _kAppBarActions,
      ),
      resizeToAvoidBottomInset: true,
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(tickersProvider),
        child: tickersP.when(
          data: (data) => ListView.builder(
            cacheExtent: 100,
            itemCount: data.length,
            controller: _scrollController,
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            itemBuilder: (context, index) {
              final ticker = data[index];
              return TickerItem(ticker: ticker!);
            },
          ),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  List<Widget> get _kAppBarActions => [
    PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          onTap: () => ref.read(tickersProvider.notifier).sortTickersByName(),
          value: 'sort_by_name',
          child: Row(
            spacing: 5.0,
            children: [
              const Icon(Icons.sort_by_alpha_outlined),
              Text(
                'Sort by Name',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () => ref.read(tickersProvider.notifier).sortTickersByRank(),
          value: 'sort_by_rank',
          child: Row(
            spacing: 5.0,
            children: [
              const Icon(Icons.trending_up_outlined),
              Text(
                'Sort by Rank',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}
