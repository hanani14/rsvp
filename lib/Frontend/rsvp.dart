// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rsvp/API/rsvp_api.dart';
import 'package:rsvp/Global_Function/global.dart';
import 'package:rsvp/Global_Function/separator.dart';
import 'package:rsvp/Global_Function/text_style_global.dart';

class RSVPLanding extends StatefulWidget {
  const RSVPLanding({super.key});

  @override
  State<RSVPLanding> createState() => _RSVPLandingState();
}

class _RSVPLandingState extends State<RSVPLanding> {
  final nameForms = TextEditingController();
  final lastnameForms = TextEditingController();
  final phoneForm = TextEditingController();
  final emailAddForm = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

@override
  void dispose() {
    // TODO: implement dispose
    nameForms.dispose();
    lastnameForms.dispose();
    phoneForm.dispose();
    emailAddForm.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container( 
                height:Adaptive.h(40) ,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                ),
                 Positioned(child: 
                  Padding(
                    padding:  EdgeInsets.only(top:Adaptive.h(8)),
                    child: Column(
                      children: [
                        Text('RSVP FORM',style: TextStyleGlobal().cResponsive(context, 22, Colors.white, FontWeight.w700, null),),
                        Separator().heightSeperator(Adaptive.px(20)),
                        Row(children: [
                          Container(height: Adaptive.h(8),
                          width: Adaptive.w(50),
                            decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.white,width: 3.0,)),
                            ),),
                        ],),
                        Separator().heightSeperator(Adaptive.w(2)),
                        Text('Kindly respond by February 01, 2025',style: TextStyleGlobal().cResponsive(context, 19, Colors.white, FontWeight.w500, null),),
                        Text('We look forward to celebrate with you',style: TextStyleGlobal().cResponsive(context, 14, Colors.white, FontWeight.normal, null),),
                        Separator().heightSeperator(Adaptive.w(6)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                            color: const Color(0xFFD3D7C9).withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                            ),]
                          ),
                          width: Adaptive.w(85),
                          padding: const EdgeInsets.fromLTRB(20,30,20,30),
                          child:  Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                              Text('Please enter all the field',style: TextStyleGlobal().cResponsive(context, 14, const Color.fromRGBO(0, 166, 184, 100), FontWeight.bold, null),),
                              Separator().heightSeperator(Adaptive.h(3)),
                              textTiltle('First Name',),
                              nameForm(),
                              Separator().heightSeperator(Adaptive.h(3)),
                              textTiltle('Last Name',),
                              lastnameForm(),
                              Separator().heightSeperator(Adaptive.h(3)),
                              textTiltle('Contact Number',),
                              contactForm(),
                              Separator().heightSeperator(Adaptive.h(3)),
                              textTiltle('Email',),
                              emailForm(),
                            
                        ],),),
                        Separator().heightSeperator(Adaptive.h(3)),
                         ElevatedButton(
                          onPressed: ()async {
                            if (_formKey.currentState!.validate()) {
                              var res = await RSVPPI().submitrsvp(nameForms.text, lastnameForms.text, phoneForm.text, emailAddForm.text);
                              print('responseee $res');
                              if(res != "" ){
                                showdialogresponse(context, res);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(250 , 40),
                            backgroundColor: const Color.fromRGBO(0, 166, 184, 100)
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text("Submit", textAlign: TextAlign.center, style: TextStyleGlobal().btnText),
                          )),
                      ],

                    
                      
                    ),
                  )
                 
                ),
              
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showdialogresponse(BuildContext context, String res) {
    return showCupertinoDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                alignment: Alignment.center,
            title: Text('THANK YOU',style: TextStyleGlobal().cResponsive(context, 20,const Color.fromRGBO(0, 166, 184, 100), FontWeight.bold, null,),textAlign: TextAlign.center,),           
            content: Text('$res',textAlign: TextAlign.center,),  

              actions: [
              ElevatedButton(   
                style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250 , 40),
                          backgroundColor: const Color.fromRGBO(0, 166, 184, 100)
                        ),
                onPressed: () {
                  Navigator.pop(context);
                  resetController();
                },             
                child: Text('OK',style: TextStyleGlobal().cResponsive(context, 14,Colors.white, FontWeight.bold, null)),
              ),
              
            ],
          ),
                            );
  }

resetController(){
   nameForms.clear();
    lastnameForms.clear();
    phoneForm.clear();
    emailAddForm.clear();
}
  Widget nameForm() {
    return Container(
        child: TextFormField(
          validator: validateFirstName,
          key: const Key('name'),
          style: TextStyleGlobal().form1FontSize1,
          buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
          decoration: InputDecoration(
            hintText: "Enter First Name",
            isDense: true,
            prefixIconConstraints: const BoxConstraints(minWidth: 20, maxHeight: 30),
           
            hintStyle: TextStyleGlobal().form1FontSize2,
            labelStyle: const TextStyle(color: Color(0xFF424242)),
            focusColor: Colors.red,
            fillColor: const Color(0xFFFAFAFA),
            contentPadding: EdgeInsets.zero,
            errorStyle: TextStyle(color: Colors.grey[600]),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
            ),
          ),
          controller: nameForms,
        ));
  }

  Widget lastnameForm() {
    return TextFormField(
      validator: validateLastName,
      key: const Key('name'),
      style: TextStyleGlobal().form1FontSize1,
      buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
      decoration: InputDecoration(
        hintText: "Enter Last Name",
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 20, maxHeight: 30),
        hintStyle: TextStyleGlobal().form1FontSize2,
        labelStyle: const TextStyle(color: Color(0xFF424242)),
        focusColor: Colors.red,
        fillColor: const Color(0xFFFAFAFA),
        contentPadding: EdgeInsets.zero,
        errorStyle: TextStyle(color: Colors.grey[600]),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
      ),
      controller: lastnameForms,
    );
  }
  String? validateFirstName(String? value) {
    Pattern pattern2 = r'^[a-zA-Z ]+$';
    RegExp regExp = RegExp(pattern2.toString());
    bool regexStat = regExp.hasMatch(value ?? "");
    if (value != null && value.isEmpty) {
      return Global().emptyFieldErr;
    } else if (value != null && ((value.length < 3 && value.length > 0) || regexStat == false)) {
      return "Please enter a valid first name.";
    } else {
      return null;
    }
  }

  String? validateLastName(String? value) {
    Pattern pattern2 = r'^[a-zA-Z ]+$';
    RegExp regExp = RegExp(pattern2.toString());
    bool regexStat = regExp.hasMatch(value ?? "");
    if (value != null && value.isEmpty) {
      return Global().emptyFieldErr;
    } else if (value != null && ((value.length < 3 && value.length > 0) || regexStat == false)) {
      return "Please enter a valid first name.";
    } else {
      return null;
    }
  }

String? validatePhoneV2(String? value) {
    String pattern4 = r'[A-Za-z]+';
    RegExp alphabet = RegExp(pattern4);


    String pattern2 = Global().myPhone2;

    RegExp phone = RegExp( pattern2 );

      if (value != "") {
        if (phone.hasMatch(value ?? "") && !alphabet.hasMatch(value?? "")) {
         return "";
        }else if(alphabet.hasMatch(value?? "")){
          return 'Please insert valid contact number';
        }
         else {return null;}
      } else {
        return  Global().emptyFieldErr;
      }
    

  }

  Widget contactForm(){
   return  TextFormField(
     validator:validatePhoneV2,
     
     key: const Key('contact number'),
     style: TextStyleGlobal().form1FontSize1,
     buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
     decoration: InputDecoration(
       isDense: true,
       hintText: "Enter contact number",
       hintStyle: TextStyleGlobal().form1FontSize2,
       labelStyle: const TextStyle(color: Color(0xFF424242)),
       fillColor: const Color(0xFFFAFAFA),
       contentPadding: EdgeInsets.zero,
       errorMaxLines: 6,
       errorStyle: TextStyle(color: Colors.grey[600]),
       errorBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.grey[600]!),
       ),
       focusedErrorBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.grey[600]!),
       ),
     ),
     keyboardType: TextInputType.number,
     controller: phoneForm,
   );
  }


  String? validatePhoneTextField(String? value)  {
    Pattern pattern4 = r'[A-Za-z]+';
    RegExp alphabet = RegExp(pattern4.toString());

    Pattern pattern2 = Global().myPhone;
    RegExp phone = RegExp(pattern2.toString() );
    bool regexStat = phone.hasMatch(value ?? "");

      if (value != null && value != "") {
        if (phone.hasMatch(value) && !alphabet.hasMatch(value)) {
          return "Enter phone number eg. /'01xxxxxxxx'";
        } else if (!phone.hasMatch(value)) {
          return "Enter phone number eg. /'01xxxxxxxx'";
        }else{
          return null;
        }
      } else {
        return "";
      }

    // if (value != null && value.isEmpty) {
    //   return Global().emptyFieldErr;
    // } else if (value != null && ((value.length < 3 && value.length > 0) || regexStat == false)) {
    //   return "Please enter a valid contact number.";
    // } else {
    //   return null;
    // }
  }

   Widget emailForm() {
    return TextFormField(
      key: const Key('email'),
      style: TextStyleGlobal().form1FontSize1,
      validator: validateEmail,
      buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
      decoration: InputDecoration(
        hintText: "Enter Email",
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 30),
        
        hintStyle: TextStyleGlobal().form1FontSize2,
        labelStyle: const TextStyle(color: Color(0xFF424242)),
        focusColor: Colors.red,
        fillColor: const Color(0xFFFAFAFA),
        contentPadding: EdgeInsets.zero,
        errorMaxLines: 6,
        errorStyle: TextStyle(color: Colors.grey[600]),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]!),
        ),
      ),
      controller: emailAddForm,
      keyboardType: TextInputType.emailAddress,
    );
  }


  String? validateEmail(String? value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value != null && value.isEmpty) {
      return Global().emptyFieldErr;
    } else if (!regex.hasMatch(value ?? "")) {
      return "Please enter a valid email address.";
    } else {
      return null;
    }
  }

  Widget textTiltle(title){
    return Text('$title',style: TextStyleGlobal().cResponsive(context, 12, Colors.black45, FontWeight.bold, null));
  }
}