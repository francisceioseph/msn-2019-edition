import 'package:messanger/src/blocs/login/bloc.dart';
import 'package:messanger/src/blocs/online_friends/online_friends_bloc.dart';
import 'package:messanger/src/blocs/personal_info/personal_info_bloc.dart';

class AppBloc {
  AuthBloc _authBloc;
  PersonalInfoBloc _personalInfoBloc;
  OnlineFriendsBloc _onlineFriendsBloc;

  AppBloc() {
    _authBloc = AuthBloc();
    _personalInfoBloc = PersonalInfoBloc(
      currentUser: _authBloc.user,
    );
    _onlineFriendsBloc = OnlineFriendsBloc(_authBloc.user);
  }

  AuthBloc get authBloc => _authBloc;
  PersonalInfoBloc get personalInfoBloc => _personalInfoBloc;
  OnlineFriendsBloc get onlineFriendsBloc => _onlineFriendsBloc;
}
