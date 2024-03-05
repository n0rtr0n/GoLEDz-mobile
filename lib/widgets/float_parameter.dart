import 'package:flutter/material.dart';

import 'package:goledz_controller/models/parameters.dart';

class FloatParameterWidget extends StatelessWidget {
  final FloatParameter parameter;
  final void Function(double value) onParameterUpdate;

  const FloatParameterWidget({
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
              parameter.value.toStringAsFixed(2),
            ),
            Slider(
              value: parameter.value,
              onChanged: onParameterUpdate,
              min: parameter.min,
              max: parameter.max,
            ),
          ],
        ),
      ),
    );
  }
}
