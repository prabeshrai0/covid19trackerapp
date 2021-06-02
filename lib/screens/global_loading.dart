import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          _loadingCard(),
          _loadingCard(),
          _loadingCard(),
          _loadingCard(),
          loadingLabel()
        ],
      ),
    );
  }

  Widget _loadingCard(){

    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Shimmer.fromColors(child: Column(
          children: [
            Container(
              width: 100,
              height: 80,
              color: Colors.white,
            ),
            Expanded(child: Container()),
            SizedBox(height: 5,),
            Container(
              width:double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(height: 5,),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.white,
            )
          ],
        ), baseColor: Colors.grey[300], highlightColor:Colors.grey[100]),
      ),
    );


  }

  Widget loadingLabel(){

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(child: Column(
        children: [
          Container(
            width: 200,
            height: 16,
            color: Colors.white,
          )
        ],
      ), baseColor: Colors.blue[300], highlightColor: Colors.blue[100]),
    );
  }

}
