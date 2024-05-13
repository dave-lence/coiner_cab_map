import 'package:coiner_assessment/location.dart';
import 'package:coiner_assessment/screens/history_details_screen.dart';
import 'package:flutter/material.dart';

class HisoryList extends StatelessWidget {
  const HisoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: location.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HistoryDetailsScreen(searchedLocation:location[index]['location'].toString(), time: location[index]['time'].toString(), ),));
              },
              leading: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Icon(Icons.location_history))),
              title: Text(
                location[index]['location'].toString(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                location[index]['time'].toString(),
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ),
            Divider(color: Colors.grey[300])
          ],
        );
      },
    );
  }
}
