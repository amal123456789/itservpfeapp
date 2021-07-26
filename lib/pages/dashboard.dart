import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      //color: Colors.blueGrey.shade200,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
       borderRadius: BorderRadius.circular(20.0),
      ),
       alignment: Alignment.centerRight,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(height: 25.0,),
          Row(children: [
            
                Spacer(),
          ],),
        ],
      ),
      

      
      
    );
    

}
}