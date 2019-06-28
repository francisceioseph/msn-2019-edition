import 'dart:async';
import 'package:messanger/src/mixins/validator.dart';
import 'package:messanger/src/models/user.dart';
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
    final validEmail = _email.value;
    final validPassword = _password.value;

    print(validEmail);
    print(validPassword);

    login();
  }

  void login() {
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
