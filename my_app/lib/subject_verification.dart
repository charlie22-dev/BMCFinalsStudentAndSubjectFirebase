import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'user_registration.dart';

      class SubjectVerificationPage extends StatefulWidget {
        const SubjectVerificationPage({
          super.key,
          required this.student,
          required this.selectedSubjects,
        });

        final Map<String, String> student;
        final List<Map<String, dynamic>> selectedSubjects;

        @override
        State<SubjectVerificationPage> createState() => _SubjectVerificationPageState();
      }

      class _SubjectVerificationPageState extends State<SubjectVerificationPage> {
        bool isSaving = false;

        Future<void> saveToFirestore() async {
          setState(() {
            isSaving = true;
          });

          try {
            await FirebaseFirestore.instance.collection('enrollments').add({
              'fullName': widget.student['fullName'],
              'section': widget.student['section'],
              'course': widget.student['course'],
              'subjects': widget.selectedSubjects,
              'createdAt': FieldValue.serverTimestamp(),
            });

            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Enrollment saved!')),
            );

            // Go back to an empty registration page.
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const UserRegistrationPage()),
              (route) => false,
            );
          } catch (e) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to save: $e')),
            );
            setState(() {
              isSaving = false;
            });
          }
        }

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Subject Verification'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text('Name: ${widget.student['fullName']}'),
                  Text('Section: ${widget.student['section']}'),
                  Text('Course: ${widget.student['course']}'),
                  const Divider(),
                  const Text(
                    'Subjects',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (Map<String, dynamic> subject in widget.selectedSubjects)
                    Text('${subject['subject']} - ${subject['time']}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isSaving ? null : saveToFirestore,
                    child: Text(isSaving ? 'Saving...' : 'Submit to Firestore'),
                  ),
                ],
              ),
            ),
          );
        }
      }
