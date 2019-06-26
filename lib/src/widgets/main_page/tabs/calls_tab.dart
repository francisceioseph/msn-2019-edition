import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/call_list.dart';

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CallList(
      calls: [1, 2, 3, 4, 5, 6],
    );
  }
}
