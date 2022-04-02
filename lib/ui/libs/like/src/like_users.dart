import 'package:closet_app_xxx/models/user.dart';
import 'package:closet_app_xxx/ui/pages/home/account/account_page.dart';
import 'package:flutter/material.dart';

class LikeUsers extends StatelessWidget {
  LikeUsers({required this.likes});
  final List<UserModel> likes;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: likes.length,
            itemBuilder: (BuildContext context, int index) {
              final user = likes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountPage(userId: user.uid),
                        ));
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
            }),
      ),
    );
  }
}
