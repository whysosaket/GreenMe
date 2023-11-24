import 'package:pro_demo/screens/buying_history_screen.dart';
import 'package:pro_demo/widgets/items_count.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 7,
      width: width,
      child: ListTile(
        subtitle: Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: height / 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BuyingHistoryScreen()));
                  },
                  child: const Text(
                    "View History",
                    style: TextStyle(fontSize: 11),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
