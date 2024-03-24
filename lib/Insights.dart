import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    home: InsightsPage(),
  ));
}

class InsightsPage extends StatefulWidget {
  @override
  _InsightsPageState createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  String selectedCategory = 'Online Scam Trends';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTabButton('Online Scam Trends', 0),
                _buildTabButton('Victim Demographic Analyis', 1),
                _buildTabButton('Time Trend Analysis', 2),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildPieChart('Online Scam Trends', _getOnlineScamData()),
          _buildDemographicAnalysisChart(
              'Victim Demographic Analysis', _getDemographicData()),
          _buildLineChart('Time Trend Analysis', _getTimeTrendData()),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = title;
            _pageController.jumpToPage(index);
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (selectedCategory == title) {
                return Colors.white;
              } else {
                return Colors.black;
              }
            },
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedCategory == title ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPieChart(String title, List<Map<String, dynamic>> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                PieSeries<Map<String, dynamic>, String>(
                  dataSource: data,
                  xValueMapper: (datum, _) => datum['label'],
                  yValueMapper: (datum, _) => datum['value'],
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(String title, List<Map<String, dynamic>> data) {
    List<Color> colors = [
      const Color(0xFFE27C7C),
      const Color(0xFFa86464),
      const Color(0xFF6d4b4b),
      const Color(0xFF503f3f),
      const Color(0xFF333333),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SfCartesianChart(
              series: <ChartSeries>[
                ColumnSeries<Map<String, dynamic>, String>(
                  dataSource: data,
                  xValueMapper: (datum, _) => datum['label'],
                  yValueMapper: (datum, _) => datum['value'],
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  pointColorMapper: (datum, index) =>
                      colors[index % colors.length],
                ),
              ],
              primaryXAxis: CategoryAxis(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart(String title, List<Map<String, dynamic>> data) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  LineSeries<Map<String, dynamic>, String>(
                    dataSource: data,
                    xValueMapper: (datum, _) => datum['label'],
                    yValueMapper: (datum, _) => datum['value'],
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    color: Colors.red,
                    name: 'Online Scam',
                  ),
                  LineSeries<Map<String, dynamic>, String>(
                    dataSource: _getPhysicalScamData(),
                    xValueMapper: (datum, _) => datum['label'],
                    yValueMapper: (datum, _) => datum['value'],
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    color: Colors.black,
                    name: 'Physical Scam',
                  ),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemographicAnalysisChart(
      String title, List<Map<String, dynamic>> data) {
    List<Color> colors = [
      Colors.red.shade200,
      Colors.orange.shade200,
      Colors.yellow.shade200,
      Colors.green.shade200,
      Colors.teal.shade200,
      Colors.indigo.shade200,
      Colors.purple.shade200,
      Colors.pink.shade200,
      Colors.cyan.shade200,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: SfCartesianChart(
                series: <ChartSeries>[
                  BarSeries<Map<String, dynamic>, String>(
                    dataSource: data,
                    xValueMapper: (datum, _) => datum['demographic'],
                    yValueMapper: (datum, _) => datum['value'],
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    pointColorMapper: (datum, index) =>
                        colors[index % colors.length],
                  ),
                ],
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(isVisible: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getOnlineScamData() {
    return [
      {'label': 'Phone', 'value': 10},
      {'label': 'Malware', 'value': 8},
      {'label': 'Job', 'value': 6},
      {'label': 'Phishing', 'value': 12},
      {'label': 'Mule Account', 'value': 5},
      {'label': 'E-Commerce', 'value': 7},
      {'label': 'Investment', 'value': 9},
      {'label': 'Cash Reward', 'value': 4},
      {'label': 'Loan', 'value': 3},
      {'label': 'Love Schemes', 'value': 6},
    ];
  }

  List<Map<String, dynamic>> _getScamTypesData() {
    return [
      {'label': 'Phishing', 'value': 30},
      {'label': 'ATM Skimming', 'value': 25},
      {'label': 'Hacking', 'value': 20},
      {'label': 'Pickpocketing', 'value': 15},
    ];
  }

  List<Map<String, dynamic>> _getPhysicalScamData() {
    return [
      {'label': 'Oct', 'value': 45},
      {'label': 'Nov', 'value': 66},
      {'label': 'Dec', 'value': 88},
      {'label': 'Jan', 'value': 100},
      {'label': 'Feb', 'value': 40},
      {'label': 'Mar', 'value': 55},
    ];
  }

  List<Map<String, dynamic>> _getDemographicData() {
    return [
      {'demographic': 'Age', 'value': 30},
      {'demographic': 'Gender', 'value': 20},
      {'demographic': 'Income\nLevel', 'value': 15},
      {'demographic': 'Occupation', 'value': 25},
      {'demographic': 'Geographic\nLocation', 'value': 18},
      {'demographic': 'Education\nLevel', 'value': 22},
      {'demographic': 'Social\nMedia\nPresence', 'value': 28},
      {'demographic': 'Family\nStatus', 'value': 32},
      {'demographic': 'Other', 'value': 10},
    ];
  }

  List<Map<String, dynamic>> _getTimeTrendData() {
    return [
      {'label': 'Oct', 'value': 55},
      {'label': 'Nov', 'value': 89},
      {'label': 'Dec', 'value': 77},
      {'label': 'Jan', 'value': 120},
      {'label': 'Feb', 'value': 60},
      {'label': 'Mar', 'value': 85},
    ];
  }
}
