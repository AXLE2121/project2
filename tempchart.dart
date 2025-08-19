import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureDetailScreen extends StatelessWidget {
  const TemperatureDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Moved to Scaffold for full coverage
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
                        'Temperature',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance the back button space
                ],
              ),
            ),
            
            // Temperature Display
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '24 °C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      Icons.thermostat,
                      color: Colors.white.withOpacity(0.9),
                      size: 45,
                    ),
                  ],
                ),
              ),
            ),
            
            // Temperature Graph
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red[700]?.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      // Y-axis labels
                      SizedBox(
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '90°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '60°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '30°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '0°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Chart
                      Expanded(
                        child: TemperatureLineChart(),
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

class TemperatureLineChart extends StatelessWidget {
  TemperatureLineChart({Key? key}) : super(key: key);

  final List<FlSpot> temperatureSpots = [
    const FlSpot(0, 30),
    const FlSpot(1, 40),
    const FlSpot(2, 80),
    const FlSpot(3, 60),
    const FlSpot(4, 70),
    const FlSpot(5, 65),
    const FlSpot(6, 38),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    days[value.toInt()],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1,
          ),
        ),
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 90,
        lineBarsData: [
          LineChartBarData(
            spots: temperatureSpots,
            isCurved: true,
            color: Colors.white,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),  // Removed const here
            belowBarData: BarAreaData(
              show: true,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(enabled: false),  // Removed const here
      ),
    );
  }
}
