import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shop_sphere_dashboard/features/presention/view/widget/custom_data_table.dart';

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String _selectedTimeRange = 'Weekly';
  String _selectedMetric = 'Revenue';
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics Dashboard'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _refreshData),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time range selector
            _buildTimeRangeSelector(),
            SizedBox(height: 20),
            
            // Metric selector
            _buildMetricSelector(),
            SizedBox(height: 20),
            
            // Summary cards
            _buildSummaryCards(),
            SizedBox(height: 20),
            
            // Main chart
            Container(
              height: 300,
              child: _buildMainChart(),
            ),
            SizedBox(height: 20),
            
            // Secondary charts row
            _buildSecondaryCharts(),
            SizedBox(height: 20),
            
            // Data table
            CustomDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRangeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeRangeButton('Daily'),
        _buildTimeRangeButton('Weekly'),
        _buildTimeRangeButton('Monthly'),
        _buildTimeRangeButton('Yearly'),
      ],
    );
  }

  Widget _buildTimeRangeButton(String range) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedTimeRange == range ? Colors.white : Colors.black, backgroundColor: _selectedTimeRange == range ? Theme.of(context).primaryColor : Colors.grey[300],
      ),
      onPressed: () {
        setState(() {
          _selectedTimeRange = range;
        });
      },
      child: Text(range),
    );
  }

  Widget _buildMetricSelector() {
    return DropdownButton<String>(
      value: _selectedMetric,
      items: ['Revenue', 'Users', 'Sessions', 'Conversion'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedMetric = newValue!;
        });
      },
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        _buildSummaryCard('Total', '\$12,345', '+12%'),
        _buildSummaryCard('Avg/Day', '\$456', '+3%'),
        _buildSummaryCard('Peak', '\$1,234', 'Yesterday'),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, String subtitle) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainChart() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
              
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String weekDay;
                  switch (group.x.toInt()) {
                    case 0:
                      weekDay = 'Monday';
                      break;
                    case 1:
                      weekDay = 'Tuesday';
                      break;
                    case 2:
                      weekDay = 'Wednesday';
                      break;
                    case 3:
                      weekDay = 'Thursday';
                      break;
                    case 4:
                      weekDay = 'Friday';
                      break;
                    case 5:
                      weekDay = 'Saturday';
                      break;
                    case 6:
                      weekDay = 'Sunday';
                      break;
                    default:
                      weekDay = '';
                  }
                  return BarTooltipItem(
                    '$weekDay\n${rod.fromY.toInt()}',
                    TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    );
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'M';
                        break;
                      case 1:
                        text = 'T';
                        break;
                      case 2:
                        text = 'W';
                        break;
                      case 3:
                        text = 'T';
                        break;
                      case 4:
                        text = 'F';
                        break;
                      case 5:
                        text = 'S';
                        break;
                      case 6:
                        text = 'S';
                        break;
                      default:
                        text = '';
                    }
                    return SideTitleWidget(
                     meta: meta,
                      space: 4,
                      child: Text(text, style: style),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    );
                    return SideTitleWidget(
                      space: 4,
                      meta: meta,
                      child: Text(value.toInt().toString(), style: style),
                    );
                  },
                  reservedSize: 28,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: 20,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: 50,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: 80,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 65,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: 90,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: 40,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    toY: 30,
                    color: Colors.blue,
                    width: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryCharts() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            _touchedIndex = -1;
                            return;
                          }
                          _touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 200,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: true),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: const Color(0xff37434d), width: 1),
                 
              
            ),
          ),
        ),
      ),
    )
    )
    )
    ],

    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      final fontSize = isTouched ? 18.0 : 14.0;
      final radius = isTouched ? 50.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 60,
            title: '60%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }



  void _refreshData() {
    // Implement data refresh logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Refreshing data...')),
    );
  }
}