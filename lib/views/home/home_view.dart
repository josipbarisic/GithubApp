import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/views/home/widgets/search_results_section.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/search_input.dart';
import 'widgets/toggle_search_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    final CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation = Tween<double>(begin: 0, end: 200).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (
          BuildContext context,
          HomeViewModel viewModel,
          Widget? child,
        ) =>
            Scaffold(
          backgroundColor: primaryDarkColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            flexibleSpace: SafeArea(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.white,
                    ),
                  ),
                  const Label(
                    text: 'Github App',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  ToggleSearchButton(),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => viewModel.searchInputFocusNode.unfocus(),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchInput(
                    animationController: animationController,
                    animation: animation,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: SearchResultsSection(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
