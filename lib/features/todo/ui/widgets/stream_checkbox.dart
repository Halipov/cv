import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class StreamCheckBox extends StatefulWidget {
  const StreamCheckBox({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  final bool initialValue;
  final void Function(bool value) onChanged;

  @override
  State<StreamCheckBox> createState() => _StreamCheckBoxState();
}

class _StreamCheckBoxState extends State<StreamCheckBox> {
  late BehaviorSubject<bool> _value;
  @override
  void initState() {
    _value = BehaviorSubject<bool>.seeded(widget.initialValue);
    _value.stream
        .skip(1)
        .debounceTime(
          const Duration(
            milliseconds: 500,
          ),
        )
        .listen(
          (event) => widget.onChanged(event),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
        stream: _value,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Checkbox(
              value: snapshot.data,
              onChanged: (value) {
                _value.add(value!);
              },
            );
          } else {
            return Container();
          }
        },
      );
}
