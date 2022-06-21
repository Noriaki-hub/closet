import 'package:closet_app_xxx/controllers/pages/global/brand_view_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/global/brand/brand_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrandFollowButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(brandViewPageProvider.select((value) => value.isLoadingForFollowState));
    final isMyFollow =
        ref.watch(brandViewPageProvider.select((value) => value.isMyFollow));
    return 
    isLoading ? CircularProgressIndicator():
    !isMyFollow
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blue.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //角の丸み
              ),
              side: const BorderSide(color: Colors.black45),
            ),
            child: const Text(
              'フォロー',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              ref.read(brandViewPageProvider.notifier).addFollower();
            },
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), //角の丸み
              ),
              side: const BorderSide(color: Colors.black45),
            ),
            child: const Text(
              'アンフォロー',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              ref.read(brandViewPageProvider.notifier).deleteFollower();
            },
          );
  }
}
