import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:goledz_controller/models/pattern.dart';
class PatternSelector extends StatefulWidget {
  const PatternSelector({super.key});

  @override
  State<PatternSelector> createState() => _PatternSelectorState();
}

class _PatternSelectorState extends State<PatternSelector> {
  List<Pattern> patterns = [];
  final baseURL = 'http://127.0.0.1:8008';

  Future<http.Response> _updatePattern(int index, Pattern pattern) {
    return http.put(
      Uri.parse('$baseURL/patterns/${pattern.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'parameters': pattern.parameters,
      }),
    );
  }

  Future<void> _fetchPatterns() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/patterns'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final Map<String, dynamic> patternsData = data['patterns'];
        final List<Pattern> fetchedPatterns = [];
        patternsData.forEach((key, pattern) {
          fetchedPatterns.add(Pattern.fromJson(key, pattern));
        });

        setState(() {
          patterns = fetchedPatterns;
        });
      } else {
        throw Exception('Failed to fetch patterns');
      }
    } catch (e) {
      print('caught error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: patterns.length,
            itemBuilder: (context, index) {
              return Card(
                child: ElevatedButton(
                  onPressed: () {
                    _updatePattern(index, patterns[index]);
                  },
                  child: Text(patterns[index].id),
                ),
              );
            },
          ),
        ),
        FetchPatternsButton(
          onFetchPatterns: _fetchPatterns,
        ),
      ],
    );
  }
}

class FetchPatternsButton extends StatelessWidget {
  const FetchPatternsButton({
    super.key,
    required this.onFetchPatterns,
  });

  final void Function() onFetchPatterns;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onFetchPatterns,
      child: const Text('Fetch patterns'),
    );
  }
}
