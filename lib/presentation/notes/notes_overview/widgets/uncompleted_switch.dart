import 'package:flutter/material.dart';

class UncompletedSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Icon(Icons.check_box_outline_blank),
    );
  }
}
