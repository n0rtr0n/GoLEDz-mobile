import 'dart:ffi';

import 'package:goledz_controller/models/color.dart';

class AdjustableParameter {
  factory AdjustableParameter.fromJson(String label, Map<String, dynamic> json) {
    if (!json.containsKey('type')) {
      throw Exception('Adjustable parameter does not have a type');
    }
    final type = json['type'];

    switch (type) {
      case 'int':
        final int value = json['value'];
        final int min = json['min'];
        final int max = json['max'];
        return IntParameter(label: label, value: value, min: min, max: max);
      case 'float':
        final double value = json['value'].toDouble();
        final double min = json['min'].toDouble();
        final double max = json['max'].toDouble();
        return FloatParameter(label: label, value: value, min: min, max: max);
      case 'bool':
        final bool value = json['value'];
        return BoolParameter(label: label, value: value);
      case 'color':
        final color = json['color'];
        final Color value = Color(
          r: color['r'],
          b: color['b'],
          g: color['g'],
        );
        return ColorParameter(label: label, value: value);
      default:
        print(type);
        throw Exception('Invalid type for AdjustableParameter found');
    }
  }
}

class FloatParameter implements AdjustableParameter {
  final String label;
  final double value;
  final double min;
  final double max;

  FloatParameter({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
  });
}

class IntParameter implements AdjustableParameter {
  final String label;
  final int value;
  final int min;
  final int max;

  IntParameter({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
  });
}

class BoolParameter implements AdjustableParameter {
  final String label;
  final bool value;

  BoolParameter({
    required this.label,
    required this.value,
  });
}

class ColorParameter implements AdjustableParameter {
  final String label;
  final Color value;

  ColorParameter({
    required this.label,
    required this.value,
  });
}
