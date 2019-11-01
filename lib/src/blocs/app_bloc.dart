import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/blocs/calls_bloc.dart';
import 'package:messanger/src/blocs/chat_bloc.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/blocs/personal_info_bloc.dart';

class AppBloc {
  AuthBloc _authBloc;
  PersonalInfoBloc _personalInfoBloc;
  FriendsBloc _friendsBloc;
  ChatBloc _chatBloc;
  CallsBloc _callsBloc;

  AppBloc() {
    _authBloc = AuthBloc();
    _personalInfoBloc = PersonalInfoBloc(
      currentUser: _authBloc.user,
    );
    _friendsBloc = FriendsBloc(_authBloc.user);
    _chatBloc = ChatBloc(_authBloc.user);
    _callsBloc = CallsBloc(_authBloc.user);
  }

  AuthBloc get authBloc => _authBloc;
  PersonalInfoBloc get personalInfoBloc => _personalInfoBloc;
  FriendsBloc get friendsBloc => _friendsBloc;
  ChatBloc get chatBloc => _chatBloc;
  CallsBloc get callsBloc => _callsBloc;
}
