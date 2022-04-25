import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_ui/cubid/app_cubits.dart';
import 'package:travel_ui/pages/home_page.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/"+images[index]
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips",),
                      AppText(text: "Mountain", size: 30,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                      Container(
                      // width: 250,
                        width: MediaQuery.of(context).size.width*0.62,
                        child: AppText(text: "Mountain hikes give you an incredible sense of freedom along with eduravce test",
                        color: AppColors.textColor2,
                        size: 14,
                        )
                      ),
                    //  SizedBox(height: 20,),
                     SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                      GestureDetector(
                        onTap: (){  Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const HomePage()),);
                          //BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.32,
                          child:
                              Row(
                                children: [
                                  ResponsiveButton(width:MediaQuery.of(context).size.width*0.32),
                                ],
                              )
                          ),
                      ),


                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        width: MediaQuery.of(context).size.width*0.025,
                        margin: EdgeInsets.only(bottom: 2),
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.4),
                        ),
                      );
                    })
                  )
                ],
              ),
              ),
            );
      }),
    );
  }
}
