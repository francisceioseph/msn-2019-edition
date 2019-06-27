import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/app_bar.dart';
import 'package:messanger/src/widgets/main_page/tabs/calls/calls_tab.dart';
import 'package:messanger/src/widgets/main_page/tabs/contacts/contacts_tab.dart';
import 'package:messanger/src/widgets/main_page/tabs/home_tab.dart';
import 'package:messanger/src/widgets/main_page/tabs/settings/settings_tab.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomeTab(),
      ContactsTab(),
      CallsTab(),
      SettingsTab(),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: MainAppBar(),
        ),
        body: TabBarView(
          children: tabs,
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.contacts),
              text: 'Contacts',
            ),
            Tab(
              icon: Icon(Icons.call),
              text: 'Calls',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Settings',
            )
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.blue,
        ),
      ),
    );
  }
}
