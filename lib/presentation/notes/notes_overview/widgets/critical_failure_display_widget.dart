import 'package:flutter/material.dart';

import '../../../../domain/notes/note_failure.dart';
import '../../../core/colors.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({
    Key key,
    @required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "😱",
            style: TextStyle(fontSize: 120.0),
          ),
          Text(
            failure.maybeMap(
                insufficientPermissions: (_) => 'Insufficient Permissions',
                orElse: () => 'Unexpected Error. \nPlease Contact support'),
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40.0),
          FlatButton(
            onPressed: () {
              // ignore: avoid_print
              print('Sending email...');
            },
            textColor: AppColors.primaryDark,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.mail),
                SizedBox(width: 4),
                Text('Request support!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
