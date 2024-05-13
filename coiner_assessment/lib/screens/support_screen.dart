// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:coiner_assessment/widgets/chat_list.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  static const String routeName = '/support-screen';
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Support'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              const Expanded(child: ChatList()),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: messageController,
                        onChanged: (value) {
                          setState(() {
                            messageController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.emoji_emotions),
                            color: Colors.grey,
                          ),
                          suffixIcon: Container(
                            width: 70,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_file,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          hintText: 'Type a message!',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    margin: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: messageController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.black,
                              ))
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.black,
                              )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
