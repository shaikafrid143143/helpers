import 'package:requests/requests.dart';
class updateField{
  String email;
  String key;
  String value;
  updateField({
  required this.email,
  required this.key,
  required this.value,
  });
  Future<dynamic> update() async{
    String url = "https://ameerunisatailors.cyclic.cloud/updateParam";
    var server = await Requests.patch(url,json: {
      "email":email,
      "key":key,
      "value":value
    });
    dynamic responseFromServer = server.json();
    switch([responseFromServer["message"]]){
      case "updateCompleted":
        return "updateCompleted";
        break;
      case "wrongKey":
        return "enteredWrongKey";
        break;
      case "updateError":
        return "updateFailed";
        break;
      case "userNotFound":
        return "userNotFound";
        break;     
      default:
        return "someThingWentWrong";
    }
  }
}