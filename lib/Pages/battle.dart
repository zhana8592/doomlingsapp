import 'package:flutter/material.dart';
import 'dart:async';
import 'reveal.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  double hp = 1.0; // 100%
  double timer = 1.0; // 100%
  bool showRevealButton = false;

  @override
  void initState() {
    super.initState();
    startBattle();
  }

  void startBattle() {
    const duration = Duration(milliseconds: 100);
    const totalTime = 10; // 10 seconds total
    int ticks = 0;
    final totalTicks = totalTime * 1000 ~/ duration.inMilliseconds;

    Timer.periodic(duration, (timer) {
      setState(() {
        ticks++;
        hp = 1 - ticks / totalTicks;
        this.timer = 1 - ticks / totalTicks;

        if (ticks >= totalTicks) {
          timer.cancel();
          showRevealButton = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED092),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Battling...',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'AlmendraSC',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/hiddenmonster.png'),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.star, color: Colors.pink, size: 30),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('HP', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: hp,
                        color: Colors.yellow[200],
                        backgroundColor: Colors.grey[300],
                        minHeight: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Timer', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    const Icon(Icons.access_time, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: timer,
                        color: Colors.yellow[200],
                        backgroundColor: Colors.grey[300],
                        minHeight: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (showRevealButton)
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RevealPage()),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text('Reveal'),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
