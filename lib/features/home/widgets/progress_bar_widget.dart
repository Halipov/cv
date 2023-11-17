import 'package:flutter/material.dart';

class ProgressBarTile extends StatelessWidget {
  const ProgressBarTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Expanded(
              child: Text(
            '7 PM',
            textAlign: TextAlign.center,
          )),
          SizedBox(
            width: 230,
            child: LinearProgressIndicator(
              minHeight: 25,
              value: 0.5,
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const Expanded(
              child: Text(
            '7 PM',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
