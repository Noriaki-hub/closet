
import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/pages/timeline/media_log_page_controller.dart';
import 'package:closet_app_xxx/controllers/pages/timeline/shop_log_page_controller.dart';
import 'package:closet_app_xxx/repositories/share_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class DeleteShareButton extends HookConsumerWidget{
  DeleteShareButton(this.itemId, this.genre);
  final String itemId;
  final String genre;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider.select((value) => value.user.uid));
   return IconButton(onPressed: ()async{
     final result = await _showDialog(context);
     if(result){
     await ref.read(shareRepositoryProvider).delete(itemId: itemId, userId: userId);
     if(genre == 'shop'){
       ref.read(shopLogPageProvider.notifier).fetchTimeLine();
     }else if(genre == 'media'){
       ref.read(mediaLogPageProvider.notifier).fetchTimeLine();
     }}

   }, icon: Icon(LineIcons.trash));
  }


  _showDialog(context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(

          title: Text('削除しますか？'),
          actions: [
            CupertinoDialogAction(
              child: Text('はい'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            CupertinoDialogAction(
              child: Text('いいえ'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

}
