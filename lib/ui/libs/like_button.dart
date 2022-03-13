
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/component/like_button_controller.dart';

class LikeButton extends StatelessWidget {
  LikeButton({
    Key? key,
    required String itemId,
  }) : _itemId = itemId, super(key: key);

  final String _itemId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        LikeButtonProvider.overrideWithProvider(
          LikeButtonProviderFamily(
            LikeButtonProviderArg(itemId: _itemId),
          ),
        ),
      ],
      child: _LikeButton(),
    );
  }
}

class _LikeButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likes = ref.watch(
        LikeButtonProvider.select((value) => value.likes));
    final myLikeState = ref.watch(
        LikeButtonProvider.select((value) => value.myLikeState));
    return
    Row(
      children: [
        myLikeState.isNotEmpty ?
        IconButton(onPressed: (){ref.read(LikeButtonProvider.notifier).deleteLike();}, icon: Icon(LineIcons.heartAlt, color: Colors.red,)) :
        IconButton(onPressed: (){ref.read(LikeButtonProvider.notifier).addLike();}, icon: Icon(LineIcons.heartAlt, color: Colors.grey,),),
        Text(likes.length.toString())
      ],
    );
  }

}