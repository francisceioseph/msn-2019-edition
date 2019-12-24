import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final _repository = UserRepository();
  final _userFetcher = PublishSubject<String>();
  final _userOutput = BehaviorSubject<Map<String, Stream<DocumentSnapshot>>>();

  UsersBloc() {
    _userFetcher.transform(_userTransformer()).pipe(_userOutput);
  }

  Observable<Map<String, Stream<DocumentSnapshot>>> get users =>
      _userOutput.stream;

  fetchUser(String userId) {
    this._userFetcher.sink.add(userId);
  }

  _userTransformer() {
    return ScanStreamTransformer(
      (
        Map<String, Stream<DocumentSnapshot>> cache,
        String userId,
        int index,
      ) {
        cache[userId] = _repository.fetchUser(userId);
        return cache;
      },
      <String, Stream<DocumentSnapshot>>{},
    );
  }

  dispose() {
    _userOutput.close();
    _userFetcher.close();
  }
}
