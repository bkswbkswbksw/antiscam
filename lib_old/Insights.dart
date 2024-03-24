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

class _InsightsPageState extends State<InsightsPage> with TickerProviderStateMixin {
  late PageController _pageController;
  String selectedCategory = 'Online Scam Trends';
  int _currentIndex = 0; // Add this variable to keep track of the current index

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the page controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
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
          _buildDemographicAnalysisChart('Victim Demographic Analysis', _getDemographicData()),
          // _buildBarChart('Scam Types Distribution', _getScamTypesData()),
          _buildLineChart('Time Trend Analysis', _getTimeTrendData()),

        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = title;
            _pageController.jumpToPage(index); // Update the page controller
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (selectedCategory == title) {
                return Colors.white; // Color when selected
              } else {
                return Colors.black; // Default color
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
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
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
                dataLabelSettings: DataLabelSettings(
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
    // Define a list of colors for the bars
    List<Color> colors = [
      Color(0xFFE27C7C),
      Color(0xFFa86464),
      Color(0xFF6d4b4b),
      Color(0xFF503f3f),
      Color(0xFF333333),
    ];

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
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
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  pointColorMapper: (datum, index) => colors[index % colors.length], // Assign colors from the list
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
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50), // Add padding as needed
            child: SfCartesianChart(
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                LineSeries<Map<String, dynamic>, String>(
                  dataSource: data,
                  xValueMapper: (datum, _) => datum['label'],
                  yValueMapper: (datum, _) => datum['value'],
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  color: Colors.red,
                  name: 'Online Scam', 
                ),
                LineSeries<Map<String, dynamic>, String>(
                  dataSource: _getPhysicalScamData(), // Assuming you have a method to get physical scam data
                  xValueMapper: (datum, _) => datum['label'],
                  yValueMapper: (datum, _) => datum['value'],
                  dataLabelSettings: DataLabelSettings(isVisible: true),
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

Widget _buildDemographicAnalysisChart(String title, List<Map<String, dynamic>> data) {
  // Define a list of colors for each bar
  List<Color> colors = [
    // Colors.lightBlue,
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
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
          child: SfCartesianChart(
            series: <ChartSeries>[
              BarSeries<Map<String, dynamic>, String>(
                dataSource: data,
                xValueMapper: (datum, _) => datum['demographic'],
                yValueMapper: (datum, _) => datum['value'],
                dataLabelSettings: DataLabelSettings(isVisible: true),
                pointColorMapper: (datum, index) => colors[index % colors.length], // Assign colors from the list
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



  // List<Map<String, dynamic>> _getOnlineScamData() {
  //   return [
  //     {'label': 'Phishing', 'value': 30},
  //     {'label': 'Hacking', 'value': 20},
  //     {'label': 'Identity Theft', 'value': 15},
  //   ];
  // }
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
