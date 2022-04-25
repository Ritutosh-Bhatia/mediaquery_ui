import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_ui/cubid/app_cubits.dart';
import 'package:travel_ui/cubid/app_cubits_states.dart';
import 'package:travel_ui/pages/welcome_page.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';

class AppCubitLogics extends  StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
         builder: (context, state){
           if(state is WelcomeState){
             return WelcomePage();
           } if(state is LoadingState){
             return HomePage();
           }
           if(state is LoadedState){
             return DetailPage();
           }
           else{
             return Container();
           }
      },
      ),
    );
  }
}
