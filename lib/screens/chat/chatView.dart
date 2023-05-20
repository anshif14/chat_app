import 'package:chat_app/main.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_composer/chat_composer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class chatView extends StatefulWidget {
  const chatView({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<chatView> createState() => _chatViewState();
}

class _chatViewState extends State<chatView> {
  List messages = [];
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 30,
        toolbarHeight: 80,
        title: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: primaryColor,
                )),
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: primaryColor),
                      color: primaryColorLight,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.call_outlined,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor),
                    color: primaryColorLight,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.more_vert_outlined,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end
                            ,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BubbleSpecialThree(
                                textStyle: TextStyle(color: Colors.white),
                                color: Colors.indigo.shade400,
                                tail: true,
                                text: messages.reversed.toList()[index],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(DateFormat('hh:mm').format(DateTime.now()),style: TextStyle(
                                    fontSize: 10
                                  ),

                                  ),SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BubbleSpecialThree(
                                textStyle: TextStyle(color: Colors.white),
                                isSender: false,
                                color: Colors.indigo.shade100,
                                tail: true,
                                text: messages.reversed.toList()[index],
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(DateFormat('hh:mm').format(DateTime.now()),style: TextStyle(
                                  fontSize: 10
                              ),

                              ),
                            ],
                          )

                        ],
                      );

                  ;
                },
              ),
            ),
            ChatComposer(
              leading: IconButton(
                icon: Icon(CupertinoIcons.smiley),
                onPressed: () {},
              ),
              controller: messageController,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.attach_file))
              ],
              sendButtonBackgroundColor: primaryColor,
              sendButtonColor: Colors.white,
              onReceiveText: (str) {
                print('TEXT : ' + str!);
                messages.add(str!);
                messageController.clear();
                setState(() {});
              },
              onRecordEnd: (path) {
                print('AUDIO PATH : ' + path!);
              },
            ),
          ],
        ),
      ),

//       body: Center(
//         child: SizedBox(
//         width:  MediaQuery.of(context).size.width *0.8,
//           child: TextFormField(
//             controller: messageController,
// keyboardType: TextInputType.multiline,
// textInputAction: TextInputAction.newline,
// maxLines: null,
// decoration: InputDecoration(
//   labelText: "Message",
//     hintText: "Message",
//     border: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.black
//         )
//     )
//
// ),
//           ),

      //   ),
      // ),
    );
  }
}
