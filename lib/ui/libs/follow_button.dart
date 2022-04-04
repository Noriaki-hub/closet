import 'package:closet_app_xxx/controllers/component/follow_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowButton extends StatelessWidget {
  FollowButton({
    Key? key,
    required String userId,
  })  : _userId = userId,
        super(key: key);

  final String _userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        followButtonProvider.overrideWithProvider(
          followButtonProviderFamily(
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
    final myFollowState =
        ref.watch(followButtonProvider.select((value) => value.myFollowState));
    final myAccountState =
        ref.watch(followButtonProvider.select((value) => value.myAccountState));
    final isLoading =
        ref.watch(followButtonProvider.select((value) => value.isLoading));
    return isLoading
        ? CircularProgressIndicator()
        : myAccountState
            ? OutlinedButton(
                child: const Text(
                  '自分',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Colors.black45),
                ),
                onPressed: null)
            : myFollowState.isEmpty
                ? OutlinedButton(
                    child: const Text('フォロー'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    onPressed: () async {
                      await ref
                          .read(followButtonProvider.notifier)
                          .addFollowState();
                    },
                  )
                : OutlinedButton(
                    child: const Text('アンフォロー'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Colors.black45),
                    ),
                    onPressed: () {
                      ref
                          .read(followButtonProvider.notifier)
                          .deleteFollowState();
                    },
                  );
  }
}
