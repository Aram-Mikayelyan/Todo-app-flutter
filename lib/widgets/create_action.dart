import 'package:flutter/material.dart';

class CreateAction extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color color;

  const CreateAction({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: color),
        )),
      ),
    );
  }
}
