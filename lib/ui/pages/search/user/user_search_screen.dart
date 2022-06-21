import 'package:closet_app_xxx/controllers/pages/search/user_search_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:closet_app_xxx/ui/pages/global/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserSearchScreen extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlassContainer(
        borderRadius: BorderRadius.zero,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 45,
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      onChanged: (text) {
                        if (text != '') {
                          ref
                              .read(userSearchProvider.notifier)
                              .changeSearchId(searchId: text);
                        }
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.theme,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintText: 'IDを入力',
                        hintStyle: TextStyle(fontWeight: FontWeight.w100),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(child: _ItemList())
          ],
        ),
      ),
    );
  }
}

class _ItemList extends HookConsumerWidget {
  const _ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedUsers =
        ref.watch(userSearchProvider.select((value) => value.searchedUsers));
    return searchedUsers.isEmpty
        ? Center(
            child: Text(
              '',
              style: TextStyle(color: AppColors.text),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: searchedUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final user = searchedUsers[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountPage(
                                  userId: user.uid,
                                )));
                  },
                  child: ListTile(
                    title: Text(user.name),
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
                    trailing: FollowButton(userId: user.uid),
                  ),
                ),
              );
            });
  }
}
