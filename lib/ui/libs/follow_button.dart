import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:closet_app_xxx/controllers/component/follow_button_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowButton extends StatelessWidget {
  FollowButton({
    Key? key,
    required String userId,
  }) : _userId = userId, super(key: key);

  final String _userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        FollowButtonProvider.overrideWithProvider(
          FollowButtonProviderFamily(
            FollowButtonProviderArg(userId: _userId),
          ),
        ),
      ],
      child: _FollowButton(),
    );
  }
}

class _FollowButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyFollowState = ref.watch(
        FollowButtonProvider.select((value) => value.MyFollowState));
    final MyAccountState = ref.watch(
        FollowButtonProvider.select((value) => value.MyAccountState));
    return MyAccountState ?
    OutlinedButton(
        child: const Text('自分'),
        style: OutlinedButton.styleFrom(
          // primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(),
        ),
        onPressed: null
    ) :
    MyFollowState.isEmpty ?
    OutlinedButton(
      child: const Text('フォロー'),
      style: OutlinedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(),
      ),
      onPressed: () async {
        await ref.read(FollowButtonProvider.notifier).addFollowState();
      },
    ) :
    OutlinedButton(
      child: const Text('アンフォロー'),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(),
      ),
      onPressed: () {
        ref.read(FollowButtonProvider.notifier).deleteFollowState();
      },
    );
  }

}