import 'package:flutter/material.dart';
import 'main.dart';
import 'notification.dart';
import 'view.dart';

void main() {
  runApp(const IncubatorApp());
}

class IncubatorApp extends StatelessWidget {
  const IncubatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incubator Monitoring',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F2E8),
        dataTableTheme: const DataTableThemeData(
          columnSpacing: 16,
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          dataTextStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      home: const DataScreen(),
    );
  }
}

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  Widget buildSideNavigationBar(BuildContext context) {
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
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            },
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
            selected: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        title: const Center(
          child: Text(
            'DATA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: buildSideNavigationBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Environment Monitoring',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2E0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(const Color(0xFFF0E8C8)),
                  columnSpacing: 16,
                  columns: const [
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Time Recorded',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Temperature (°C)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Humidity (%)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildEnvironmentRow('08:00 AM', '37.5', '52', 'Normal'),
                    _buildEnvironmentRow('10:00 AM', '37.6', '53', 'Normal'),
                    _buildEnvironmentRow('12:00 AM', '38.2', '49', 'High temp', isHighTemp: true),
                    _buildEnvironmentRow('02:00 AM', '37.4', '56', 'Normal'),
                    _buildEnvironmentRow('04:00 AM', '36.8', '70', 'Low temp', isLowTemp: true),
                    _buildEnvironmentRow('06:00 AM', '37.5', '54', 'Normal'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Chick Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2E0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(const Color(0xFFF0E8C8)),
                  columnSpacing: 16,
                  columns: const [
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Egg No.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Gender',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Confidence Score',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Timestamp',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    _buildChickRow('001', 'Male', '98%', '2025-03-17  10:05AM'),
                    _buildChickRow('002', 'Female', '93%', '2025-03-17  10:07AM'),
                    _buildChickRow('003', 'Male', '95%', '2025-03-17 10:10AM'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildEnvironmentRow(String time, String temp, String humidity, String status, {bool isHighTemp = false, bool isLowTemp = false}) {
    Color statusColor = Colors.black;
    if (isHighTemp) {
      statusColor = Colors.red;
    } else if (isLowTemp) {
      statusColor = Colors.blue;
    }

    return DataRow(
      cells: [
        DataCell(Text(time)),
        DataCell(Text(temp)),
        DataCell(Text(humidity)),
        DataCell(
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: isHighTemp || isLowTemp ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildChickRow(String id, String stage, String sex, String status, {bool needsCheck = false}) {
    return DataRow(
      cells: [
        DataCell(Text(id)),
        DataCell(Text(stage)),
        DataCell(Text(sex)),
        DataCell(
          Text(
            status,
            style: TextStyle(
              color: needsCheck ? Colors.orange : Colors.black,
              fontWeight: needsCheck ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
