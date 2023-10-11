import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_Page extends StatefulWidget {
  String?Userdocid;
   Notification_Page({this.Userdocid});

  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: const Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: height/10.8,
        title: Text("Notification",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
              fontSize:width/22,
              color: Colors.white),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff245BCA),
                    Color(0xff245BCA),
                  ]
              )
          ),
        ),
      ),
      body: StreamBuilder(
       stream: FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Notification").snapshots(),
       builder: (context, snapshot) {
         if(snapshot.hasData==null){
           return const Center(child: CircularProgressIndicator(),);
         }
         if(!snapshot.hasData){
           return const Center(child: CircularProgressIndicator(),);
         }
         return ListView.builder(
           shrinkWrap: true,
           physics:const BouncingScrollPhysics(),
           itemCount: snapshot.data!.docs.length,
           itemBuilder: (context, index) {

             var Notification=snapshot.data!.docs[index];

           return Padding(
             padding:  EdgeInsets.symmetric(
               vertical: height/94.5,
               horizontal: width/45
             ),
             child: Material(
                 color: Colors.grey.shade300,
                 borderRadius: BorderRadius.circular(8),
               elevation: 10,
               shadowColor: Colors.black12,
               child: Container(
                 padding:  EdgeInsets.symmetric(
                   horizontal: width/90,
                   vertical: height/189
                 ),
               decoration: BoxDecoration(
                   color: Colors.grey.shade300,
                 borderRadius: BorderRadius.circular(8)
               ),
                 child: ListTile(
                   onTap: (){

                     Updatethestatusfunc(Notification.id);

                   },
                   style: ListTileStyle.drawer,
                   title: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         width:width/1.531,
                         child: Text(Notification['title'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                             fontSize: width/30,
                             color: const Color(0xff8C8994)),),
                       ),
                       Stack(alignment: Alignment.topRight,
                         children: [
                           Column(
                             children: [
                               Text(Notification['date'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                   fontSize: width/30,
                                   color: const Color(0xff8C8994)),),
                               Text(Notification['time'].toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                   fontSize: width/30,
                                   color: const Color(0xff8C8994)),),
                             ],
                             crossAxisAlignment: CrossAxisAlignment.start,
                           ),
                           Notification['isviewed']==false? Icon(Icons.circle,color: Colors.red,size: width/24,):const SizedBox()
                         ],
                       ),
                     ],
                   ),
                   subtitle:
                   SizedBox(
                     height: height/12.6,
                     width: width/1.44,
                     child: Text("Content : ${Notification['content'].toString()}",
                       style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                         textStyle: const TextStyle(
                             overflow: TextOverflow.ellipsis
                         ),
                         fontSize: width/30,
                         color: const Color(0xff8C8994)),),
                   ),
                 ),
               ),
             ),
           );
         },);
       },
     ),
    );
  }

  Updatethestatusfunc(docid){
    FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).collection("Notification").doc(docid).update({
      "isviewed":true
    });
  }


}
