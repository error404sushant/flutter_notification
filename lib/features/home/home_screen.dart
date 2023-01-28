import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

//region Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//endregion

class _HomeScreenState extends State<HomeScreen> {
  //region Build
  late HomeBloc homeBloc;
  //endregion
  //region Init
  @override
  void initState() {
    homeBloc = HomeBloc(context: context);
    super.initState();
  }
  //endregion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }


  //region Body
Widget body(){
    return Center(child: button());
}
//endregion

//region Button
Widget button(){
    return CupertinoButton(
        color: Colors.green,
        child: Text("hello"), onPressed: (){

      homeBloc.getToken();

    });
}
//endregion




}
