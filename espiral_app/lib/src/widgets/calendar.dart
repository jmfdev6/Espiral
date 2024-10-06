import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Para onde você deseja ir?",
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              title: Text("Qualidade do ar no seu bairro"),
              subtitle: Row(
                children: [
                  Icon(Icons.shape_line_sharp),
                  SizedBox(width: 5),
                  Text("Centro, Campo Mourão (PR)")
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFEBEEF3),
              ),
              margin: EdgeInsets.symmetric(horizontal: 18),
              height: MediaQuery.of(context).size.height * 0.3, // Ajuste de altura
              child: SfCircularChart(
                annotations: [
                  CircularChartAnnotation(
                    verticalAlignment: ChartAlignment.far,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('30'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.emoji_emotions_outlined),
                            SizedBox(width: 5),
                            Text('Bom'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CircularChartAnnotation(
                    verticalAlignment: ChartAlignment.near,
                    widget: Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text('Boa notícia! A qualidade do ar'),
                          Text('deste bairro está boa'),
                        ],
                      ),
                    ),
                  ),
                ],
                series: <DoughnutSeries<_ChartData, String>>[
                  DoughnutSeries<_ChartData, String>(
                    dataSource: getChartData(),
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    startAngle: 270,
                    endAngle: 90,
                    innerRadius: "90%",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<_ChartData> getChartData() {
  final List<_ChartData> chartData = [
    _ChartData('Categoria1', 30),
    _ChartData('Categoria1', 0),
    _ChartData('Categoria1', 0),
    _ChartData('Categoria1', 0),
  ];
  return chartData;
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
