  import 'package:flutter/material.dart';
class EggSwayingDetailScreen extends StatefulWidget {
  const EggSwayingDetailScreen({Key? key}) : super(key: key);

  @override
  State<EggSwayingDetailScreen> createState() => _EggSwayingDetailScreenState();
}

class _EggSwayingDetailScreenState extends State<EggSwayingDetailScreen> {
  bool isSwayingOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                        'Egg Swaying',
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
            
            // Angle Display
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: 0.26, // 15 degrees in radians
                      child: const Icon(
                        Icons.architecture,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      '15°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isSwayingOn ? 'Swaying Active' : 'Swaying Inactive',
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
                    color: Colors.grey[800]?.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Swaying Control',
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
                          value: isSwayingOn,
                          onChanged: (bool value) {
                            setState(() {
                              isSwayingOn = value;
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
