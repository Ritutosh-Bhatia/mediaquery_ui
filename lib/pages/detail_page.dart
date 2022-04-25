import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/widgets/app_button.dart';
import 'package:travel_ui/widgets/app_large_text.dart';
import 'package:travel_ui/widgets/app_text.dart';
import 'package:travel_ui/widgets/responsive_button.dart';

import '../misc/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage ({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int goldenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              //height: 350,
              height: MediaQuery.of(context).size.height*0.41,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg"),
                  fit: BoxFit.cover
                )
              ),
            ),),
          Positioned(
            left: 20,
            top: 70,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            top: 320,
            child:
            Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              width: MediaQuery.of(context).size.width*1,
             //height: 500,
              height: MediaQuery.of(context).size.height*0.58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Yosemite", color: Colors.black54,),
                      AppLargeText(text: "\$ 230",color: AppColors.mainColor,),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: AppColors.mainColor,),
                      AppText(text: "USA, California",color: AppColors.textColor2,)
                    ],
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.025,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, color:goldenStars>index?AppColors.starColor:AppColors.textColor2 ,);
                        }
                        ),
                      ),
                      SizedBox(width:  MediaQuery.of(context).size.width*0.02,),
                      AppText(text: "(3.0)",color: AppColors.textColor2,)
                    ],
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.005,),
                  AppLargeText(text: "People",color: Colors.black54,size: 20,),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.005,),
                  AppText(text: "Number of people in your group", color: AppColors.mainTextColor,),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.010,),
                  Wrap(
                    children: List.generate(5, (index) {
                      return InkWell(
                        onTap: (){
                          setState((){
                            selectedIndex=index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: AppButtons(
                        backgroundColor:  selectedIndex==index?Colors.black54:Colors.grey.withOpacity(0.5),
                        size: 55,
                        borderColor: selectedIndex==index?Colors.black54:Colors.grey,
                        color:  selectedIndex==index?Colors.white:Colors.black54,
                      text: (index+1).toString(),
                          ),),
                        );
                    }),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.025,),
                  AppLargeText(text: "Description", color: Colors.black54,size: 20,),
                  SizedBox(height:  MediaQuery.of(context).size.height*0.015,),
                  AppText(text: "Yosemite National Park is located in western Sierra Nevada mountains of Central California"
                      " It is located near the wild protection areas", color: AppColors.mainTextColor,)

                ],
              ),
            ),
      ),
          Positioned(
            bottom: 20,
              left: 20,
              right: 20,
              child: Row(
            children: [
              AppButtons(size: 60, color: AppColors.textColor1,
                  backgroundColor: Colors.white,
                  borderColor: AppColors.textColor1,
              isIcon: true,
              icon: Icons.favorite_border,),
              SizedBox(width:  MediaQuery.of(context).size.width*0.025,),
              ResponsiveButton(
                isResponsive: true,
              )
              // Container(
              //   width: 275,
              //   height: 60,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: AppColors.mainColor
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(left: 20),
              //          child: AppText(text: "Book Trip Now", color: Colors.white,),
              //       ),
              //
              //       Image.asset("img/button-one.png",),
              //     ],
              //   ),
              // ),
            ],
          )),

        ]
      ),
    ),
    );
  }
}
