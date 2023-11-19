import 'package:flutter/material.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserCardStats extends StatelessWidget {
  const UserCardStats();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    User? user = Provider.of<UserProvider>(context, listen: true).user;
    return SizedBox(
      height: height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 6,
                  height: width / 6,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          user?.score.toString() ?? '0',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Overall Points",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 20, 85, 53),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 8,
                  height: width / 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 243, 255, 232),
                      ),
                      child: const Center(
                        child: Text(
                          "20",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 85, 53),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Eco Points",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 20, 85, 53),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 8,
                  height: width / 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 243, 255, 232),
                      ),
                      child: const Center(
                        child: Text(
                          "20",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 85, 53),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Pal Points",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 20, 85, 53),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
