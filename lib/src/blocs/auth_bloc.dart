import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'package:messanger/src/mixins/validator.dart';
import 'package:messanger/src/repositories/auth_repository.dart';

class AuthBloc extends Object with ValidationMixin {
  final _authRepository = AuthRepository();
  final _userRepository = UserRepository();

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _user = BehaviorSubject<FirebaseUser>();

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password =>
      _password.stream.transform(validatePassword);
  Observable<bool> get enableSubmit =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Observable<FirebaseUser> get user => _user.stream;

  void submit() {
    final email = _email.value;
    final password = _password.value;

    login(email, password);
  }

  void login(String email, String password) async {
    try {
      final user = await _authRepository.login(email, password);
      _user.sink.add(user);
    } catch (e) {
      _user.sink.addError(e);
    }
  }

  void createUser(String name, String email, String password) async {
    try {
      final FirebaseUser user =
          await _authRepository.createUser(email, password);

      final UserUpdateInfo updater = UserUpdateInfo();
      updater.displayName = name;
      await user.updateProfile(updater);

      await _userRepository.updateUserInfo(user, {
        'name': name,
        'email': email,
        'friends': [],
        'music': '',
        'status': 'online'
      });

      _user.sink.add(user);
    } catch (error) {
      _user.sink.addError(error);
    }
  }

  void logout() {
    _user.sink.add(null);
  }

  void dispose() {
    _email.close();
    _password.close();
    _user.close();
  }
}
