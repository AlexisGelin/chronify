import 'package:flutter/material.dart';

class CreateSlider extends StatefulWidget {
  const CreateSlider({Key? key}) : super(key: key);

  @override
  State<CreateSlider> createState() => _CreateSlider();
}

class _CreateSlider extends State<CreateSlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slider(
        value: _currentSliderValue,
        max: 100,
        activeColor: Theme.of(context).colorScheme.secondary,
        inactiveColor: Theme.of(context).colorScheme.background,
        thumbColor: Theme.of(context).colorScheme.secondary,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
