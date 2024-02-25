import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Pattern {
  final String id;

  Pattern({required this.id});

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      id: json['id'],
    );
  }
}

class PatternSelector extends StatefulWidget {
  const PatternSelector({super.key});

  @override
  State<PatternSelector> createState() => _PatternSelectorState();
}

class _PatternSelectorState extends State<PatternSelector> {
  List<Pattern> patterns = [];
  final baseURL = 'http://127.0.0.1:8008';

  Future<http.Response> _updatePattern(String patternId) {
    return http.put(
      Uri.parse('$baseURL/patterns/$patternId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'patternId': patternId,
      }),
    );
  }

  Future<void> _fetchPatterns() async {
    try {
      final response =
          await http.get(Uri.parse('$baseURL/patterns'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<dynamic> patternsData = data['patterns'];
        final List<Pattern> fetchedPatterns =
            patternsData.map((pattern) => Pattern.fromJson(pattern)).toList();

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
                    _updatePattern(patterns[index].id);
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
