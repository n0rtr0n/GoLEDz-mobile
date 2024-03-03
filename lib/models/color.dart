class Color {

  Map<String, dynamic> toJson() {
    return {
      'r': r,
      'g': g,
      'b': b,
    };
  }

  final int r;
  final int g;
  final int b;

  Color({
    required this.r,
    required this.g,
    required this.b,
  });
}