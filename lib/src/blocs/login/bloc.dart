import 'dart:async';
import 'package:messanger/src/mixins/validator.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/network/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with ValidationMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _authCtrl = BehaviorSubject<User>(seedValue: User());

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password =>
      _password.stream.transform(validatePassword);
  Observable<bool> get enableSubmit =>
      Observable.combineLatest2(email, password, (e, p) => true);
  Stream<User> get user => _authCtrl.asBroadcastStream();

  void submit() {
    final email = _email.value;
    final password = _password.value;

    login(email, password);
  }

  void login(String email, String password) async {
    final loginRepo = LoginRepository();
    await loginRepo.login(email, password);
    _authCtrl.sink.add(User(name: ''));
  }

  void logout() {
    _authCtrl.sink.add(User());
  }

  void dispose() {
    _email.close();
    _password.close();
    _authCtrl.close();
  }
}
