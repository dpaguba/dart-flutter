import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Series
  late List<charts.Series<Pollution, String>> _seriesData;
  late List<charts.Series<Task, String>> _seriesPieData;
  late List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, "USA", 30),
      new Pollution(1980, "Asia", 40),
      new Pollution(1980, "Europe", 10),
    ];

    var data2 = [
      new Pollution(1985, "USA", 100),
      new Pollution(1980, "Asia", 150),
      new Pollution(1985, "Europe", 80),
    ];

    var data3 = [
      new Pollution(1985, "USA", 200),
      new Pollution(1980, "Asia", 300),
      new Pollution(1985, "Europe", 180),
    ];

    var pieData = [
      new Task("Work", 35.8, Color(0xff3366cc)),
      new Task("Eat", 8.3, Color(0xff990099)),
      new Task("Commute", 10.8, Color(0xff109618)),
      new Task("TV", 15.6, Color(0xfffdbe19)),
      new Task("Sleep", 19.2, Color(0xffff9900)),
      new Task("Other", 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata1 = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];

    var linesalesdata2 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata3 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskValue,
      colorFn: (Task task, _) =>
          charts.ColorUtil.fromDartColor(task.colorValue),
      id: "Daily Task",
      labelAccessorFn: (Task row, _) => '${row.taskValue}',
    ));

    _seriesData.add(charts.Series(
      data: data1,
      domainFn: (Pollution pollution, _) => pollution.place,
      measureFn: (Pollution pollution, _) => pollution.quantity,
      colorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xff990099)),
      id: "2017",
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
    ));

    _seriesData.add(charts.Series(
      data: data2,
      domainFn: (Pollution pollution, _) => pollution.place,
      measureFn: (Pollution pollution, _) => pollution.quantity,
      colorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: "2018",
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
    ));

    _seriesData.add(charts.Series(
      data: data3,
      domainFn: (Pollution pollution, _) => pollution.place,
      measureFn: (Pollution pollution, _) => pollution.quantity,
      colorFn: (Pollution pollution, _) =>
          charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      id: "2019",
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
    ));

    _seriesLineData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
      data: linesalesdata1,
      id: "Sales",
      domainFn: (Sales sales, _) => sales.yearValue,
      measureFn: (Sales sales, _) => sales.salesValue,
    ));

    _seriesLineData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
      data: linesalesdata2,
      id: "Sales",
      domainFn: (Sales sales, _) => sales.yearValue,
      measureFn: (Sales sales, _) => sales.salesValue,
    ));

    _seriesLineData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
      data: linesalesdata3,
      id: "Sales",
      domainFn: (Sales sales, _) => sales.yearValue,
      measureFn: (Sales sales, _) => sales.salesValue,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // generates all Data
    _seriesData = <charts.Series<Pollution, String>>[];
    _seriesPieData = <charts.Series<Task, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff1976d2),
              bottom: TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                  Tab(
                    icon: Icon(FontAwesomeIcons.chartPie),
                  ),
                  Tab(
                    icon: Icon(FontAwesomeIcons.chartLine),
                  ),
                ],
              ),
              title: Text("Flutter Charts"),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Text("SO2 emissions, by world region"),
                      Expanded(
                          child: charts.BarChart(
                        _seriesData,
                        animate: true,
                        barGroupingType: charts.BarGroupingType.grouped,
                        animationDuration: Duration(seconds: 5),
                      ))
                    ],
                  )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text("Time spent on daily tasks"),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            behaviors: [
                              new charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding:
                                      new EdgeInsets.only(right: 4, bottom: 4),
                                  entryTextStyle: charts.TextStyleSpec(
                                    color: charts
                                        .MaterialPalette.purple.shadeDefault,
                                    fontFamily: "Georgia",
                                    fontSize: 11,
                                  ))
                            ],
                            // change the rasius of the circule
                            // defaultRenderer: new charts.ArcRendererConfig(
                            //   arcWidth: 100,
                            //   arcRendererDecorators: [
                            //     new charts.ArcLabelDecorator(
                            //         // values have to be written inside sections
                            //         labelPosition:
                            //             charts.ArcLabelPosition.inside)
                            //   ],
                            // ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text("Sales for the first 5 years"),
                          Expanded(
                            child: charts.LineChart(
                              _seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true,
                                stacked: true,
                              ),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle("Years",
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle("Sales",
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle("Departments",
                                    behaviorPosition:
                                        charts.BehaviorPosition.end,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

// Data Container
class Task {
  // Graph values
  String task;
  double taskValue;
  Color colorValue;

  Task(this.task, this.taskValue, this.colorValue);
}

class Pollution {
  int year;
  String place;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Sales {
  int yearValue;
  int salesValue;

  Sales(this.yearValue, this.salesValue);
}
