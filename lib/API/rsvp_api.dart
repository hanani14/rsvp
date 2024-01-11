import 'dart:convert';

import 'package:http/http.dart' as http;

class RSVPPI{
    Future<String> submitrsvp(firstname, lastname, contact, email) async {
      var res;
      String url = 'https://integration.micaresvc.com/interviewapi/AssessmentTestRSVP?FirstName=$firstname&LastName=$lastname&ContactNo=$contact&Email=$email&ApiKey=123456';
      try{
       final response= await http.get(Uri.parse(url), 

      //  body: {
      //     'FirstName': firstname ?? "",
      //     'LastName': lastname ?? "",
      //     'ContactNo': contact?? "",
      //     'Email':email ?? "",
      //   }
        );
        res = response.body;
              print('succs submit ${response.body}');

      }
      catch(e){
        print('error submit $e');
      }
      return res;
    }
}