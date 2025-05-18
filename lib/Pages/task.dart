import 'package:flutter/material.dart';
import 'assignment_dashboard.dart'; // For navigating back
import 'battle.dart'; // Replace with your actual battle screen file

class ReadyForBattleScreen extends StatefulWidget {
  const ReadyForBattleScreen({super.key});

  @override
  State<ReadyForBattleScreen> createState() => _ReadyForBattleScreenState();
}

class _ReadyForBattleScreenState extends State<ReadyForBattleScreen> {
  int _importance = 1;
  DateTime? _selectedDate;
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String get monsterImage {
    switch (_importance) {
      case 1:
        return 'assets/smallmonster.png';
      case 2:
        return 'assets/hidemonster.png';
      case 3:
        return 'assets/hiddenmonster.png';
      default:
        return 'assets/smallmonster.png';
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED092),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Ready for battle?",
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'AlmendraSC',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  color: Colors.grey[300],
                  child: Image.asset(monsterImage, fit: BoxFit.contain),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Subject:'),
                      TextField(controller: _subjectController),
                      const SizedBox(height: 10),
                      const Text('Importance:'),
                      Row(
                        children: List.generate(3, (index) {
                          final isSelected = _importance > index;
                          return IconButton(
                            icon: Icon(
                              Icons.star,
                              color: isSelected ? Colors.pinkAccent : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _importance = index + 1;
                              });
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      const Text('Deadline:'),
                      ElevatedButton(
                        onPressed: _pickDate,
                        child: Text(
                          _selectedDate == null
                              ? 'Choose Date'
                              : '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Total Time:'),
                      TextField(controller: _timeController),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Extra Notes:'),
            ),
            TextField(
              controller: _notesController,
              maxLines: 2,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AssignmentDashboard()),
                    );
                  },
                  child: const Text('Yield'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BattleScreen()),
                    );
                  },
                  child: const Text('Start Battle'),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}