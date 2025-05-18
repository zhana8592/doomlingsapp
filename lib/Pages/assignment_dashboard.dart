import 'package:flutter/material.dart';
import 'stat_bar.dart';
import 'collection.dart';
import 'task.dart';

class AssignmentDashboard extends StatelessWidget {
  const AssignmentDashboard({super.key});

  final List<Map<String, String>> assignments = const [
    {"subject": "English", "date": "5/18/2025", "image": "assets/hiddenmonster.png"},
    {"subject": "Math", "date": "6/12/2025", "image": "assets/hidemonster.png"},
    {"subject": "Science", "date": "7/02/2025", "image": "assets/hidemonster.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED092),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Assignments',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'AlmendraSC',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 30,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final assignment in assignments)
                      GestureDetector(
                        onTap: () {
                          // TODO: Handle assignment click
                          debugPrint('Clicked on ${assignment['subject']}');
                        },
                        child: _buildAssignmentCard(assignment),
                      ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Handle add more
                        debugPrint('Clicked on Add More');
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Tasks()),
                );
                      },
                      child: _buildAddMoreCard(),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    // TODO: Handle profile picture click
                    debugPrint('Clicked on Profile Picture');
                  },
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('@amypeng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          StatBar(label: 'XP', value: 170, max: 300, color: Colors.yellow),
                          SizedBox(height: 6),
                          StatBar(label: 'HP', value: 520, max: 600, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(Map<String, String> assignment) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              assignment['image']!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${assignment['subject']} - ${assignment['date']}',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildAddMoreCard() {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Icon(Icons.add, size: 48, color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Add more'),
      ],
    );
  }
}