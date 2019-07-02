import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersonalInfoBloc {
  final Stream<FirebaseUser> currentUser;

  PersonalInfoBloc({@required this.currentUser});
}
