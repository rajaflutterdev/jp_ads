
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jp_ads/const_file.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class Pancard_correction_Page extends StatefulWidget {
  String ?Userdocid;
  String ?UserType;
  String ?UserWalletamount;
  Pancard_correction_Page({this.Userdocid,this.UserType,this.UserWalletamount});

  @override
  State<Pancard_correction_Page> createState() => _Pancard_correction_PageState();
}

class _Pancard_correction_PageState extends State<Pancard_correction_Page> {


  String selectedValuegender='Select Gender';
  List<String>Gender=['Select Gender',"Male","Female","Transgender"];

int nameradiobutton=0;
int fathernameradiobutton=0;
int dobradiobutton=0;
int addressradiobutton=0;
int photoradiobutton=0;
int signatureradiobutton=0;
List Selectedradiovalue=[];

int ischeck=0;
  double normal_fees=0;
  double Gst=0;
  double Total=0;


TextEditingController Pannumbercontroller=TextEditingController();
TextEditingController aadhaarontroller=TextEditingController();
TextEditingController corerctnamecontroller=TextEditingController();
TextEditingController corerctfathernamecontroller=TextEditingController();
TextEditingController corerctdobcontroller=TextEditingController();
TextEditingController corerctnameandvillagecontroller=TextEditingController();
TextEditingController corerctaddresscontroller=TextEditingController();
TextEditingController corerctdistrictcontroller=TextEditingController();
TextEditingController corerctstatecontroller=TextEditingController();
TextEditingController corerctpincodecontroller=TextEditingController();
TextEditingController corerctphonenumbercontroller=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final RegExp _inputPattern = RegExp(r'^\d{4}\s\d{4}\s\d{4}$');
  int steppervalue=0;

  bool Loading=false;
  File ?_photo1;
  File ?_photo2;
  File ?_photo3;
  File ?_photo4;
  String imageUrl="";
  String  imageUrl2="";
  String  imageUrl3="";
  String  imageUrl4="";
  @override
  void initState() {
    checkusagecount();
  setState(() {
    Selectedradiovalue.clear();
  });
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
        title: Text("PAN Card-Correction",
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
      body:
     Stack(
       alignment: Alignment.center,
       children: [
         SingleChildScrollView(
           physics: BouncingScrollPhysics(),
           child: Form(
             key:_formKey,
             child: Column(

               children: [

                 SizedBox(height: height/75.6,),


                 Stack(
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(top:height/54,left: width/18),
                       child: Container(
                         width: width/1.1612,
                         height: height/92.5,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             color: Colors.grey),
                       ),
                     ),
                     Padding(
                       padding:  EdgeInsets.only(top:height/54,left: width/18),
                       child: AnimatedContainer(
                           duration: const Duration(milliseconds: 1000),
                           width: steppervalue*width/4.8,
                           height: height/92.5,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(3),
                               color: Colors.green)),
                     ),
                     Padding(
                       padding:  EdgeInsets.only(top:height/189),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Column(
                             children: [
                               AnimatedContainer(
                                 height:height/28.909,
                                 width:width/13.6,
                                 duration: Duration(milliseconds: 1000),
                                 decoration: BoxDecoration(
                                     color: steppervalue>=0?Colors.green:Colors.grey,
                                     borderRadius: BorderRadius.circular(100),

                                     border: Border.all(color: steppervalue>=0?Colors.white:Colors.transparent,width: 1)
                                 ),
                                 child: Center(child: steppervalue!=0? Icon(Icons.done,color: Colors.white,size: width/24,):
                                 Text("1",style: GoogleFonts.poppins(
                                     color:Colors.white
                                 ))),
                               ),
                               Text("1.From\nSubmit",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                     color:steppervalue>=0?Colors.green:Colors.black, fontSize: width/36.0),)
                             ],
                           ),
                           Column(
                             children: [
                               AnimatedContainer(
                                 height:height/28.909,
                                 width:width/13.6,
                                 duration: Duration(milliseconds: 1000),
                                 decoration: BoxDecoration(
                                     color: steppervalue>=1?Colors.green:Colors.grey,
                                     borderRadius: BorderRadius.circular(100),

                                     border: Border.all(color: steppervalue>=1?Colors.white:Colors.transparent,width: 1)
                                 ),
                                 child: Center(child: steppervalue>1?
                                 Icon(Icons.done,color: Colors.white,size: width/24):
                                 Text("2",style: GoogleFonts.poppins(
                                     color:Colors.white
                                 ))),
                               ),
                               Text("2.Photo\nUpload",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                     color:steppervalue>=1?Colors.green:Colors.black, fontSize: width/36.0),)
                             ],
                           ),
                           Column(
                             children: [
                               AnimatedContainer(
                                 height:height/28.909,
                                 width:width/13.6,
                                 duration: Duration(milliseconds: 1000),
                                 decoration: BoxDecoration(
                                     color: steppervalue>=2?Colors.green:Colors.grey,
                                     borderRadius: BorderRadius.circular(100),

                                     border: Border.all(color: steppervalue>=2?Colors.white:Colors.transparent,width: 1)
                                 ),
                                 child: Center(child: steppervalue>2?
                                 Icon(Icons.done,color: Colors.white,size: width/24):
                                 Text("3",style: GoogleFonts.poppins(
                                     color:Colors.white
                                 ))),
                               ),
                               Text("3.Signature\nUpload",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                     color:steppervalue>=2?Colors.green:Colors.black, fontSize: width/36.0),)
                             ],
                           ),
                           Column(
                             children: [
                               AnimatedContainer(
                                 height:height/28.909,
                                 width:width/13.6,
                                 duration: Duration(milliseconds: 1000),
                                 decoration: BoxDecoration(
                                     color: steppervalue>=3?Colors.green:Colors.grey,
                                     borderRadius: BorderRadius.circular(100),

                                     border: Border.all(color: steppervalue>=3?Colors.white:Colors.transparent,width: 1)
                                 ),
                                 child: Center(child: steppervalue>3?
                                 Icon(Icons.done,color: Colors.white,size: width/24):
                                 Text("4",style: GoogleFonts.poppins(
                                     color:Colors.white
                                 ))),
                               ),
                               Text("4.Document\nUpload", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                   color:steppervalue>=3?Colors.green:Colors.black, fontSize: width/36.0),)
                             ],
                           ),
                           Column(
                             children: [
                               AnimatedContainer(
                                 height:height/28.909,
                                 width:width/13.6,
                                 duration: Duration(milliseconds: 1000),

                                 decoration: BoxDecoration(
                                     color: steppervalue>=4?Colors.green:Colors.grey,
                                     borderRadius: BorderRadius.circular(100),

                                     border: Border.all(color: steppervalue>=4?Colors.white:Colors.transparent,width: 1)
                                 ),
                                 child: Center(child: steppervalue>4?
                                 Icon(Icons.done,color: Colors.white,size: width/24):
                                 Text("5",style: GoogleFonts.poppins(
                                     color:Colors.white
                                 ))),
                               ),
                               Text("5.Payment\n", textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                   color:steppervalue>=4?Colors.green:Colors.black, fontSize: width/36.0),)
                             ],
                           ),

                         ],
                       ),
                     )


                   ],
                 ),


                 SizedBox(height: height/75.6),

                 SizedBox(
                   height: height/1.426,
                   child:
                   steppervalue==0?
                   Padding(
                       padding: EdgeInsets.only(left: width/36.0,right: width/36.0,),
                     child: Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Color(0xffffe09f)
                       ),
                       child: SingleChildScrollView(
                         physics: const ScrollPhysics(),
                         child:
                         Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SizedBox(height:height/35),

                               ///pan number
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Pan Number *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
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
                                           FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                         ],
                                         decoration: InputDecoration(
                                             counterText: "",
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type pan number",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///Aadhaar number
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Aadhaar Number *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         controller: aadhaarontroller,
                                         maxLength: 14,
                                         keyboardType: TextInputType.phone,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.digitsOnly,
                                           TextInputFormatter.withFunction((oldValue, newValue) {
                                             final newString = newValue.text;

                                             if (_inputPattern.hasMatch(newString)) {
                                               return oldValue;
                                             }

                                             var formattedValue =
                                             newString.replaceAllMapped(RegExp(r'\d{4}'), (match) {
                                               return '${match.group(0)} ';
                                             });

                                             // Remove any trailing space
                                             if (formattedValue.endsWith(' ')) {
                                               formattedValue = formattedValue.substring(0, formattedValue.length - 1);
                                             }

                                             return TextEditingValue(
                                               text: formattedValue,
                                               selection: TextSelection.collapsed(offset: formattedValue.length),
                                             );
                                           }),
                                         ],
                                         decoration: InputDecoration(
                                             counterText: "",
                                             contentPadding: EdgeInsets.only(left: width/18),
                                             border: InputBorder.none,
                                             hintText: "Type Aadhaar Number",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                       ),
                                       // TextFormField(
                                       //   textCapitalization: TextCapitalization.characters,
                                       //   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                       //       fontSize:width/22,
                                       //       color: Colors.black),
                                       //   controller: Pannumbercontroller,
                                       //   maxLength: 10,
                                       //   maxLines: 1,
                                       //   inputFormatters: [
                                       //     FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                       //   ],
                                       //   decoration: InputDecoration(
                                       //       counterText: "",
                                       //       contentPadding: EdgeInsets.only(left:width/18),
                                       //       border: InputBorder.none,
                                       //       hintText: "Type Aadhaar number",
                                       //       hintStyle: GoogleFonts.poppins()
                                       //   ),
                                       //   validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                       //
                                       // ),
                                     )
                                   ],
                                 ),
                               ),



                               ///correction container
                               Container(
                                 height: height/2.16,
                                 color: Colors.white,
                                 margin: EdgeInsets.only(left:width/18,right: width/18,bottom: height/37.8),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding:  EdgeInsets.symmetric(
                                           vertical: height/104.5,
                                           horizontal: width/45
                                       ),
                                       child: Row(
                                         children: [
                                           Text("Correction /Updates For  *",
                                             textAlign: TextAlign.center,
                                             style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                 fontSize:width/22,
                                                 color: Colors.black),),
                                           SizedBox(width: width/36.0,),
                                           GestureDetector(
                                             onTap: (){
                                               setState(() {
                                                 nameradiobutton=0;
                                                 fathernameradiobutton=0;
                                                 dobradiobutton=0;
                                                 addressradiobutton=0;
                                                 photoradiobutton=0;
                                                 signatureradiobutton=0;
                                                 Selectedradiovalue.clear();
                                               });
                                             },
                                             child: Container(
                                               height: height/30.24,width: width/7.2,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(8),
                                                   color: Color(0xff245BCA)
                                               ),
                                               child: Center(
                                                 child: Text("Clear",
                                                   textAlign: TextAlign.center,
                                                   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                       fontSize:width/26,
                                                       color: Colors.white),),
                                               ),
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),
                                     SizedBox(height:height/75.6,),

                                     ///name
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value:1,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: nameradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 nameradiobutton=val!;
                                               });
                                               if(nameradiobutton==1){
                                                 print("nameradiobutton");
                                                 setState(() {
                                                   Selectedradiovalue.add("Name");
                                                 });
                                               }
                                               else{
                                                 print("else");
                                                 setState(() {
                                                   Selectedradiovalue.remove("Name");
                                                 });

                                               }

                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Name",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),

                                     ///father name
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value: 2,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: fathernameradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 fathernameradiobutton=val!;
                                               });
                                               if(val==2){
                                                 setState(() {
                                                   Selectedradiovalue.add("Father Name");
                                                 });
                                               }
                                               else{
                                                 setState(() {
                                                   Selectedradiovalue.remove("Father Name");
                                                 });

                                               }


                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Father Name",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),

                                     ///dob name
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value: 3,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: dobradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 dobradiobutton=val!;
                                               });
                                               if(val==3){
                                                 setState(() {
                                                   Selectedradiovalue.add("Date Of Birth");
                                                 });
                                               }
                                               else{
                                                 setState(() {
                                                   Selectedradiovalue.remove("Date Of Birth");
                                                 });

                                               }

                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Date Of Birth",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),

                                     ///Address
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value: 4,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: addressradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 addressradiobutton=val!;
                                               });
                                               if(val==4){
                                                 setState(() {
                                                   Selectedradiovalue.add("Address");
                                                 });
                                               }
                                               else{
                                                 setState(() {
                                                   Selectedradiovalue.remove("Address");
                                                 });

                                               }

                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Address",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),

                                     ///Photo
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value: 5,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: photoradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 photoradiobutton=val!;
                                               });
                                               if(val==5){
                                                 setState(() {
                                                   Selectedradiovalue.add("Photo");
                                                 });
                                               }
                                               else{
                                                 setState(() {
                                                   Selectedradiovalue.remove("Photo");
                                                 });

                                               }


                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Photo",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),

                                     ///Signature
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Radio(
                                             value: 6,
                                             activeColor: Colors.white,
                                             focusColor: Colors.white,
                                             groupValue: signatureradiobutton,
                                             fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                                             onChanged: (val){
                                               setState(() {
                                                 signatureradiobutton=val!;
                                               });
                                               if(val==6){
                                                 setState(() {
                                                   Selectedradiovalue.add("Signature");
                                                 });
                                               }
                                               else{
                                                 setState(() {
                                                   Selectedradiovalue.remove("Signature");
                                                 });

                                               }

                                             }),
                                         Container(
                                           height:height/18.9,
                                           width:width/1.44,
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey.shade300
                                                   )
                                               )
                                           ),
                                           child: Padding(
                                             padding:  EdgeInsets.only(top:height/63),
                                             child: Text("Signature",
                                               textAlign: TextAlign.start,
                                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                                   fontSize:width/25,
                                                   color: Colors.black),),
                                           ),
                                         ),


                                       ],
                                     ),






                                   ],
                                 ),
                               ),



                               ///Name
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Correct Name *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                         ],
                                         controller: corerctnamecontroller,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type full name",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///Father name
                               SizedBox(
                                 height:height/6.048,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Correct Father Name *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height: height/151.2,),
                                     Text(Fathercondtiontxt,
                                       textAlign: TextAlign.start,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/40,
                                           color: Colors.black),),
                                     SizedBox(height: height/151.2,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                         ],
                                         controller: corerctfathernamecontroller,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type father name",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),

                               ///Date of birth
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Date of Birth *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         readOnly: true,
                                         controller: corerctdobcontroller,
                                         onTap: (){
                                           Datepickerfunction(context);
                                         },
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type date of birth",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),

                               ///Gender
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Gender *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child:  DropdownButtonHideUnderline(
                                         child: DropdownButtonFormField2<String>(

                                           isExpanded: true,
                                           hint: Text(
                                             'Select Gender',
                                             style: GoogleFonts.poppins(
                                               fontSize:width/25.714,
                                               color: Theme.of(context).hintColor,
                                             ),
                                           ),
                                           items: Gender
                                               .map((String item) => DropdownMenuItem<String>(
                                             value: item,
                                             child: Text(
                                               item,
                                               style:  GoogleFonts.poppins(
                                                 fontSize:width/25.714,
                                               ),
                                             ),
                                           ))
                                               .toList(),
                                           value: selectedValuegender,
                                           validator: (value) => value=="Select Gender" ? 'Field is required' : null,
                                           onChanged: (String? value) {
                                             setState(() {
                                               selectedValuegender = value!;
                                             });

                                           },
                                           buttonStyleData:  ButtonStyleData(
                                             padding: EdgeInsets.symmetric(horizontal: 16),
                                             height:height/18.9,
                                             width: width/2.571,
                                           ),
                                           menuItemStyleData:  MenuItemStyleData(
                                             height:height/18.9,
                                           ),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///Name of Promise
                               SizedBox(
                                 height:height/6.048,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Name  Promises/Building/\nVillage/Town *",
                                       textAlign: TextAlign.start,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLines: null,
                                         controller: corerctnameandvillagecontroller,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type Village and more",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),

                               ///Road and more
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Road/Street/Lane/Post Office *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLines: null,
                                         controller: corerctaddresscontroller,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type road and more",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///District
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("District *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLines: 1,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                                         ],
                                         controller: corerctdistrictcontroller,
                                         keyboardType: TextInputType.name,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type District",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///State
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("State *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLines: 1,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                                         ],
                                         controller: corerctstatecontroller,
                                         decoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type State name",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),


                               ///Pin code
                               SizedBox(
                                 height:height/7.56,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Pin Code *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLength: 6,
                                         maxLines: 1,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                         ],
                                         keyboardType:TextInputType.number,
                                         controller: corerctpincodecontroller,
                                         decoration: InputDecoration(
                                             counterText: "",
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type pin code",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),

                               ///Phone number(Optiinally)
                               SizedBox(
                                 height:130,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Phone Number(Optionally) *",
                                       textAlign: TextAlign.center,
                                       style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/22,
                                           color: Colors.black),),
                                     SizedBox(height:height/75.6,),
                                     Container(
                                       height:height/15.12,
                                       width:width/1.2,
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                           border: Border.all(
                                               color: Color(0xff353535)
                                           )
                                       ),
                                       child: TextFormField(
                                         textCapitalization: TextCapitalization.characters,
                                         maxLength: 10,
                                         maxLines: 1,
                                         inputFormatters: [
                                           FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                         ],
                                         keyboardType:TextInputType.number,
                                         controller: corerctphonenumbercontroller,
                                         decoration: InputDecoration(
                                             counterText: "",
                                             contentPadding: EdgeInsets.only(left:width/18),
                                             border: InputBorder.none,
                                             hintText: "Type phone number",
                                             hintStyle: GoogleFonts.poppins()
                                         ),
                                         validator: (value) => value!.isEmpty ? 'Field is required' : null,

                                       ),
                                     )
                                   ],
                                 ),
                               ),

                             ]),
                       ),
                     ),
                   ):
                   steppervalue==1?
                   SingleChildScrollView(
                     physics: BouncingScrollPhysics(),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [



                         SizedBox(height: height/47.25,),

                         Text("Upload Documents",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                               fontSize:width/22,
                               color: Colors.black),),
                         SizedBox(height: height/47.25,),
                         Padding(
                           padding:  EdgeInsets.only(left: width/14.4),
                           child: Row(
                             children: [
                               Text("2.Photo Upload",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/28,
                                     color: Colors.black),),
                             ],
                           ),
                         ),
                         SizedBox(height: height/47.25,),

                         GestureDetector(
                           onTap: (){

                             showDialog(context: context, builder: (context) {
                               return
                                 Padding(
                                   padding: EdgeInsets.only(top: 220, bottom: 220),
                                   child: AlertDialog(
                                     title: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Please Select the Options", style: TextStyle(
                                             fontWeight: FontWeight.w700, fontSize: 15),),
                                       ],
                                     ),
                                     content: Column(
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(leading: Icon(Icons.camera),
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.camera)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo1 = File(value.path);
                                                   });
                                                   print(_photo1);
                                                   print("sssssssssssssssssssssssssssssssssssssssssssssss");
                                                   print(_photo1);
                                                   Navigator.pop(context);
                                                 }
                                               });
                                               setState((){});
                                             },
                                             title:
                                             Text("Camera",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),
                                         SizedBox(height: 10),

                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.gallery)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo1 = File(value.path);
                                                   });
                                                   setState((){});
                                                   Navigator.pop(context);
                                                 }
                                               });
                                             },
                                             leading: Icon(Icons.browse_gallery),
                                             title: Text("Gallery",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),

                                       ],
                                     ),
                                   ),
                                 );

                             },);

                           },
                           child: Container(
                             height: height/7.56,
                             width: width/1.125,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Color(0xffFFFFFF),

                             ),

                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [

                                   _photo1==null? Image.asset(Uploaddocimg):Image.file(_photo1!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                   _photo1==null?
                                   Text("Upload File",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                         fontSize:width/26,
                                         color: Colors.black),):Text(""),

                                 ]),
                           ),
                         ),
                         SizedBox(height: height/47.25,),

                         Container(
                           height: height/4.2,
                           width: width/1.125,
                           padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Color(0xffFFFFFF)
                           ),

                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("! Note:",
                                   textAlign: TextAlign.center,
                                   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                       fontSize:width/26,
                                       color: Colors.black),),
                                 Divider(),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.circle,size: width/24,),
                                     SizedBox(width: width/72,),
                                     SizedBox(
                                       width: width/1.290,
                                       child: Text("Images Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/28,
                                           color: Colors.black)),
                                     )
                                   ],
                                 ),
                                 SizedBox(height: height/151.2,),
                                 // Row(
                                 //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 //   crossAxisAlignment: CrossAxisAlignment.start,
                                 //   children: [
                                 //     Icon(Icons.circle,size: width/24,),
                                 //     SizedBox(width: width/72,),
                                 //     SizedBox(
                                 //       width: width/1.290,
                                 //       child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                 //           fontSize:width/28,
                                 //           color: Colors.black)),
                                 //     )
                                 //   ],
                                 // ),

                               ]),
                         ),

                         SizedBox(height: height/47.25,),


                       ],
                     ),
                   ):
                   steppervalue==2?
                   SingleChildScrollView(
                     physics: BouncingScrollPhysics(),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SizedBox(height: height/47.25,),

                         Text("Upload Documents",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                               fontSize:width/22,
                               color: Colors.black),),

                         SizedBox(height: height/47.25,),
                         Padding(
                           padding:  EdgeInsets.only(left: width/14.4),
                           child: Row(
                             children: [
                               Text("3.Signature Upload",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/28,
                                     color: Colors.black),),
                             ],
                           ),
                         ),
                         SizedBox(height: height/47.25,),

                         GestureDetector(
                           onTap: (){

                             showDialog(context: context, builder: (context) {
                               return
                                 Padding(
                                   padding: EdgeInsets.only(top: 220, bottom: 220),
                                   child: AlertDialog(
                                     title: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Please Select the Options", style: TextStyle(
                                             fontWeight: FontWeight.w700, fontSize: 15),),
                                       ],
                                     ),
                                     content: Column(
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(leading: Icon(Icons.camera),
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.camera)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo2 = File(value.path);
                                                   });
                                                   print(_photo2);
                                                   print("sssssssssssssssssssssssssssssssssssssssssssssss");
                                                   print(_photo2);
                                                   Navigator.pop(context);
                                                 }
                                               });
                                               setState((){});
                                             },
                                             title:
                                             Text("Camera",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),
                                         SizedBox(height: 10),

                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.gallery)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo2 = File(value.path);
                                                   });
                                                   setState((){});
                                                   Navigator.pop(context);
                                                 }
                                               });
                                             },
                                             leading: Icon(Icons.browse_gallery),
                                             title: Text("Gallery",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),

                                       ],
                                     ),
                                   ),
                                 );

                             },);

                           },
                           child: Container(
                             height: height/7.56,
                             width: width/1.125,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color: Color(0xffFFFFFF)
                             ),

                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [

                                   _photo2==null? Image.asset(Uploaddocimg):Image.file(_photo2!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                   _photo2==null?
                                   Text("Upload File",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                         fontSize:width/26,
                                         color: Colors.black),):Text(""),



                                 ]),
                           ),
                         ),
                         SizedBox(height: height/47.25,),
                         Container(
                           height: height/4.2,
                           width: width/1.125,
                           padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Color(0xffFFFFFF)
                           ),

                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("! Note:",
                                   textAlign: TextAlign.center,
                                   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                       fontSize:width/26,
                                       color: Colors.black),),
                                 Divider(),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.circle,size: width/24,),
                                     SizedBox(width: width/72,),
                                     SizedBox(
                                       width: width/1.290,
                                       child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/28,
                                           color: Colors.black)),
                                     )
                                   ],
                                 ),
                                 SizedBox(height: height/151.2,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.circle,size: width/24,),
                                     SizedBox(width: width/72,),
                                     SizedBox(
                                       width: width/1.290,
                                       child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/28,
                                           color: Colors.black)),
                                     )
                                   ],
                                 ),

                               ]),
                         ),

                         SizedBox(height: height/47.25,),


                       ],
                     ),
                   ):
                   steppervalue==3?
                   SingleChildScrollView(
                     physics: BouncingScrollPhysics(),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [

                         SizedBox(height: height/47.25,),

                         Text("Upload Documents",
                           textAlign: TextAlign.center,
                           style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                               fontSize:width/22,
                               color: Colors.black),),
                         SizedBox(height: height/47.25,),
                         Padding(
                           padding:  EdgeInsets.only(left: width/14.4),
                           child: Row(
                             children: [
                               Text("4.Aadhaar Card Upload",
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                     fontSize:width/28,
                                     color: Colors.black),),
                             ],
                           ),
                         ),
                         SizedBox(height: height/47.25,),

                         //front page
                         Padding(
                           padding:  EdgeInsets.only(left: width/14.4),
                           child: Row(
                             children: [
                               Text("Front Side Of Aadhaar Card" ,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/28,
                                   color: Colors.black),),
                             ],
                           ),
                         ),
                         SizedBox(height: height/107.25,),
                         GestureDetector(
                           onTap: (){

                             showDialog(context: context, builder: (context) {
                               return
                                 Padding(
                                   padding: EdgeInsets.only(top: 220, bottom: 220),
                                   child: AlertDialog(
                                     title: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Please Select the Options", style: TextStyle(
                                             fontWeight: FontWeight.w700, fontSize: 15),),
                                       ],
                                     ),
                                     content: Column(
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(leading: Icon(Icons.camera),
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.camera)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo3 = File(value.path);
                                                   });
                                                   print(_photo3);
                                                   print("sssssssssssssssssssssssssssssssssssssssssssssss");
                                                   print(_photo1);
                                                   Navigator.pop(context);
                                                 }
                                               });
                                               setState((){});
                                             },
                                             title:
                                             Text("Camera",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),
                                         SizedBox(height: 10),

                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.gallery)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo3 = File(value.path);
                                                   });
                                                   setState((){});
                                                   Navigator.pop(context);
                                                 }
                                               });
                                             },
                                             leading: Icon(Icons.browse_gallery),
                                             title: Text("Gallery",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),

                                       ],
                                     ),
                                   ),
                                 );

                             },);

                           },
                           child: Container(
                             height: height/7.56,
                             width: width/1.125,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color: Color(0xffFFFFFF)
                             ),

                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [

                                   _photo3==null? Image.asset(Uploaddocimg):Image.file(_photo3!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                   _photo3==null?
                                   Text("Upload File",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                         fontSize:width/26,
                                         color: Colors.black),):Text(""),


                                 ]),
                           ),
                         ),
                         SizedBox(height: height/47.25,),

                         ///back page
                         Padding(
                           padding:  EdgeInsets.only(left: width/14.4),
                           child: Row(
                             children: [
                               Text("Back Side Of Aadhaar Card", style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/28,
                                   color: Colors.black),),
                             ],
                           ),
                         ),
                         SizedBox(height: height/107.25,),
                         GestureDetector(
                           onTap: (){

                             showDialog(context: context, builder: (context) {
                               return
                                 Padding(
                                   padding: EdgeInsets.only(top: 220, bottom: 220),
                                   child: AlertDialog(
                                     title: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text("Please Select the Options", style: TextStyle(
                                             fontWeight: FontWeight.w700, fontSize: 15),),
                                       ],
                                     ),
                                     content: Column(
                                       children: [
                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(leading: Icon(Icons.camera),
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.camera)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo4 = File(value.path);
                                                   });
                                                   print(_photo4);
                                                   print("sssssssssssssssssssssssssssssssssssssssssssssss");
                                                   print(_photo4);
                                                   Navigator.pop(context);
                                                 }
                                               });
                                               setState((){});
                                             },
                                             title:
                                             Text("Camera",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),
                                         SizedBox(height: 10),

                                         Container(
                                           decoration: BoxDecoration(
                                               color: Colors.grey.shade300,
                                               borderRadius: BorderRadius.circular(8)
                                           ),
                                           child: ListTile(
                                             onTap: () async {
                                               final picker = ImagePicker();
                                               await picker.pickImage(source: ImageSource.gallery)
                                                   .then((value) {
                                                 if (value != null) {
                                                   setState(() {
                                                     _photo4 = File(value.path);
                                                   });

                                                   Navigator.pop(context);

                                                 }
                                               });
                                               setState((){});
                                             },
                                             leading: Icon(Icons.browse_gallery),
                                             title: Text("Gallery",
                                               style: TextStyle(fontWeight: FontWeight.w700),),),
                                         ),

                                       ],
                                     ),
                                   ),
                                 );

                             },);

                           },
                           child: Container(
                             height: height/7.56,
                             width: width/1.125,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color: Color(0xffFFFFFF)
                             ),

                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [

                                   _photo4==null? Image.asset(Uploaddocimg):Image.file(_photo4!,height: height/9.45,width: width/4.5,fit: BoxFit.cover,),

                                   _photo4==null?
                                   Text("Upload File",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                         fontSize:width/26,
                                         color: Colors.black),):Text(""),


                                 ]),
                           ),
                         ),
                         SizedBox(height: height/47.25,),
                         Container(
                           height: height/4.2,
                           width: width/1.125,
                           padding: EdgeInsets.symmetric(horizontal: width/36.0,vertical: height/75.6),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Color(0xffFFFFFF)
                           ),

                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("! Note:",
                                   textAlign: TextAlign.center,
                                   style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                       fontSize:width/26,
                                       color: Colors.black),),
                                 Divider(),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.circle,size: width/24,),
                                     SizedBox(width: width/72,),
                                     SizedBox(
                                       width: width/1.290,
                                       child: Text("Images Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/28,
                                           color: Colors.black)),
                                     )
                                   ],
                                 ),
                                 SizedBox(height: height/151.2,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Icon(Icons.circle,size: width/24,),
                                     SizedBox(width: width/72,),
                                     SizedBox(
                                       width: width/1.290,
                                       child: Text("Please Correct the Edge to Upload Image",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                           fontSize:width/28,
                                           color: Colors.black)),
                                     )
                                   ],
                                 ),

                               ]),
                         ),

                         SizedBox(height: height/47.25,),



                       ],
                     ),
                   ):
                   steppervalue==4?
                   SizedBox(
                       child:Column(
                         children: [
                           Padding(
                             padding:  EdgeInsets.symmetric(
                                 vertical: height/94.5,
                                 horizontal: width/45
                             ),
                             child: Container(
                               height:height/2.52,
                               width:width/1.090,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(8),
                                   color: Color(0xffffe09f)
                               ),
                               padding: EdgeInsets.only(left: width/36.0,right: width/36.0,top: height/37.8,bottom: height/37.8),
                               child: SingleChildScrollView(
                                 physics: const BouncingScrollPhysics(),
                                 child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [

                                       Text("Total Amount",style: GoogleFonts.poppins(fontWeight:FontWeight.w600),),
                                       Text("₹ ${Total.toString()}",
                                         style: GoogleFonts.poppins(fontWeight:FontWeight.w600,
                                           fontSize: width/16.363,

                                         ),),

                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Container(
                                             height:height/378,
                                             width:width/1.8,
                                             color: Colors.grey,
                                           ),
                                           Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)

                                         ],
                                       ),

                                       Text("Payment Now for new PAN Card Application",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),),
                                       SizedBox(height:height/75.6),
                                       Row(
                                         children: [
                                           Container(
                                               height: height/37.8,
                                               width: width/1.636,
                                               child: Text("Normal Fees :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                           Container(
                                               height: height/37.8,
                                               width: width/4.5,

                                               child: Text("₹ ${normal_fees.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                               height: height/37.8,
                                               width: width/1.636,

                                               child: Text("GST :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                           Container(
                                               height: height/37.8,
                                               width: width/4.5,

                                               child: Text("₹ ${Gst.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                         ],
                                       ),
                                       Divider(color: Colors.black,),

                                       Row(
                                         children: [
                                           Container(
                                               height: height/37.8,
                                               width: width/1.636,

                                               child: Text("Total Fees :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                           Container(
                                               height: height/37.8,
                                               width: width/4.5,

                                               child: Text("₹ ${Total.toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                               height: height/37.8,
                                               width: width/1.636,

                                               child: Text("You have wallet : (${widget.UserWalletamount.toString()}) ",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                           Container(
                                               height: height/37.8,
                                               width: width/4.5,

                                               child: Text("₹ -${payableamount().toString()}",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                         ],
                                       ),
                                       Divider(color: Colors.black,),
                                       Row(
                                         children: [
                                           Container(
                                               height: height/37.8,
                                               width: width/1.636,

                                               child: Text("Payable amount :",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),
                                           SizedBox(
                                               height: height/37.8,
                                               width: width/4.5,
                                               child: Text(

                                                 widget.UserWalletamount==0?
                                                 "₹ ${Total.toString()}":"₹ 0.00",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: width/27.69,),)),

                                         ],
                                       ),




                                     ]),

                               ),
                             ),
                           ),
                           SizedBox(height: height/25.2,),


                         ],
                       )
                   ):
                   const SizedBox(),
                 ),



                 SizedBox(height: height/151.2),



                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     steppervalue>0?
                     GestureDetector(
                       onTap: (){

                         if(steppervalue>0){
                           setState(() {
                             steppervalue--;
                           });
                         }

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
                             child:  Text("Previous",
                               textAlign: TextAlign.center,
                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/28,
                                   color: Colors.white),),
                           ),
                         ),
                       ),
                     ):SizedBox(
                       height: height/21.6,
                       width: width/4.5,),
                     SizedBox(width: width/7.2,),

                     steppervalue==4?
                     GestureDetector(
                       onTap: () async {
                         if (_formKey.currentState!.validate()&&Selectedradiovalue.isNotEmpty
                             &&corerctpincodecontroller.text.length==6&&corerctphonenumbercontroller.length==10
                         &&_photo1!=null&&_photo2!=null&&_photo3!=null&&_photo4!=null) {

                           await FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).get().then((value){
                             if(value['walletamount']>157){
                               setState(() {
                                 Loading=true;
                               });
                               firebasestroragefunctionphoto();
                               firebasestroragefunctionsign();
                               firebasestroragefunctionaadharcard();
                             }
                             else{
                               lesspaymenterrorpopup();
                             }

                           });
                         }
                         else{
                           Fielderrorpopup();
                         }

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
                             child:  Text("Submit",
                               textAlign: TextAlign.center,
                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/28,
                                   color: Colors.white),),
                           ),
                         ),
                       ),
                     ):
                     GestureDetector(
                       onTap: (){

                         if(_formKey.currentState!.validate()&& selectedValuegender!="Select Gender"&&
                             corerctpincodecontroller.text.length==6&&
                             Pannumbercontroller.text.length==10&&aadhaarontroller.text.length==14){
                           if(steppervalue<4) {
                             setState(() {
                               steppervalue++;
                             });
                           }
                           if(steppervalue==4){
                             paymentfunction();
                           }
                           print(steppervalue);
                         }


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
                             child:  Text("Next",
                               textAlign: TextAlign.center,
                               style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                   fontSize:width/28,
                                   color: Colors.white),),
                           ),
                         ),
                       ),
                     )
                   ],
                 ),


               ],
             ),
           ),
         ),

         Loading==true?
         Container(
           height:160,
           width:160,
           decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(8)
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Please Wait...",
                 textAlign: TextAlign.center,
                 style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                     fontSize:width/22,
                     color: Colors.black),),
               SizedBox(height:10),
               CircularProgressIndicator(
                 color: Color(0xff263646),
                 strokeWidth: 5,
               ),
             ],
           ),
         )
             :const SizedBox()



       ],
     )
    );
  }

  Datepickerfunction(ctx) async {
    DateTime? pickedDate = await showDatePicker(
        context: ctx,
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        initialDate: DateTime.now(),
        fieldHintText: "enter your date of birthday",
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              colorScheme: ColorScheme.light(
                  primary: Color(0xff245BCA),
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??Text(""),
          );
        }
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      corerctdobcontroller.text =formattedDate;
    }
  }


  lesspaymenterrorpopup() {
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: height/75.2,),
                      Text(
                        'Warning.....!',
                        style: GoogleFonts.poppins(
                            fontSize: width / 23.613,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(

                        children: [
                          SizedBox(width:width/4.5),
                          Lottie.asset(Errrorlottie,fit: BoxFit.cover,height: height/7.3,width: width/6),
                        ],
                      ),
                      SizedBox(height: height/75.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width:width/1.525,
                            child:
                            Text(
                              'Your Balance is Low Kindly Recharge Wallet Minimum Recharge Rs: 500',
                              style: GoogleFonts.poppins(
                                  fontSize: width / 28.613,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height/22.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //okay button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/19.6,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff245BCA),
                                        Color(0xff245BCA),
                                      ]
                                  ),
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


  _uploadImage() async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo1 = File(value.path);
        });
      }
    });
  }

  _uploadImage2() async {

    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo2 = File(value.path);
        });
      }
    });
  }

  _uploadImage3() async {

    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo3 = File(value.path);
        });
      }
    });
  }

  _uploadImage4() async {

    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value){
      if (value != null) {
        setState(() {
          _photo4 = File(value.path);
        });
      }
    });
  }

  firebasestroragefunctionphoto() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo1.jpg");
    var uploadTask = await ref.putFile(_photo1!).catchError((error) async {

    });
    var image = await uploadTask.ref.getDownloadURL();
    setState(() {
      imageUrl=image;
    });

  }

  firebasestroragefunctionsign() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo2.jpg");
    var uploadTask = await ref.putFile(_photo2!).catchError((error) async {

    });
    var image2 = await uploadTask.ref.getDownloadURL();
    setState(() {
      imageUrl2=image2;
    });

  }

  firebasestroragefunctionaadharcard() async {
    var ref = FirebaseStorage.instance.ref().child('Images').child("$_photo3.jpg");
    var uploadTask = await ref.putFile(_photo3!).catchError((error) async {

    });
    var image3 = await uploadTask.ref.getDownloadURL();

    var ref1 = FirebaseStorage.instance.ref().child('Images').child("$_photo4.jpg");
    var uploadTask1 = await ref1.putFile(_photo4!).catchError((error) async {

    });
    var image4 = await uploadTask1.ref.getDownloadURL();
    setState(() {
      imageUrl4=image4;
    });
    correctionpancardfunction();
  }


  correctionpancardfunction() async {

    FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).get().then((value){
      if(value['usertype']=="Individual"){
        if(value['usageccount']<3){
          FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
            "usageccount":FieldValue.increment(1),
            "walletamount":FieldValue.increment(-Total),
          });
          FirebaseFirestore.instance.collection("Correction_cards").doc().set({
            "pancardno":Pannumbercontroller.text,
            "aadhaarcardno":aadhaarontroller.text,
            "correctionupdate":Selectedradiovalue,
            "Crtname":corerctnamecontroller.text,
            "crtfathername":corerctfathernamecontroller.text,
            "crtdate_of_birth":corerctdobcontroller.text,
            "crgender":selectedValuegender,
            "crtnameandbuildsno":corerctnameandvillagecontroller.text,
            "crtnadddress":corerctaddresscontroller.text,
            "crtdistrict":corerctdistrictcontroller.text,
            "crtstate":corerctstatecontroller.text,
            "crtpincode":corerctpincodecontroller.text,
            "crtphonenumber":corerctphonenumbercontroller.text,
            "usertype":widget.UserType,
            "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "time":DateFormat('hh:mm a').format(DateTime.now()),
            "timestamp":DateTime.now().millisecondsSinceEpoch
          });

          FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Histroy").doc().set({
            "pancardno":Pannumbercontroller.text,
            "aadhaarcardno":aadhaarontroller.text,
            "correctionupdate":Selectedradiovalue,
            "Crtname":corerctnamecontroller.text,
            "crtfathername":corerctfathernamecontroller.text,
            "crtdate_of_birth":corerctdobcontroller.text,
            "crgender":selectedValuegender,
            "crtnameandbuildsno":corerctnameandvillagecontroller.text,
            "crtnadddress":corerctaddresscontroller.text,
            "crtdistrict":corerctdistrictcontroller.text,
            "crtstate":corerctstatecontroller.text,
            "crtpincode":corerctpincodecontroller.text,
            "crtphonenumber":corerctphonenumbercontroller.text,
            "updatestatus":"",
            "Type":"Correction",
            "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
            "time":DateFormat('hh:mm a').format(DateTime.now()),
            "timestamp":DateTime.now().millisecondsSinceEpoch
          });


          Succespopup();
          clearcontrollers();
        }
        else{
          planExitpopup();
        }
      }

      else{
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).update({
          "usageccount":FieldValue.increment(1),
          "walletamount":FieldValue.increment(-Total),
        });
        FirebaseFirestore.instance.collection("Correction_cards").doc().set({
          "pancardno":Pannumbercontroller.text,
          "aadhaarcardno":aadhaarontroller.text,
          "correctionupdate":Selectedradiovalue,
          "Crtname":corerctnamecontroller.text,
          "crtfathername":corerctfathernamecontroller.text,
          "crtdate_of_birth":corerctdobcontroller.text,
          "crgender":selectedValuegender,
          "crtnameandbuildsno":corerctnameandvillagecontroller.text,
          "crtnadddress":corerctaddresscontroller.text,
          "crtdistrict":corerctdistrictcontroller.text,
          "crtstate":corerctstatecontroller.text,
          "crtpincode":corerctpincodecontroller.text,
          "usertype":widget.UserType,
          "crtphoto":imageUrl,
          "crtsignpicture":imageUrl2,
          "crtaadharpicture":imageUrl3,
          "crtaadharpicture2":imageUrl4,
          "crtphonenumber":corerctphonenumbercontroller.text,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });
        FirebaseFirestore.instance..collection("Users").doc(widget.Userdocid).collection("Histroy").doc().set({
          "pancardno":Pannumbercontroller.text,
          "aadhaarcardno":aadhaarontroller.text,
          "correctionupdate":Selectedradiovalue,
          "Crtname":corerctnamecontroller.text,
          "crtfathername":corerctfathernamecontroller.text,
          "crtdate_of_birth":corerctdobcontroller.text,
          "crgender":selectedValuegender,
          "crtnameandbuildsno":corerctnameandvillagecontroller.text,
          "crtnadddress":corerctaddresscontroller.text,
          "crtdistrict":corerctdistrictcontroller.text,
          "crtstate":corerctstatecontroller.text,
          "crtpincode":corerctpincodecontroller.text,
          "crtphoto":imageUrl,
          "crtsignpicture":imageUrl2,
          "crtaadharpicture":imageUrl3,
          "crtaadharpicture2":imageUrl4,
          "updatestatus":"",
          "Type":"Correction",
          "crtphonenumber":corerctphonenumbercontroller.text,
          "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
          "time":DateFormat('hh:mm a').format(DateTime.now()),
          "timestamp":DateTime.now().millisecondsSinceEpoch
        });


        Succespopup();
        clearcontrollers();
      }

    });



  }

  clearcontrollers(){
    setState(() {
       Pannumbercontroller.clear();
       aadhaarontroller.clear();
       corerctnamecontroller.clear();
       corerctfathernamecontroller.clear();
       corerctdobcontroller.clear();
       corerctnameandvillagecontroller.clear();
       corerctaddresscontroller.clear();
       corerctdistrictcontroller.clear();
       corerctstatecontroller.clear();
       corerctpincodecontroller.clear();
       corerctphonenumbercontroller.clear();
        nameradiobutton=0;
        fathernameradiobutton=0;
        dobradiobutton=0;
        addressradiobutton=0;
        photoradiobutton=0;
        signatureradiobutton=0;
        selectedValuegender='Select Gender';
    });
  }

  paymentfunction(){
    if(double.parse(widget.UserWalletamount.toString())>156){
      setState(() {
        normal_fees=250;
        Gst=(18/100)*normal_fees;
        Total=normal_fees+Gst;
      });
    }
    else{
      setState(() {
        Total=0;
      });
    }
    print(normal_fees);
    print(Gst);

  }


  payableamount(){
    if(double.parse(widget.UserWalletamount.toString())>156){
      return ( double.parse(widget.UserWalletamount.toString())-Total);
    }
    else{
      return 0;
    }

  }

  Succespopup() {
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
                      SizedBox(height: height/25.2,),

                      SizedBox(
                        height: height/7.56,
                        width: width/3.60,
                        child: Lottie.network(
                            "https://assets8.lottiefiles.com/private_files/lf30_nsqfzxxx.json"),
                      ),
                      SizedBox(height: height/75.6,),

                      Text(
                        "Submit Successfully....",
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
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Color(0xff245BCA),
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
                              height: height/21.6,
                              width: width/4.5,
                              decoration: BoxDecoration(
                                  color: Color(0xff245BCA),
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

  Fielderrorpopup() {
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: height/75.2,),
                      Text(
                        'Warning.....!',
                        style: GoogleFonts.poppins(
                            fontSize: width / 23.613,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Row(

                        children: [
                          SizedBox(width:width/4.5),
                          Lottie.asset(Errrorlottie,fit: BoxFit.cover,height: height/7.3,width: width/6),
                        ],
                      ),
                      SizedBox(height: height/75.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width:width/1.525,
                            child:
                            Text(
                              'Please Fill the All Fields And Images',
                              style: GoogleFonts.poppins(
                                  fontSize: width / 28.613,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height/22.6,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //okay button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height/19.6,
                              width: width/4.2,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff245BCA),
                                        Color(0xff245BCA),
                                      ]
                                  ),
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


}
