import 'package:closet_app_xxx/controllers/pages/clothes_edit_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageChangeField extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile =
        ref.watch(clothesEditPageProvider.select((value) => value.imageFile));
    final imageURL = ref.watch(
        clothesEditPageProvider.select((value) => value.clothes?.imageURL));
    return imageURL == null
        ? Container()
        : InkWell(
            onTap: () {
              _showPicker(context);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.white,
                  child: imageFile == null
                      ? Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                        )),
            ),
          );
  }

  void _showPicker(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return SafeArea(child: PickImage(page: 'editClothes'));
        });
  }
}
