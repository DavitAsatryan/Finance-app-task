import 'package:financial_application/Screens/Secund_Screen/Widgets/app_bar_widget.dart';
import 'package:financial_application/Screens/Secund_Screen/Widgets/tab_bar_widget.dart';
import 'package:financial_application/Screens/Secund_Screen/Widgets/visa_cards_container_widget.dart';
import 'package:flutter/material.dart';

class CreditCardsPage extends StatefulWidget {
  @override
  State<CreditCardsPage> createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  TabController? controller;
  int pageNow = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.81);
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  onChange(value) {
    pageNow = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar_widget(context),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color.fromARGB(0, 255, 255, 255))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              visa_cards_container_widget(
                  context, pageController, onChange, pageNow),
              const SizedBox(
                height: 15,
              ),
              tab_bar_widget(context, controller!),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
