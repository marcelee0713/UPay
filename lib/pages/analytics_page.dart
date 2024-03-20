import 'package:citefest/api/analytics_data.dart';
import 'package:citefest/api/auth.dart';
import 'package:citefest/constants/colors.dart';
import 'package:citefest/models/analytics.dart';
import 'package:citefest/utils/index_provider.dart';
import 'package:citefest/widgets/analytics/analytics_empty.dart';
import 'package:citefest/widgets/analytics/modes_button.dart';
import 'package:citefest/widgets/universal/sub_section_info.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<AnalyticsData> monthlyExpenses;
  late List<AnalyticsData> dailyExpenses;
  User? user = getUser();

  int markerToExpand = 0;
  int totalMonthSpent = 0;

  String currentSection = "expenses";
  bool alreadyLoaded = false;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime last7Day = DateTime.now().subtract(const Duration(days: 7));

    String formatNow = DateFormat('MMM d, yyyy').format(now);
    String formatLast7Day = DateFormat('MMM d, yyyy').format(last7Day);

    debugPrint("test");

    if (user == null) return const CircularProgressIndicator();

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
            onPressProfile: () => changePage(index: 3, context: context),
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
                      totalMonthSpent = 0;
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
                      totalMonthSpent = 0;
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
          FutureBuilder(
            future: (currentSection == "expenses")
                ? monthExpensesData(uid: user!.uid)
                : monthlyIncomesData(uid: user!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              monthlyExpenses = snapshot.data!;

              if (monthlyExpenses.isEmpty) {
                return const EmptyAnalytics();
              }

              return Column(
                children: [
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
                        "P ${monthlyExpenses[markerToExpand].amount}",
                        style: const TextStyle(
                          color: ColorPalette.accentBlack,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: SfCartesianChart(
                      onMarkerRender: (markerArgs) {
                        if (markerArgs.pointIndex == markerToExpand) {
                          markerArgs.markerHeight = 20.0;
                          markerArgs.markerWidth = 20.0;
                          markerArgs.color = ColorPalette.primary;
                          markerArgs.shape = DataMarkerType.circle;
                        }
                      },
                      onTrackballPositionChanging: (trackballArgs) {
                        setState(() {
                          totalMonthSpent = int.parse(
                              trackballArgs.chartPointInfo.label ?? "0");
                          markerToExpand =
                              trackballArgs.chartPointInfo.dataPointIndex!;
                        });
                      },
                      trackballBehavior: TrackballBehavior(
                        enable: true,
                        activationMode: ActivationMode.singleTap,
                        lineWidth: 0,
                        tooltipDisplayMode: TrackballDisplayMode.none,
                      ),
                      series: <ChartSeries>[
                        SplineSeries<AnalyticsData, String>(
                          color: ColorPalette.secondary,
                          dataSource: monthlyExpenses,
                          markerSettings: const MarkerSettings(
                            isVisible: true,
                            width: 12.5,
                            height: 12.5,
                            borderWidth: 3,
                            borderColor: ColorPalette.primary,
                          ),
                          xValueMapper: (AnalyticsData exp, _) => exp.label,
                          yValueMapper: (AnalyticsData exp, _) => exp.amount,
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
                  ),
                ],
              );
            },
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
                children: [
                  const Text(
                    "Daily Statistics Overview",
                    style: TextStyle(
                      color: ColorPalette.accentBlack,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    "$formatLast7Day - $formatNow",
                    style: const TextStyle(
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
          SizedBox(
            height: 300,
            child: FutureBuilder(
                future: (currentSection == "expenses")
                    ? getDailyExpensesData(uid: user!.uid)
                    : getDailyIncomeData(uid: user!.uid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  dailyExpenses = snapshot.data!;

                  if (dailyExpenses.isEmpty) {
                    return const EmptyAnalytics();
                  }

                  return SfCartesianChart(
                    trackballBehavior: TrackballBehavior(
                      enable: true,
                      activationMode: ActivationMode.singleTap,
                      lineWidth: 0,
                      tooltipDisplayMode: TrackballDisplayMode.none,
                    ),
                    series: <ChartSeries>[
                      ColumnSeries<AnalyticsData, String>(
                        color: ColorPalette.skyBlue,
                        dataSource: dailyExpenses,
                        xValueMapper: (AnalyticsData exp, _) => exp.label,
                        yValueMapper: (AnalyticsData exp, _) => exp.amount,
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
                  );
                }),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
