import 'package:demo/provider/photo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomepage extends ConsumerWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: AbsorbPointer(
          absorbing: ref.watch(photoProvider).isLoading ? true : false,
          child: CupertinoButton.filled(
            disabledColor: Colors.grey,
            child: ref.watch(photoProvider).isLoading
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : const Text("Fetch Photo"),
            onPressed: () => ref.read(photoProvider).fetchPhotoFun(context),
          ),
        ),
      ),
    );
  }
}
