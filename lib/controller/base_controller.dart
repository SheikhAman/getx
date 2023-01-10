import 'package:getx/helper/dialog_helper.dart';
import 'package:getx/services/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
// Show dialog
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to respond.');
    }
  }
}
