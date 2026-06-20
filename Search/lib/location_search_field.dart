import 'package:flutter/material.dart';
import 'location_data.dart';

class LocationSearchField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const LocationSearchField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  List<Map<String, String>> suggestions = [];

  void _onTextChanged(String value) {
    if (value.isEmpty) {
      setState(() => suggestions = []);
      return;
    }

    final query = value.toLowerCase();

    final results = LocationData.cities.where((item) {
      final city = item["city"]!.toLowerCase();
      final state = item["state"]!.toLowerCase();
      return city.contains(query) || state.contains(query);
    }).toList();

    setState(() => suggestions = results);
  }

  void _selectSuggestion(Map<String, String> item) {
    widget.controller.text = "${item["city"]}, ${item["state"]}";
    setState(() => suggestions = []);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          onChanged: _onTextChanged,
          decoration: InputDecoration(
            labelText: widget.label,
            border: const OutlineInputBorder(),
          ),
        ),
        if (suggestions.isNotEmpty)
          Container(
            constraints: const BoxConstraints(maxHeight: 160),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final item = suggestions[index];
                return ListTile(
                  title: Text("${item["city"]}, ${item["state"]}"),
                  onTap: () => _selectSuggestion(item),
                );
              },
            ),
          ),
      ],
    );
  }
}
