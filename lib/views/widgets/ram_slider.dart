import 'package:flutter/material.dart';

import 'package:mine_ui/data/databases/settings.dart' as settings;

class RamSlider extends StatefulWidget {
  const RamSlider({super.key});

  @override
  State<RamSlider> createState() => _RamSliderState();
}

class _RamSliderState extends State<RamSlider> {
  RangeValues _currentRangeValues =
      RangeValues(settings.defaultMinRam, settings.defaultMaxRam);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 8.0, 0.0),
          child: Text(
            "Allocated RAM:"
            "${_currentRangeValues.start.round()} MB - "
            "${_currentRangeValues.end.round()} MB",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RangeSlider(
          divisions: 256,
          values: _currentRangeValues,
          max: settings.maxAllowedRam,
          min: settings.minAllowedRam,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              settings.defaultMinRam = _currentRangeValues.start;
              settings.defaultMaxRam = _currentRangeValues.end;
              _currentRangeValues = values;
            });
          },
        ),
      ],
    );
  }
}
