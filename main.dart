import 'package:flutter/material.dart';
import 'tempchart.dart';
import 'humidchart.dart';
import 'data.dart';
import 'view.dart';
import 'notification.dart';
import 'light.dart';
import 'chicklight.dart';
import 'ventilation.dart';
import 'eggswaying.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildSideNavigationBar(context),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        title: const Text(
          'DASHBOARD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Column(
          children: [
            // Temperature Card (Red)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TemperatureDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Temperature',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '24 °C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.thermostat,
                        color: Colors.white.withOpacity(0.9),
                        size: 35,
                      ),
                    ],
                  ),
                  color: Colors.red,
                  icon: null,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Humidity Card (Blue)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HumidityDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Humidity',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '56 %',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.water_drop,
                        color: Colors.white.withOpacity(0.9),
                        size: 35,
                      ),
                    ],
                  ),
                  color: const Color(0xFF2196F3),
                  icon: null,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Light Card (Orange)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LightDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Incubator Light',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status: ON',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Timer: 12:00:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white.withOpacity(0.9),
                        size: 35,
                      ),
                    ],
                  ),
                  color: const Color(0xFFFFA726), // Orange
                  icon: null,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Chick Light Card (Orange)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChickLightDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Chick Light',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status: OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Timer: 00:00:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white.withOpacity(0.9),
                        size: 35,
                      ),
                    ],
                  ),
                  color: const Color(0xFFFFA726), // Orange
                  icon: null,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Ventilation Card (Green)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VentilationDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Ventilation',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status: Closed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.air,
                          color: Colors.white.withOpacity(0.9),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  color: const Color(0xFF66BB6A), // Green
                  icon: null,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Egg Swaying Card (Black)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EggSwayingDetailScreen()),
                  );
                },
                child: buildStatusCard(
                  title: 'Egg Swaying',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '15°',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Transform.rotate(
                        angle: 0.26, // 15 degrees in radians (15 * π / 180)
                        child: Icon(
                          Icons.architecture,
                          color: Colors.white.withOpacity(0.9),
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  color: Colors.black,
                  icon: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSideNavigationBar(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Smart Egg Incubator',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            selected: true,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('View'),
           onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ViewScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.data_usage),
            title: const Text('Data'),
             onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DataScreen()),
    );
  },
),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildStatusCard({
    required String title,
    required Widget content,
    required Color color,
    Widget? icon,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Center(
                child: content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
