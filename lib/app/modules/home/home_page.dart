import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_cubit/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, SwitchStatus>(
      bloc: controller,
      listener: (context, state) {
        switch (state) {
          case SwitchStatus.active:
            print("ESTOU ATIVO!");
            break;
          case SwitchStatus.inactive:
            print('ESTOU INATIVO');
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AAA'),
        ),
        body: BlocSelector<HomeController, SwitchStatus, bool>(
          bloc: controller,
          selector: (state) {
            return state == SwitchStatus.active;
          },
          builder: (context, checked) {
            return Switch(
                value: checked,
                onChanged: (change) {
                  controller.changeSwitch(change);
                });
          },
        ),
      ),
    );
  }
}
