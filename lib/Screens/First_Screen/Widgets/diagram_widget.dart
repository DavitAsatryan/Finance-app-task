import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Diagram extends StatefulWidget {
  const Diagram({Key? key}) : super(key: key);

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> with SingleTickerProviderStateMixin {
  bool isPressed = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return diagram_widget(context);
  }

  diagram_widget(BuildContext context) {
    _controller.forward();
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

    // 5. apply some transform to the given child

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            //color: AppColors.topBackgroundColor,

            ),
        width: AppSizeConst(context).width / 1.3,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 5, right: 5),
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 600,
                height: 235,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: LineChart(
                    LineChartData(
                        backgroundColor:
                            AppColors.darkGrayColor.withOpacity(0.19),
                        minX: 0,
                        maxX: 16.5,
                        minY: 0,
                        maxY: 3,
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
                            dotData: FlDotData(
                              show: false,
                            ),
                            colors: [AppColors.blueColor],
                            barWidth: 1.5,
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            diagram_top_text(context),
          ],
        ),
      ),
    );
  }
}

Container diagram_top_text(BuildContext context) {
  return Container(
    width: 200,
    height: 40,
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
    ),
  );
}

class LineTitleData {
  static getTitleData() => FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1.3,
        margin: 10,
        reservedSize: 30,
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
        // interval: ,
        margin: 15,
        reservedSize: 20,
        getTextStyles: (value) => const TextStyle(
            color: AppColors.darkGrayColor,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return "JAN".toString().padLeft(18);
            case 2:
              return "FEB".toString().padLeft(10);
            case 3:
              return "MAR".toString().padLeft(20);
            case 5:
              return "APR".toString().padLeft(8);
            case 6:
              return "MAY".toString().padLeft(18);
            case 8:
              return "JUN".toString().padLeft(8);
            case 9:
              return "JUL".toString().padLeft(20);
            case 11:
              return "AUG".toString().padLeft(10);
            case 12:
              return "SEP".toString().padLeft(19);
            case 14:
              return "OCT".toString().padLeft(10);
            case 15:
              return "DEC".toString().padLeft(19);
          }
          return "";
        },
      ));
}
