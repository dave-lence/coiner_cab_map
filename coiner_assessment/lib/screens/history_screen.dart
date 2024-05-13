// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:coiner_assessment/widgets/location_history_list.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = '/history-screen';
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('History'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'May 2024',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const Expanded(child: HisoryList()),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              searchController.text = value;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            
                            
                            hintText: 'Search history',
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
                        child:searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
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
          ),
        ));
  }
}
