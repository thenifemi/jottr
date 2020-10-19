import 'package:Jottr/domain/notes/note_failure.dart';
import 'package:flutter/cupertino.dart';

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
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
