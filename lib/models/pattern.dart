import 'package:goledz_controller/models/parameters.dart';

class Pattern {
  final String id;
  final Map<String,AdjustableParameter> parameters;

  Pattern({
    required this.id,
    required this.parameters,
  });

  factory Pattern.fromJson(key, Map<String, dynamic> json) {
    final Map<String,AdjustableParameter> parameters = {};

    json['parameters'].forEach((k, parameter) {
      try {
        // print("json of parameter is");
        // print(parameter);
        parameters[k] = AdjustableParameter.fromJson(k, parameter);
      } catch (e){
        print(e);
        print(key);
        print(parameter);
      }
    });

    print(parameters);

    return Pattern(
      id: key,
      parameters: parameters,
    );
  }
}