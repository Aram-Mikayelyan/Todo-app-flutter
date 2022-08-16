import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onPressed;
  const FilterButton({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isChecked ? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
              color: isChecked ? Colors.white : Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
