import 'package:closet_app_xxx/controllers/component/user_info_controller.dart';
import 'package:closet_app_xxx/ui/pages/home/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfo extends StatelessWidget {
  UserInfo({Key? key, required this.userId, required this.width})
      : super(key: key);

  final String userId;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(overrides: [
      UserInfoProvider.overrideWithProvider(
        UserInfoProviderFamily(
          UserInfoProviderArg(userId: userId),
        ),
      ),
    ], child: _UserInfo(width: width));
  }
}

class _UserInfo extends HookConsumerWidget {
  _UserInfo({required this.width});
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(UserInfoProvider.select((value) => value.user));
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AccountPage(userId: user.uid),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    user.image,
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(user.name)
            ],
          ),
        ),
      ),
    );
  }
}
