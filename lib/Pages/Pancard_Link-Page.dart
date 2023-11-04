import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jp_ads/const_file.dart';
import 'package:lottie/lottie.dart';

class Pancard_Link_Page extends StatefulWidget {
  String ?Userdocid;
  String ?UserType;
  String ?UserWalletamount;
  int ?Usagecount;
  Pancard_Link_Page({this.Userdocid,this.UserType,this.UserWalletamount,this.Usagecount});

  @override
  State<Pancard_Link_Page> createState() => _Pancard_Link_PageState();
}

class _Pancard_Link_PageState extends State<Pancard_Link_Page> {

  TextEditingController Pannumbercontroller=TextEditingController();


  @override
  void initState() {
    checkusagecount();
    // TODO: implement initState
    super.initState();
  }
  checkusagecount()async{
    var document=await FirebaseFirestore.instance.collection("Users").doc(widget.Userdocid).get();
    if(document['usertype']=="Individual"){
      if(document['usageccount']==3){
        print(document["usageccount"]);
        planExitpopup();
      }
      if(document['walletamount']<=157){
        return  awesomeDialog("Low Wallet Amount", "Please Recharge Wallet Amount");
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: height/10.8,
        title: Text("PAN Card Link",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
              fontSize:width/22,
              color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/25.2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height:height/4.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Check Your Pan Link Status",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                            fontSize:width/22,
                            color: Colors.black),),
                      SizedBox(height: height/75.6,),
                      Container(
                        height: height/15.12,
                        width: width/1.125,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Color(0xff353535)
                            )
                        ),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.characters,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/22,
                              color: Colors.black),
                          controller: Pannumbercontroller,
                          maxLength: 10,
                          maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9A-Z]")),
                          ],
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(left: width/18),
                            border: InputBorder.none,
                              hintText: "Type pan number",
                              hintStyle: GoogleFonts.poppins()
                          ),
                          validator: (value) => value!.isEmpty ? 'Field is required' : null,
                        ),
                      ),
                      SizedBox(height: height/37.8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: width/1.531,),
                          GestureDetector(
                            onTap: (){
                             // pancardstatuscheckfunction();
                            },
                            child: Center(
                              child:
                              Container(
                               height: height/21.6,
                                width: width/4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff245BCA),
                                          Color(0xff245BCA),
                                        ]
                                    )
                                ),
                                child: Center(
                                  child:  Text("Check",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        fontSize:width/25,
                                        color: Colors.white),),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )


                    ],
                  ),
                ),
              ],
            ),

            Container(
              height:height/3.436,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffffe09f)
              ),
              margin: EdgeInsets.only(left: width/18,right: width/18),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: width/24,
                  vertical: height/50.4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pan Card Link Status",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/22,
                              color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: height/50.4,),

                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Pan generated by",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/28,
                                color: Color(0xffA0A0A0)),),
                        ],
                      ),
                    ),
                    Divider(),

                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Aadhaar Number",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/28,
                                color: Color(0xffA0A0A0)),),
                        ],
                      ),
                    ),
                    Divider(),

                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Your PAN Number",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/28,
                                color: Color(0xffA0A0A0)),),
                        ],
                      ),
                    ),
                    Divider(),

                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("PAN Current Status",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                fontSize:width/28,
                                color: Color(0xffA0A0A0)),),
                        ],
                      ),
                    ),
                    Divider(),



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  pancardstatuscheckfunction() async {

    FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).get().then((value){
    if(value['usertype']=="Individual"){
      if(value['usageccount']<3){
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
          "usageccount":FieldValue.increment(1)
        });
      }
      else{
        planExitpopup();
      }
    }

    else{
      FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
        "usageccount":FieldValue.increment(1)
      });
    }

    });




  }

  planExitpopup() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return
          Padding(
            padding: EdgeInsets.only(
                left: width / 8.268,
                right: width / 8.845,
                top: height / 3.5,
                bottom: height / 3.5),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white

                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:height/25.2,),

                      SizedBox(
                        // height: 150,
                        // width:width/2.4,
                        child: Lottie.asset(Errrorlottie,fit: BoxFit.cover,height: height/6.3,width: width/3),
                      ),
                      SizedBox(height: height/75.6,),

                      Text(
                        "Exist Your  Free Apply....",
                        style: GoogleFonts.poppins(
                            fontSize: width / 25.613,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(height: height/12.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //cancel button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Container(
                              height:height/21.6,
                              width:width/4.5,
                              decoration: BoxDecoration(
                                  color: Color(0xff255BCA),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          ),

                          //okay button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Container(
                              height:height/21.6,
                              width:width/4.5,
                              decoration: BoxDecoration(
                                  color: Color(0xff255BCA),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    "Okay",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: width / 25.718),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width / 34.15,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
      },
    );
  }
  awesomeDialog(title,description){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    )..show();
  }
}
