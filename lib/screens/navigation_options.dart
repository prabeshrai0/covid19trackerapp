import 'package:covid19tracker/utilites/constants.dart';
import 'package:flutter/material.dart';
class NavigationOption extends StatelessWidget {


  final String title;
  final bool selected;
  final Function onSelected;

  const NavigationOption({@required this.title,@required  this.selected,@required  this.onSelected});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        onSelected();
      },
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(title,style:TextStyle(
            color: selected ? kprimaryColor :Colors.grey[400],
            fontSize: 16,
            fontWeight: FontWeight.bold
          )),
          selected ?Column(
            children: [
              SizedBox(height: 12,),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  shape: BoxShape.circle
                ),
              )
            ],
          ):Container()
        ],

      ),
    );
  }
}
