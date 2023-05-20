import 'package:chat_app/main.dart';
import 'package:chat_app/screens/chat/chatList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'calls/calls.dart';

class tabBar extends StatefulWidget {
  const tabBar({Key? key}) : super(key: key);

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Chatify',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          bottom: TabBar(
              physics: BouncingScrollPhysics(),
              labelColor: primaryColor,
              unselectedLabelColor: Colors.black,
              labelStyle: GoogleFonts.poppins(
                color: Colors.black,fontSize: 18
              ),
              // labelPadding: EdgeInsets.only(right: 30),
              indicatorPadding: EdgeInsets.only(right: 40,left: 40),
              indicatorColor: primaryColor,

              tabs: [
                Tab(
                  text: 'Chat',
                ),
                Tab(
                  text: 'Call',
                )
              ]),
        ),
        body: TabBarView(
          children: [
chatList(),
            calls()
          ],
        ),
      ),

    );
  }
}
