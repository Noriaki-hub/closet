import 'dart:ui';

import 'package:closet_app_xxx/controllers/component/follow_button_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlassScaffold extends StatelessWidget {
  GlassScaffold(
      {this.appBar,
      this.body,
      this.floatingActionButton,
      this.image,
      this.extendBodyBehindAppBar,
      this.persistentFooterButtons});

  final PreferredSizeWidget? appBar;

  final Widget? body;
  final Widget? floatingActionButton;
  final String? image;
  final bool? extendBodyBehindAppBar;
  final dynamic persistentFooterButtons;

  @override
  Widget build(BuildContext context) {
    return image == null
        ? GlassContainer(
            borderRadius: BorderRadius.zero,
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    // Color(0xFF38b48b),
                    // Color(0xFF2ca9e1),
                    // Color(0xFF1e50a2),
                    Color(0xFFdcdddd),
                    Color(0xFFa9a9a9),
                    Color(0xFFafafb0),
                    Color(0xFFa9a9a9),
                    Color(0xFFdcdddd),
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: extendBodyBehindAppBar ?? true,
                appBar: appBar,
                body: body,
                floatingActionButton: floatingActionButton,
                persistentFooterButtons: persistentFooterButtons,
              ),
            ),
          )
        : GlassContainer(
            borderRadius: BorderRadius.zero,
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: extendBodyBehindAppBar ?? true,
                appBar: appBar,
                body: body,
                floatingActionButton: floatingActionButton,
              ),
            ),
          );
  }
}

class GlassAppBar extends StatelessWidget with PreferredSizeWidget {
  GlassAppBar({
    this.title,
    this.leading,
    this.actions,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: title,
                leading: leading,
                actions: actions)),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        56.0,
      );
}

class GlassContainer extends StatelessWidget {
  GlassContainer({
    required this.width,
    required this.height,
    this.radius = 16,
    this.blur = 20,
    required this.child,
    required this.borderRadius,
  });

  final double width;
  final double height;
  final double radius;
  final BorderRadius borderRadius;
  final double blur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 24,
              // spreadRadius: 16,
              color: Colors.transparent)
        ],
      ),
      // ぼかす範囲をContainerの背後のみにする
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          // 背景をぼかす
          filter: ImageFilter.blur(
            sigmaX: blur,
            sigmaY: blur,
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
              borderRadius: borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

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
                      backgroundColor: AppColors.theme,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: AppColors.text),
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


