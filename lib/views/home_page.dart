import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_game/views/course_details.dart';
import '../controllers/course_controller.dart';

class HomePage extends StatelessWidget {
  final CourseController courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Online Learning Dashboard')),
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Register New Student'),
                  onTap: () {
                    // Add register student logic
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Add Courses'),
                  onTap: () {
                    // Add courses logic
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Login'),
                  onTap: () {
                    // Login logic
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    // Logout logic
                  },
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      "Courses Overview",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),

                    // Tiles in rows
                    Obx(() {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two tiles in a row
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3 / 2, // Adjust aspect ratio
                        ),
                        itemCount: courseController.courses.length,
                        itemBuilder: (context, index) {
                          var course = courseController.courses[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => CourseDetails(course: course));
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("Progress: ${course.averageProgress}%"),
                                    Text("Students: ${course.studentCount}"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),

                    SizedBox(height: 24),

                    // Pie Chart Section
                    Text(
                      "Category Distribution",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),

                    Center(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          height: 350,
                          width: 350,
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(() {
                            final courseDetails = courseController.courses;
                            return PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                    // Add interactivity if needed
                                  },
                                ),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 2,
                                centerSpaceRadius: 50,
                                sections: List.generate(courseDetails.length, (i) {
                                  final course = courseDetails[i];
                                  final isTouched = false; // Customize for touch behavior
                                  final fontSize = isTouched ? 18.0 : 14.0;
                                  final radius = isTouched ? 80.0 : 70.0;

                                  return PieChartSectionData(
                                    color: Colors.primaries[i % Colors.primaries.length],
                                    value: course.averageProgress.toDouble(),
                                    title: '${course.averageProgress}%',
                                    radius: radius,
                                    titleStyle: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
