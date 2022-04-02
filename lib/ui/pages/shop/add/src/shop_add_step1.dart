import 'package:closet_app_xxx/controllers/pages/shop_add_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';





class ShopAddStep1 extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(shopAddPageProvider.select((s) => s.imageFile));
    return GestureDetector(
        onTap: () {
          _showPicker(context,);
        },
        child: imageFile != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.white,
            child: Image.file(
              imageFile,
              width: 300,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
        )
            : Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(300)),
          width: 300,
          height: 300,
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey[800],
          ),
        )
    );
  }

  void _showPicker(context,) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext ) {
          return SafeArea(
              child: PickImage(page: 'addShop')
          );
        }
    );
  }
}
