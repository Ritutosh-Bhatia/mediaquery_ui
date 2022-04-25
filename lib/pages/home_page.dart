import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_ui/cubid/app_cubits.dart';
import 'package:travel_ui/cubid/app_cubits_states.dart';
import 'package:travel_ui/widgets/app_large_text.dart';

import '../misc/colors.dart';
import '../widgets/app_text.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
  "kayaking.png":"Kayaking",
  "snorkling.png":"Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // menu text
        Container(
        padding: const EdgeInsets.only(top: 70,left: 20,right: 20),
    child: Row(
    children: [
    Icon(Icons.menu, size:30,color: Colors.black54,),
    Expanded(child: Container()),
    Container(
    width: MediaQuery.of(context).size.width*0.13,
    //height: 50,
    height: MediaQuery.of(context).size.height*0.058,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(0.5),
    ),
    )
    ],
    ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height*0.035,),
    // discover text
    Container(
    margin: EdgeInsets.only(left: 20),
    child: AppLargeText(text: "Discover"),
    ),
    SizedBox(height: MediaQuery.of(context).size.height*0.023,),
    // TabBar
    Container(
    child:
    Align(
    alignment: Alignment.centerLeft,
    child: TabBar(
    labelPadding: EdgeInsets.only(left: 20,right: 20),
    controller: _tabController,
    indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
    indicatorSize: TabBarIndicatorSize.label,
    labelColor: Colors.black54,
    unselectedLabelColor: Colors.grey.withOpacity(0.5),
    isScrollable: true,
    tabs: [
    Tab(text: "Places",),
    Tab(text: "Inspiration",),
    Tab(text: "Emotions",),
    ],
    ),
    )
    ),
    Container(
    padding: EdgeInsets.only(left: 20),
    //height: 300,
    height: MediaQuery.of(context).size.height*0.355,
    width: double.maxFinite,
    child: TabBarView(
    controller: _tabController,
    children: [
    ListView.builder(
    itemCount: 3,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index ){
    return

      GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => const DetailPage()),);
        },
        child: Container(
          margin: EdgeInsets.only(right: 15,top: 10),
          //  width: 200,
          width: MediaQuery.of(context).size.width*0.51,
          //height: 300,
          height: MediaQuery.of(context).size.height*0.355,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(
                  "img/mountain.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }),
    Tab(text: "There",),
    Tab(text: "Bye",),
    ],
    ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height*0.035,),
    Container(
    margin:  EdgeInsets.only(left: 20,right: 20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    AppLargeText(text: "Explore more", size: 22,),
    AppText(text: "See all", color: AppColors.textColor1),
    ],
    ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height*0.013,),
    Container(
    height: MediaQuery.of(context).size.height*0.18,
    width: double.maxFinite,
    margin: EdgeInsets.only(left: 20),
    child: ListView.builder(
    itemCount: 4,
    scrollDirection: Axis.horizontal,
    itemBuilder: (_, index)
    {
    return
    Container(
    margin: EdgeInsets.only(right: 20),
    child:
    Column(
    children: [
    Container(
    //margin: EdgeInsets.only(right: 50),
    // width: 80,
    // height: 80,
    width: MediaQuery.of(context).size.width*0.22,
    height: MediaQuery.of(context).size.height*0.085,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    image: DecorationImage(
    image: AssetImage(
    "img/"+images.keys.elementAt(index)),
    fit: BoxFit.cover,
    ),
    ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height*0.015,),
    Container(
    child: AppText(
    text: images.values.elementAt(index),
    color: AppColors.textColor2,),
    )
    ],
    ),
    );
    },
    ),
    ),
    ],
    ),
    ),);
  }
}

class CircleTabIndicator extends Decoration
{ final Color color;
 double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged])
  {
    return
    _CirclePainter(color: color, radius: radius);
  }
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});

  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration)
  {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset =
    Offset(configuration.size!.width/2 -radius/2,
        configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);

  }
}