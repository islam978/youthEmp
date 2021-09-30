import 'package:flutter/material.dart';
import 'package:youth_emp/generated/l10n.dart';
class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}


class _ServicesState extends State<Services> {
  @override
  void initState() {
     //TabController tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  DefaultTabController(
      length: 4,
    child: Scaffold(appBar: AppBar(title: Center(child: Text(S.of(context).title)),bottom:
    TabBar(




    tabs: [
     Tab(text: S.of(context).serv1),
     Tab(text:S.of(context).serv2),
     Tab(text:S.of(context).serv3),
     Tab(text:S.of(context).serv4),
    ],
      ),),
      body:TabBarView(
       // controller: tabController,

        children: [buildTabView(), buildTabView(), buildTabView(),buildTabView()],
      ),
    ));
  }
}


buildTabView(){
  return ListView.builder(itemCount: 10,
  itemBuilder: (context,index){
    return Container(
      color:Colors.deepOrange
    );
});}
