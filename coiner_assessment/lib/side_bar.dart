import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text('David'),
              accountEmail: Text('davidfnwudo@gmail.com')),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/profile-screen');
            },
            leading: const Icon(Icons.person_2_rounded),
            title: const Text('Profile'),
            trailing: const Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/support-screen');
            },
            leading: const Icon(Icons.support_agent),
            title: const Text('Support'),
            trailing: const Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            onTap: () {
                            Navigator.pushNamed(context, '/history-screen');

            },
            leading: const Icon(Icons.access_time),
            title: const Text('History'),
            trailing: const Icon(Icons.arrow_right_alt_rounded),
          )
        ],
      ),
    );
  }
}
