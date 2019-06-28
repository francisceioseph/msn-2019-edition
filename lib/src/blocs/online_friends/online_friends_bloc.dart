import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class OnlineFriendsBloc {
  final friends = Firestore.instance
      .collection('friends')
      .document('slI7OM52EeRc64cXnocaAxhqOrv1')
      .snapshots()
      .listen(
    (doc) {
      print(doc);
    },
  );

  dispose() {
    friends.cancel();
  }
}
