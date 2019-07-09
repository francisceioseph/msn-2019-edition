import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final _repository = UserRepository();
  final _userFetcher = PublishSubject<String>();
  final _userOutput =
      BehaviorSubject<Map<String, Observable<DocumentSnapshot>>>();

  UsersBloc() {
    _userFetcher.transform(_userTransformer()).pipe(_userOutput);
  }

  _userTransformer() {
    return ScanStreamTransformer(
      (
        Map<String, Observable<DocumentSnapshot>> cache,
        String userId,
        int index,
      ) {
        cache[userId] = _repository.fetchUser(userId);
        return cache;
      },
      <String, Observable<DocumentSnapshot>>{},
    );
  }

  dispose() {
    _userOutput.close();
    _userFetcher.close();
  }
}
