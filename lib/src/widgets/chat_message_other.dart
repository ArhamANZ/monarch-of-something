import 'package:flutter/material.dart';

class ChatMessageOther extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;

  const ChatMessageOther({Key key, this.index, this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        CircleAvatar(
          backgroundImage: NetworkImage(data['photo_url']),
        ),
        SizedBox(width: 10),
        Container(
          constraints: BoxConstraints(
            maxWidth: 300,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Text('${data['author']} said:'),
              Text(data['value']),
            ],
          ),
        ),
      ],),
    );
  }
}
