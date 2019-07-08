import 'package:messanger/src/blocs/auth_bloc.dart';
import 'package:messanger/src/blocs/chat_bloc.dart';
import 'package:messanger/src/blocs/online_friends_bloc.dart';
import 'package:messanger/src/blocs/personal_info_bloc.dart';

class AppBloc {
  AuthBloc _authBloc;
  PersonalInfoBloc _personalInfoBloc;
  OnlineFriendsBloc _onlineFriendsBloc;
  ChatBloc _chatBloc;

  AppBloc() {
    _authBloc = AuthBloc();
    _personalInfoBloc = PersonalInfoBloc(
      currentUser: _authBloc.user,
    );
    _onlineFriendsBloc = OnlineFriendsBloc(_authBloc.user);
    _chatBloc = ChatBloc(_authBloc.user);
  }

  AuthBloc get authBloc => _authBloc;
  PersonalInfoBloc get personalInfoBloc => _personalInfoBloc;
  OnlineFriendsBloc get onlineFriendsBloc => _onlineFriendsBloc;
  ChatBloc get chatBloc => _chatBloc;
}
