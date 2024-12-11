import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("Average Progress: ${course.averageProgress}%"),
            Text("Students Enrolled: ${course.studentCount}"),
            Text("Completion Rate: ${course.completionRate}%"),
            Text("Rating: ${course.rating}"),
          ],
        ),
      ),
    );
  }
}
