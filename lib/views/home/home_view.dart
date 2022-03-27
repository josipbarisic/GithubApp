import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (
          BuildContext context,
          HomeViewModel viewModel,
          Widget? child,
        ) =>
            SafeArea(
          child: Column(
            children: [
              MaterialButton(
                child: const Text('Test button'),
                color: Colors.blue,
                onPressed: () => viewModel.fetchRepositories('something'),
              ),
            ],
          ),
        ),
      );
}
