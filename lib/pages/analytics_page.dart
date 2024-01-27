import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/analytics/modes_button.dart';
import 'package:citefest/widgets/universal/sub_section_info.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<ExpenseData> _chartData;
  late List<WeeklyExpensesData> columnData;

  @override
  void initState() {
    _chartData = getChartData();
    columnData = getColumnData();
    super.initState();
  }

  int markerToExpand = 0;
  int totalMonthSpent = 0;

  String currentSection = "expenses";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          HeaderBar(
            subText: "hey, look at",
            headText: "You Analytics",
            onPressProfile: () {},
            onPressNotif: () {},
          ),
          const SizedBox(height: 20),
          Container(
            width: 250,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Indexer(
              alignment: Alignment.center,
              children: [
                Indexed(
                  index: currentSection == "expenses" ? 1 : 0,
                  child: AnalyticsButton(
                    section: "expenses",
                    currentSection: currentSection,
                    onPressed: () => setState(() {
                      currentSection = "expenses";
                    }),
                    text: "Expenses",
                    leftPos: 0,
                    rightPos: 110,
                  ),
                ),
                Indexed(
                  index: currentSection == "income" ? 1 : 0,
                  child: AnalyticsButton(
                    section: "income",
                    currentSection: currentSection,
                    onPressed: () => setState(() {
                      currentSection = "income";
                    }),
                    text: "Income",
                    leftPos: 110,
                    rightPos: 0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "this month you've spent",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2.5),
              Text(
                "P $totalMonthSpent",
                style: const TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SfCartesianChart(
            onMarkerRender: (markerArgs) {
              if (markerArgs.pointIndex == markerToExpand) {
                markerArgs.markerHeight = 20.0;
                markerArgs.markerWidth = 20.0;
                markerArgs.color = ColorPalette.primary;
                markerArgs.shape = DataMarkerType.circle;
              }
            },
            onTrackballPositionChanging: (trackballArgs) {
              print(trackballArgs.chartPointInfo.header);
              print(trackballArgs.chartPointInfo.label);
              setState(() {
                totalMonthSpent =
                    int.parse(trackballArgs.chartPointInfo.label ?? "0");
                markerToExpand = trackballArgs.chartPointInfo.dataPointIndex!;
              });
            },
            trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              lineWidth: 0,
              tooltipDisplayMode: TrackballDisplayMode.none,
            ),
            series: <ChartSeries>[
              SplineSeries<ExpenseData, String>(
                color: ColorPalette.secondary,
                dataSource: _chartData,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  width: 12.5,
                  height: 12.5,
                  borderWidth: 3,
                  borderColor: ColorPalette.primary,
                ),
                xValueMapper: (ExpenseData exp, _) => exp.month,
                yValueMapper: (ExpenseData exp, _) =>
                    exp.totalExpensesInMonth.toInt(),
              )
            ],
            plotAreaBorderWidth: 0,
            primaryYAxis: NumericAxis(
              interval: 5,
              edgeLabelPlacement: EdgeLabelPlacement.hide,
              isVisible: false,
              majorGridLines: const MajorGridLines(width: 0),
              rangePadding: ChartRangePadding.auto,
            ),
            primaryXAxis: CategoryAxis(
              axisLine: const AxisLine(
                width: 0,
                color: Colors.grey,
              ),
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0),
              rangePadding: ChartRangePadding.auto,
            ),
            zoomPanBehavior: ZoomPanBehavior(
              enablePanning: true,
            ),
          ),
          const SizedBox(height: 20),
          const SubSectionInfo(
            iconPath: "assets/images/icons/pie-chart.png",
            leftHeadText: "Insight",
            leftSubText: "Month of May Expenses",
            rightHeadText: "P 1447",
            rightSubText: "Month of May Expenses",
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Daily Statistics Overview",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 2.5),
                  Text(
                    "April 1, 2024 - April 7, 2024",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Text(
                "view all",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SfCartesianChart(
            trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              lineWidth: 0,
              tooltipDisplayMode: TrackballDisplayMode.none,
            ),
            series: <ChartSeries>[
              ColumnSeries<WeeklyExpensesData, String>(
                color: ColorPalette.skyBlue,
                dataSource: columnData,
                xValueMapper: (WeeklyExpensesData exp, _) => exp.day,
                yValueMapper: (WeeklyExpensesData exp, _) =>
                    exp.totalExpensesInDay.toInt(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(
                    color: Color.fromRGBO(122, 116, 116, 0.094),
                  ),
                ),
              )
            ],
            plotAreaBorderWidth: 0,
            primaryYAxis: NumericAxis(
              isVisible: true,
              interval: 50,
              labelStyle: const TextStyle(fontFamily: "Montserrat"),
              axisLine: const AxisLine(
                width: 0,
              ),
            ),
            primaryXAxis: CategoryAxis(
              labelStyle: const TextStyle(fontFamily: "Montserrat"),
              axisLine: const AxisLine(
                width: 1,
                color: Colors.grey,
              ),
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0),
              rangePadding: ChartRangePadding.auto,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('Jan', 1000),
      ExpenseData('Feb', 200),
      ExpenseData('March', 534),
      ExpenseData('Apr', 754),
      ExpenseData('May', 155),
      ExpenseData('Jun', 547),
    ];

    return chartData;
  }

  List<WeeklyExpensesData> getColumnData() {
    final List<WeeklyExpensesData> data = [
      WeeklyExpensesData("Mon", 50),
      WeeklyExpensesData("Tue", 30),
      WeeklyExpensesData("Wed", 10),
      WeeklyExpensesData("Thu", 42),
      WeeklyExpensesData("Fri", 75),
      WeeklyExpensesData("Sat", 97),
      WeeklyExpensesData("Sun", 9),
    ];

    return data;
  }
}

class ExpenseData {
  final String month;
  final num totalExpensesInMonth;

  ExpenseData(
    this.month,
    this.totalExpensesInMonth,
  );
}

class WeeklyExpensesData {
  final String day;
  final num totalExpensesInDay;

  WeeklyExpensesData(this.day, this.totalExpensesInDay);
}
