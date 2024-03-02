import 'package:flutter/material.dart';

import 'package:goledz_controller/models/parameters.dart';

class ColorParameterWidget extends StatelessWidget {
  final ColorParameter parameter;

  const ColorParameterWidget({
    super.key,
    required this.parameter,
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
              "Red",
            ),
            Text(
              parameter.value.r.toString(),
            ),
            const Text(
              "Green",
            ),
            Text(
              parameter.value.g.toString(),
            ),
            const Text(
              "Blue",
            ),
            Text(
              parameter.value.b.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
