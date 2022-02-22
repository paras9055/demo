import 'package:demo/repository/repository.dart';
import 'package:demo/screens/photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var photoProvider = ChangeNotifierProvider<PhotoChangeProvider>((_) => PhotoChangeProvider());

class PhotoChangeProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  bool isLoading = false;

  String? photoRes;

  void isLoadingFun(bool tru) {
    if (tru) {
      isLoading = true;
    } else {
      isLoading = false;
    }
    notifyListeners();
  }

  void fetchPhotoFun(BuildContext context) {
    isLoadingFun(true);

    _repository.fetchPhotoRepo().then((response) {
      if (response.statusCode == 200) {
        isLoadingFun(false);
        {
          photoRes = response.message;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => PreviewScreen(data: response.message ?? ''),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.status ?? ''),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        isLoadingFun(false);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error while loading image"),
            backgroundColor: Colors.red,
          ),
        );
      }

      debugPrint(response.statusCode.toString());
    });
  }
}
