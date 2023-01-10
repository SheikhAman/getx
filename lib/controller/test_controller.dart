import '../services/base_client.dart';
import 'base_controller.dart';

class TestController with BaseController {
  // get // fetch data
  void getData() async {
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/1')
        .catchError(handleError);
    // if (response == null) return;
    print(response.toString());
  }

// post // insert data
  void postData() async {
    var request = {'message': 'Code Sucks'};
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', request)
        .catchError(handleError);
    if (response == null) return;
    print(response.toString());
  }

// put // update  data
  void putData() async {
    var request = {'body': 'Sheikh Aman'};
    var response = await BaseClient()
        // put er khetre id pass kora lage akhane id 1
        .put('https://jsonplaceholder.typicode.com', '/posts/1', request)
        .catchError(handleError);
    if (response == null) return;
    print(response.toString());
  }

  // delete data
  void deleteData() async {
    var request = {'body': 'Sheikh Aman'};
    var response = await BaseClient()
        // delete er khetre id pass kora lage akhane id 1
        .delete('https://jsonplaceholder.typicode.com', '/posts/1')
        .catchError(handleError);
    if (response == null) return;
    print(response.toString());
  }
}
