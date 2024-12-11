import 'package:get/get.dart';
import '../models/course_model.dart';

class CourseController extends GetxController {
  // Sample data
  var courses = <Course>[
    Course(name: "Math", averageProgress: 75, studentCount: 120, completionRate: 85, rating: 4.5),
    Course(name: "Science", averageProgress: 68, studentCount: 100, completionRate: 80, rating: 4.8),
    Course(name: "History", averageProgress: 55, studentCount: 90, completionRate: 60, rating: 4.2),
  ].obs;

  // Derived values
  String get topStudent => "John Doe"; // Mocked
  Course get highestRatedCourse =>
      courses.reduce((curr, next) => curr.rating > next.rating ? curr : next);
}
 