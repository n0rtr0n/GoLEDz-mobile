import 'package:flutter/material.dart';

import 'package:goledz_controller/models/parameters.dart';

class IntParameterWidget extends StatelessWidget {
  final IntParameter parameter;
  // we'll perform the conversion directly within this function
  final void Function(double value) onParameterUpdate;

  const IntParameterWidget({
    super.key,
    required this.parameter,
    required this.onParameterUpdate,
  });

  @override
  Widget build(Object context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Label",
            ),
            Text(
              parameter.label,
            ),
            const Text(
              "Value",
            ),
            Text(
              parameter.value.toInt().toString(),
            ),
            Slider(
              value: parameter.value.toDouble(),
              onChanged: onParameterUpdate,
              min: parameter.min.toDouble(),
              max: parameter.max.toDouble(),
              divisions: parameter.max - parameter.min,
            ),
          ],
        ),
      ),
    );
  }
}
