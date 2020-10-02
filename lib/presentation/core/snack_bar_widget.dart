import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String value;

  const MySnackBar({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Row(
        children: <Widget>[
          const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
