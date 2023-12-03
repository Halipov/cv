import 'package:cv/assets/color/color_scheme.dart';
import 'package:cv/util/extensions/date_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgressBarTile extends StatelessWidget {
  const ProgressBarTile({
    super.key,
    required this.date,
    required this.persantage,
  });

  final DateTime date;
  final int persantage;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                date.isNow ? 'Now' : DateFormat('hh a').format(date),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 230,
              child: LinearProgressIndicator(
                minHeight: 25,
                value: persantage / 100,
                color: AppColorScheme.of(context).primary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Text(
                '$persantage%',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
