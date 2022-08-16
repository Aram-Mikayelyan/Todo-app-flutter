import 'package:flutter/material.dart';

import 'widgets.dart';

class CreateFilterSection extends StatefulWidget {
  const CreateFilterSection({Key? key}) : super(key: key);

  @override
  State<CreateFilterSection> createState() => _CreateFilterSectionState();
}

class _CreateFilterSectionState extends State<CreateFilterSection> {
  bool isAllChecked = true;
  bool isCompletedChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterButton(
          isChecked: isAllChecked,
          label: 'All',
          onPressed: () {
            setState(() {
              isAllChecked = true;
              isCompletedChecked = false;
            });
          },
        ),
        FilterButton(
          isChecked: isCompletedChecked,
          label: 'Completed',
          onPressed: () {
            setState(() {
              isCompletedChecked = true;
              isAllChecked = false;
            });
          },
        ),
      ],
    );
  }
}
