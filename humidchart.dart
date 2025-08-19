import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HumidityDetailScreen extends StatelessWidget {
  const HumidityDetailScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2196F3), // Blue color for humidity
        child: SafeArea(
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
                          'Humidity',
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
              
              // Humidity Display
              Expanded(
                flex: 2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '56 %',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.water_drop,
                        color: Colors.white.withOpacity(0.9),
                        size: 45,
                      ),
                    ],
                  ),
                ),
              ),
              
              // Humidity Graph
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[700]?.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Y-axis labels (just example layout)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('90 %', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text('60 %', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text('30 %', style: TextStyle(color: Colors.white, fontSize: 12)),
                            Text('0 %', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Chart or Placeholder
                        Expanded(
                          child: HumidityLineChart(), // This must exist
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HumidityLineChart extends StatelessWidget {
  HumidityLineChart({Key? key}) : super(key: key);

  // Data points to match the humidity graph in the image
  final List<FlSpot> humiditySpots = [
    const FlSpot(0, 55),
    const FlSpot(1, 70),
    const FlSpot(2, 60),
    const FlSpot(3, 50),
    const FlSpot(4, 65),
    const FlSpot(5, 75),
    const FlSpot(6, 60),
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
            spots: humiditySpots,
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
