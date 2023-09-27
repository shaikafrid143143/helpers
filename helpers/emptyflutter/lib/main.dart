import 'package:requests/requests.dart';


class addUser{


  String userName;
  String email;
  addUser({
    required this.userName,
    required this.email
  });

  Future<String> add() async{
    String url = "https://ameerunisatailors.cyclic.cloud/addUser/";
    var server = await Requests.post(url,json: {
      "userName":userName,
      "email":email
    });
    var responseFromServer = server.json();
    if(responseFromServer["message"] == "userCreated"){
      return "userCreated";

    }
    else if(responseFromServer["message"] == "emailIsNotValid"){
      return "emailIsNotValid";

    }
    else if(responseFromServer["message"] == "userAlreadyExists"){
      return "userAlreadyExists";

    }
    else if(responseFromServer["message"] == "failedToCreate"){
      return "failedTocreate";

    }
    
    
    return "someThingWentWrong";
   

  }

}


void main() async{
    print(await  addUser(userName: "",
    email: "afridayan01@gmail.com"
    
    ).add());

   
  
}

