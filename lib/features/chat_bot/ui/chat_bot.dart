import 'package:flutter/material.dart';
import 'package:health_tracking_app/core/constants/color_constant.dart';
import 'package:health_tracking_app/core/constants/text_styles.dart';

class ChatBot extends StatelessWidget {
  ChatBot({super.key});
  List<Message> tempList = messages.reversed.toList();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: null,
      body: Column(children: [
        Expanded(
            child: Container(
          child: ListView.builder(
              reverse: true,
              itemCount: tempList.length,
              itemBuilder: (context, index) {
                Message currentMessage = tempList[index];

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: currentMessage.sender == "You"
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.01),
                          decoration: BoxDecoration(
                              border: currentMessage.sender == "You"
                                  ? null
                                  : Border.all(
                                      width: 1,
                                      color: AppColors.lightGrey,
                                    ),
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.03),
                              color: currentMessage.sender == "You"
                                  ? AppColors.darkBlue
                                  : AppColors.white),
                          child: Text(currentMessage.text),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.02,
            vertical: size.height * 0.01,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.01),
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(
              size.width * 0.1,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: AppColors.darkBlue,
                  style: AppTextStyles.text18(bold: false, size: size),
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    border: InputBorder.none,
                    hintText: "Ask Anything",
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: AppColors.darkBlue,
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}

class Message {
  String sender;
  String text;
  DateTime time;

  Message({required this.sender, required this.text, required this.time});
}

List<Message> messages = [
  Message(
      sender: 'You',
      text: 'Hey, how are you doing today?',
      time: DateTime.now().subtract(const Duration(minutes: 5))),
  Message(
      sender: 'Friend',
      text:
          'I\'m doing pretty well, thanks for asking! I just finished a long hike in the mountains and the views were absolutely breathtaking. It was so nice to get away from the city and be surrounded by nature for a change. How about you, what have you been up to lately?',
      time: DateTime.now().subtract(const Duration(minutes: 4))),
  Message(
      sender: 'You',
      text: 'Wow, that sounds amazing! ',
      time: DateTime.now().subtract(const Duration(minutes: 3))),
  Message(
      sender: 'Friend',
      text:
          'Oh cool, which beach are you going to? I went to the beach last month and it was so relaxing. There\'s something about the sound of the waves and the smell of the ocean that just puts me in a good mood. I hope you have a great time!',
      time: DateTime.now().subtract(const Duration(minutes: 2))),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend',
      text:
          'By the way, have you heard about that new restaurant that just opened up downtown? I heard they have amazing seafood, we should check it out sometime!',
      time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  Message(
      sender: 'You',
      text: 'Thanks, I\'m really looking forward to it!',
      time: DateTime.now().subtract(const Duration(minutes: 1))),
  Message(
      sender: 'Friend', text: 'By the way, have you h', time: DateTime.now()),
  // add more messages here
];
