import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final List<String> notificationMessages;

  const Notifications({Key? key, required this.notificationMessages})
      : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  void selectProfile(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return widget.notificationMessages.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.update_disabled_outlined,
                  size: 150,
                  color: Color.fromARGB(255, 58, 58, 58),
                ),
                Text(
                  'No Notifications Yet!',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 58, 58, 58),
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: widget.notificationMessages.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(widget.notificationMessages[index]),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.notificationMessages.removeAt(index);
                  });
                },
                child: ListTile(
                  title: Text(widget.notificationMessages[index]),
                  onTap: () {
                    // Handle notification tap
                    selectProfile(context);
                  },
                ),
              );
            },
          );
  }
}
