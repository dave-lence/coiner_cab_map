import 'package:coiner_assessment/widgets/custom_button.dart';
import 'package:coiner_assessment/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Enter your information',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: size.width * 0.90,
              child: CustomTextField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  prefixIcon: const Icon(Icons.person_2),
                  onChanged: (value) => {
                        setState(() {
                          firstNameController.text = value;
                        })
                      }),
            ),
            SizedBox(
              width: size.width * 0.90,
              child: CustomTextField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  prefixIcon: const Icon(Icons.person_2),
                  onChanged: (value) => {
                        setState(() {
                          lastNameController.text = value;
                        })
                      }),
            ),
            SizedBox(
              width: size.width * 0.90,
              child: CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                  prefixIcon: const Icon(Icons.email),
                  onChanged: (value) => {
                        setState(() {
                          emailController.text = value;
                        })
                      }),
            ),
            SizedBox(
              height: size.height * 0.45,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(onPress: () {}, title: 'Save'),
            )
          ],
        ),
      ),
    );
  }
}
