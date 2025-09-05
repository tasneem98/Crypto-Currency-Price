import 'package:flutter/material.dart';

import '/core/extensions/percent_change_extension.dart';

class PercentChangeWidget extends StatelessWidget {
  const PercentChangeWidget({
    super.key,
    required this.percentChange,
  });

  final String percentChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (double.parse(percentChange) > 0 ? Colors.green : Colors.red)
            .withOpacity(0.2),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Icon(
            double.parse(percentChange) > 0
                ? Icons.arrow_upward_outlined
                : Icons.arrow_downward_outlined,
            size: 16,
            color: double.parse(percentChange) > 0 ? Colors.green : Colors.red,
          ),
          Text(
            (double.parse(percentChange)).percentChange,
            style: TextStyle(
              color: double.parse(percentChange) > 0
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
