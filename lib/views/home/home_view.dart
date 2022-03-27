import 'package:flutter/material.dart';
import 'package:flutter_github_app/globals/colors.dart';
import 'package:flutter_github_app/widgets/label.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/repository_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  FocusNode searchInputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    final CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation = Tween<double>(begin: 0, end: 150).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
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
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (viewModel.isSearchAnimated) {
                      animationController.reverse();
                      viewModel.isSearchAnimated = false;
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: animation.value,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            child: TextField(
                              onChanged: (String searchInput) {
                                viewModel.searchInput = searchInput;
                              },
                              focusNode: searchInputFocusNode,
                              cursorColor: Colors.white12,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => viewModel.fetchRepositories(),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: animation.value > 1
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )
                                : BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (!viewModel.isSearchAnimated) {
                                animationController.forward().then((value) =>
                                    searchInputFocusNode.requestFocus());
                                viewModel.isSearchAnimated = true;
                              } else {
                                viewModel.fetchRepositories();
                              }
                            },
                            splashColor: viewModel.isSearchAnimated
                                ? primaryColor
                                : Colors.transparent,
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (viewModel.repoResults.isNotEmpty)
                  Flexible(
                    fit: FlexFit.tight,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewModel.repoResults.length,
                        itemBuilder: (context, index) => RepositoryItem(
                          repo: viewModel.repoResults[index],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      );
}
