import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UncompletedSwitch extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);

    return InkResponse(
      onTap: () {
        toggleState.value = !toggleState.value;
      },
      child: Icon(
        toggleState.value
            ? Icons.check_box_outline_blank
            : Icons.indeterminate_check_box_rounded,
      ),
    );
  }
}
