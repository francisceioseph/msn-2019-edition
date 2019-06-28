import 'dart:async';
import 'package:flutter/material.dart';

enum GuardedRouteStatus {
  canForward,
  cannotForward,
}

typedef void CannotForwardHandler(BuildContext context);

class GuardedRoute extends StatefulWidget {
  final Widget child;
  final Widget loadingScreen;
  final CannotForwardHandler onCannotForward;
  final Stream<GuardedRouteStatus> forwardValidationStream;

  GuardedRoute({
    @required this.child,
    @required this.loadingScreen,
    @required this.onCannotForward,
    @required this.forwardValidationStream,
  }) {
    assert(this.child != null);
    assert(this.loadingScreen != null);
    assert(this.onCannotForward != null);
    assert(this.forwardValidationStream != null);
  }

  @override
  _GuardedRouteState createState() {
    return new _GuardedRouteState();
  }
}

class _GuardedRouteState extends State<GuardedRoute> {
  StreamSubscription<GuardedRouteStatus> _subscription;
  Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = widget.loadingScreen;
    _subscription =
        widget.forwardValidationStream.listen(_onAuthenticationChange);
  }

  @override
  void dispose() {
    super.dispose();
    print('Dispose');
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GuardedRouteStatus>(
      stream: widget.forwardValidationStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          currentWidget = widget.loadingScreen;
          return currentWidget;
        } else if (snapshot.data == GuardedRouteStatus.canForward) {
          currentWidget = widget.child;
        }
        return currentWidget;
      },
    );
  }

  _onAuthenticationChange(GuardedRouteStatus status) {
    if (status == GuardedRouteStatus.cannotForward) {
      widget.onCannotForward(context);
    }
  }
}
