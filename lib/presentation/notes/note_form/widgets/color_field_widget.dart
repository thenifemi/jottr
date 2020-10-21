import 'package:flutter/material.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: null,
        separatorBuilder: null,
        itemCount: null,
      ),
    );
  }
}
