import '../models/Update_info.dart';
import '../web_services/web_service_update.dart';

class UpdateRebo {
  final WebServiceUpdate webServiceUpdate;

  UpdateRebo(this.webServiceUpdate);

  Future<Update_response> getUpdateresponse(
      String token, String name, String email, String image) async {
   return await webServiceUpdate.getUpdateresponse(token: token, name: name, email: email, image: image);
  }
}
