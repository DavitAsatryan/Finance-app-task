import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//List<SelsData> _chartData;

// List<SelsData> getChartData() {
//   final List<SelsData> chartData = [
//     SelsData(month: "Jan", number: 0),
//     SelsData(month: "Feb", number: 250),
//     SelsData(month: "Mar", number: 500),
//     SelsData(month: "Apr", number: 510),
//     SelsData(month: "May", number: 520),
//     SelsData(month: "Jun", number: 530),
//   ];
//   return chartData;
// }

Container diagram_widget(BuildContext context) {
  List<FlSpot> spotList = [
    FlSpot(0, 1.6),
    FlSpot(1.1, 1.3),
    FlSpot(2.4, 2.4),
    FlSpot(3.2, 1.9),
    FlSpot(4.1, 0.7),
    FlSpot(5.1, 1.5),
    FlSpot(6.2, 2.1),
    FlSpot(7.8, 1.6),
  ];
  int showingTooltipSpot = 1;
  return Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        //color: AppColors.topBackgroundColor,

        ),
    width: AppSizeConst(context).width / 1.3,
    child: SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 450,
        height: 235,
        decoration: const BoxDecoration(
            //color: AppColors.topBackgroundColor,

            ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: LineChart(
                  LineChartData(
                      //         showingTooltipIndicators:  showingTooltipSpot != -1 ? [ShowingTooltipIndicators([
                      //   LineBarSpot(spotList[0], showingTooltipSpot,
                      //       spotList[0].spots[showingTooltipSpot]),
                      // ])] : [],
                      backgroundColor:
                          AppColors.darkGrayColor.withOpacity(0.09),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 3,
                      lineTouchData: LineTouchData(
                        touchCallback: (p0) {
                          // for (var i = 0; i < p0.lineBarSpots.length; i++) {
                          //   print(p0.lineBarSpots![i].spotIndex);

                          //   if (p0.lineBarSpots![i].spotIndex == spotList[i]) {
                          //     spotList[i].copyWith(x: 54, y: 44);
                          //   }
                          // }
                          // p0.lineBarSpots![0];
                        },
                      ),
                      // betweenBarsData: [BetweenBarsData(fromIndex: 1, toIndex: 1)],
                      titlesData: LineTitleData.getTitleData(),
                      gridData: FlGridData(
                          checkToShowVerticalLine: (value) => true,
                          drawVerticalLine: true,
                          verticalInterval: 1.5,
                          show: true,
                          getDrawingVerticalLine: (value) => FlLine(
                                color: AppColors.backgroundColor,
                                strokeWidth: 5,
                              ),
                          drawHorizontalLine: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spotList.map((e) => e).toList(),
                          isCurved: true,
                          colors: [AppColors.blueColor],
                          barWidth: 1.5,
                        ),
                      ]),
                ),
              ),
            ),
            diagram_top_text(),
          ],
        ),
      ),
    ),
  );
}

Align diagram_top_text() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
        width: 200,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3.0),
                blurRadius: 5.0,
                color: AppColors.darkGrayColor.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, 10.0),
                blurRadius: 5.0,
                color: AppColors.darkGrayColor.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, -1.0),
                blurRadius: 5.0,
                color: AppColors.darkGrayColor.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, -1.0),
                blurRadius: 5.0,
                color: AppColors.darkGrayColor.withOpacity(0.1),
              ),
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "489",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "additional text",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w300),
            ),
          ],
        )),
  );
}

class LineTitleData {
  static getTitleData() => FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1.3,
        margin: 10,
        reservedSize: 20,
        getTextStyles: (value) => const TextStyle(
            color: AppColors.darkGrayColor,
            fontSize: 15,
            fontWeight: FontWeight.normal),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return "0";
            case 1:
              return "250";
            case 2:
              return "500";
          }
          return "";
        },
      ),
      topTitles: null,
      bottomTitles: SideTitles(
        showTitles: true,
        interval: 1.5,
        margin: 15,
        reservedSize: 20,
        checkToShowTitle:
            (minValue, maxValue, sideTitles, appliedInterval, value) => true,
        getTextStyles: (value) => const TextStyle(
            color: AppColors.darkGrayColor,
            fontSize: 15,
            fontWeight: FontWeight.normal),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return "JAN";
            case 2:
              return "FEB";
            case 3:
              return "MAR";
            case 4:
              return "APR";
            case 5:
              return "MAY";
            case 6:
              return "JUN";
            case 7:
              return "JUL";
            case 8:
              return "AUG";
            case 9:
              return "SEP";
            case 10:
              return "OCT";
            case 11:
              return "NOV";
            case 12:
              return "DEC";
          }
          return "";
        },
      ));
}
