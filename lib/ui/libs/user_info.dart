import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../controllers/component/user_info_controller.dart';
import '../pages/home/account/account_page.dart';
import '../pages/home/home_page.dart';






class UserInfo extends StatelessWidget {
  UserInfo({
    Key? key,
    required String userId,
  }) : _userId = userId, super(key: key);

  final String _userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        UserInfoProvider.overrideWithProvider(
          UserInfoProviderFamily(
            UserInfoProviderArg(userId: _userId),
          ),
        ),
      ],
      child: _UserInfo(),
    );
  }
}


class _UserInfo extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(UserInfoProvider.select((value) => value.user));
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AccountPage(userId: user.uid),
            )
        );
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
            SizedBox(width: 10,),
            Text(user.name)
          ],
        ),
      ),
    );
  }

}