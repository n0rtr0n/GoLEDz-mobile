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

  Future<void> fetchPatterns() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8008/patterns'));
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
                return ListTile(
                  title: Text(patterns[index].id),
                );
              },
            ),
          ),
          FetchPatternsButton(),
        ],
      );
  }
}

class FetchPatternsButton extends StatelessWidget {
  const FetchPatternsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fetchPatterns,
      child: const Text('Fetch patterns'),
    );
  }
}