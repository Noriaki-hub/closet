import 'package:closet_app_xxx/controllers/component/like_button_controller.dart';
import 'package:closet_app_xxx/ui/libs/like/src/like_users.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class LikeButton extends StatelessWidget {
  LikeButton({
    Key? key,
    required String itemId,
  })  : _itemId = itemId,
        super(key: key);

  final String _itemId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        likeButtonProvider.overrideWithProvider(
          likeButtonProviderFamily(
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
    final likes = ref.watch(likeButtonProvider.select((value) => value.likes));
    final myLikeState =
        ref.watch(likeButtonProvider.select((value) => value.myLikeState));
    final isLoading =
        ref.watch(likeButtonProvider.select((value) => value.isLoading));
    return isLoading
        ? CircularProgressIndicator()
        : Column(
            children: [
              Row(
                children: [
                  myLikeState.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            ref.read(likeButtonProvider.notifier).deleteLike();
                          },
                          icon: Icon(
                            LineIcons.heartAlt,
                            color: Colors.red,
                          ))
                      : IconButton(
                          onPressed: () {
                            ref.read(likeButtonProvider.notifier).addLike();
                          },
                          icon: Icon(
                            LineIcons.heartAlt,
                            color: Colors.grey,
                          ),
                        ),
                  Text(likes.length.toString())
                ],
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LikeUsers(likes: likes)));
                  },
                  child: Text(
                    'いいねした人',
                    style: TextStyle(fontSize: 10),
                  ))
            ],
          );
  }
}
