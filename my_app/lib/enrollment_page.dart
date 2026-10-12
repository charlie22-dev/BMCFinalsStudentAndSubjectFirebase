import 'package:flutter/material.dart';
import 'subject_verification.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({
    super.key,
    required this.name,
    required this.section,
    required this.course,
  });

  final String name;
  final String section;
  final String course;

  @override
  State<EnrollmentPage> createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  final TextEditingController subject1Controller = TextEditingController();
  final TextEditingController time1Controller = TextEditingController();
  final TextEditingController subject2Controller = TextEditingController();
  final TextEditingController time2Controller = TextEditingController();
  final TextEditingController subject3Controller = TextEditingController();
  final TextEditingController time3Controller = TextEditingController();

  void goNext() {
    if (subject1Controller.text.trim().isEmpty ||
        time1Controller.text.trim().isEmpty ||
        subject2Controller.text.trim().isEmpty ||
        time2Controller.text.trim().isEmpty ||
        subject3Controller.text.trim().isEmpty ||
        time3Controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all subjects and times')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubjectVerificationPage(
          student: {
            'fullName': widget.name,
            'section': widget.section,
            'course': widget.course,
          },
          selectedSubjects: [
            {'subject': subject1Controller.text.trim(), 'time': time1Controller.text.trim()},
            {'subject': subject2Controller.text.trim(), 'time': time2Controller.text.trim()},
            {'subject': subject3Controller.text.trim(), 'time': time3Controller.text.trim()},
          ],
        ),
      ),
    );
  }

      @override
      void dispose() {
        subject1Controller.dispose();
        time1Controller.dispose();
        subject2Controller.dispose();
        time2Controller.dispose();
        subject3Controller.dispose();
        time3Controller.dispose();
        super.dispose();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Subject Enrollment'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextField(
                  controller: subject1Controller,
                  decoration: const InputDecoration(
                    labelText: 'Subject 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: time1Controller,
                  decoration: const InputDecoration(
                    labelText: 'Time 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: subject2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Subject 2',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: time2Controller,
                  decoration: const InputDecoration(
                    labelText: 'Time 2',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: subject3Controller,
                  decoration: const InputDecoration(
                    labelText: 'Subject 3',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: time3Controller,
                  decoration: const InputDecoration(
                    labelText: 'Time 3',
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
