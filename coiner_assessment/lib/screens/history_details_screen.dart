// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:async';
import 'package:coiner_assessment/widgets/custom_step_tracker.dart';
import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatefulWidget {
  static const String routeName = '/history-details-screen';
  final String searchedLocation;
  final String time;
  const HistoryDetailsScreen({super.key, required this.searchedLocation, required this.time});

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  List<String> steps = [];
  int currentStep = 2;

  void _updateProgress() {
    const oneSec =  Duration(seconds: 1);
    // ignore: unnecessary_new
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (currentStep == 2 || currentStep == 1 || currentStep == 0) {
          t.cancel(); // Cancel the timer
        } else {
          currentStep += 1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    steps = [ // Initialize the list here
      '${widget.searchedLocation}\n${widget.time}',
      '999 Chestnut Lane, Gadsden, AL 35901 \n24 Mar 2024, 08:22 AM',
    ];
    _updateProgress();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('History details'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  'You moved from this location ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: const DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/map.jpeg',
                            ),
                            fit: BoxFit.cover))),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomVerticalStepIndicator(
                    steps: steps, currentStep: currentStep),
              )
            ],
          ),
        ));
  }
}
