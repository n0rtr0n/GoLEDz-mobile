class Pattern {
  final String id;
  final Map<String,dynamic> parameters;

  Pattern({
    required this.id,
    required this.parameters,
  });

  factory Pattern.fromJson(key, Map<String, dynamic> json) {
    final Map<String,dynamic> parameters = {};

    json['parameters'].forEach((key, parameter) {
      parameters[key] = parameter;
    });

    return Pattern(
      id: key,
      parameters: parameters,
    );
  }
}