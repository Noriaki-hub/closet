import 'package:closet_app_xxx/controllers/pages/follow/follow_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowPage extends StatelessWidget {
  FollowPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        followPageProvider.overrideWithProvider(
          followPageProviderFamily(
            FollowPageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _FollowPage(userId: userId),
    );
  }
}

class _FollowPage extends HookConsumerWidget {
  _FollowPage({Key? key, this.userId}) : super(key: key);
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassScaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(followPageProvider.notifier).fetchFollows();
        },
        child: ItemList(),
      ),
    );
  }
}

class ItemList extends HookConsumerWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follows =
        ref.watch(followPageProvider.select((value) => value.follows));
    final isLoading =
        ref.watch(followPageProvider.select((value) => value.isLoading));
    return isLoading
        ? Loading()
        : follows.isEmpty
            ? Center(
                child: Text(
                  'フォローしていません',
                  style: TextStyle(color: Colors.black45),
                ),
              )
            : ListView.builder(
                itemCount: follows.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = follows[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AccountPage(userId: user.uid),
                            ));
                        if (result) {
                          ref.read(followPageProvider.notifier).fetchFollows();
                        }
                      },
                      child: ListTile(
                        key: ValueKey(user.uid),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Image.network(
                              user.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(user.name),
                      ),
                    ),
                  );
                });
  }
}
