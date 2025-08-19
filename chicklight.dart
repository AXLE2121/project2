import 'package:flutter/material.dart';

class ChickLightDetailScreen extends StatefulWidget {
  const ChickLightDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChickLightDetailScreen> createState() => _ChickLightDetailScreenState();
}

class _ChickLightDetailScreenState extends State<ChickLightDetailScreen> {
  bool isLightOn = false; // Initially OFF to match the dashboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA726), // Orange
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with Back Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Chick Light Control',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Light Status Display
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isLightOn ? Icons.lightbulb : Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isLightOn ? 'ON' : 'OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isLightOn ? 'Timer: 08:30:00' : 'Timer: 00:00:00',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Toggle Switch
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange[800]?.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Light Control',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: isLightOn,
                          onChanged: (bool value) {
                            setState(() {
                              isLightOn = value;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveThumbColor: Colors.grey[300],
                          inactiveTrackColor: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
