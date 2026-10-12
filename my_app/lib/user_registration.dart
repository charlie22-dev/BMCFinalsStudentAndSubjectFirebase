import 'package:flutter/material.dart';

import 'enrollment_page.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  void goNext() {
    if (nameController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnrollmentPage(
          name: nameController.text.trim(),
          section: sectionController.text.trim(),
          course: courseController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    sectionController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: sectionController,
              decoration: const InputDecoration(
                labelText: 'Section',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: 'Course',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: goNext,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
