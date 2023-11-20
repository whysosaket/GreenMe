import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<SmsMessage> messages;
  static const List<String> filterKeywords = [
    'amazon',
    'order',
    'flipkart',
    'ajio',
    'placed'
  ];

  static const List<String> excludeWords = [
    'upi',
    'paytm',
    'offer',
    'flat',
    'off',
    'otp',
    'sale',
    'refund',
    'delivered',
    'delivery',
    'complete',
    'loan',
    'reset',
    'password',
    '.com'
  ];

  @override
  Widget build(BuildContext context) {
    List<SmsMessage> filteredMessages = messages.where((message) {
      String lowercaseBody = message.body!.toLowerCase();

      // Additional condition to exclude messages containing excludeWords
      bool shouldExclude = excludeWords.any(lowercaseBody.contains);

      return filterKeywords
          .any((keyword) => lowercaseBody.contains(keyword) && !shouldExclude);
    }).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredMessages.length,
      itemBuilder: (BuildContext context, int i) {
        var message = filteredMessages[i];

        return ListTile(
          title: Text('${message.sender} [${message.date}]'),
          subtitle: Text('${message.body}'),
        );
      },
    );
  }
}
