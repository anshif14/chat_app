import 'package:chat_app/screens/chat/chatView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class chatList extends StatefulWidget {
  const chatList({Key? key}) : super(key: key);

  @override
  State<chatList> createState() => _chatListState();
}

class _chatListState extends State<chatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                // Navigator.push(context, PageRouteBuilder(
                //   opaque: true,
                //   transitionDuration: const Duration(milliseconds: 2000),
                //   pageBuilder: (context, animation, secondaryAnimation) => chatView(name: 'john doe'),
                //     transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                //
                //       return new SlideTransition(
                //         child: child,
                //         position: new Tween<Offset>(
                //           begin: const Offset(1, 1),
                //           end: Offset.zero,
                //         ).animate(animation),
                //       );
                //     }
                // ));

                Navigator.push(context, CupertinoPageRoute(builder: (context) => chatView(name: 'john'),));
              },
              child: ListTile(

                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                ),
                title: Text('john Doe'),
                subtitle: Text('last message'),
                trailing: Text(DateFormat('hh:mm').format(DateTime.now())),
              ),
            ),
          );
        },
      ),
    );
  }
}
