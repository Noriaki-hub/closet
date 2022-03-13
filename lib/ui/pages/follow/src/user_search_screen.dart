
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/pages/user_search_page_controller.dart';
import '../../home/home_page.dart';
import '../../../libs/follow_button.dart';




class UserSearchScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      backgroundColor:  Colors.brown.shade50,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            SizedBox(height: 20,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      return TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        onChanged: (text) {
                          if(text != ''){
                          ref.read(UserSearchProvider.notifier)
                              .changeSearchId(searchId: text);}
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          hintText: 'さがす',
                          hintStyle: TextStyle(fontWeight: FontWeight.w100),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)),
                        ),
                      );
                    },

                  ),
                ),
              ),
            ),
            Expanded(
              child: _ItemList()
            )
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
    final searchedUser = ref.watch(
        UserSearchProvider.select((value) => value.searchedUsers));
    return ListView.builder(
        itemCount: searchedUser.length,
        itemBuilder: (BuildContext context, int index) {
          final user = searchedUser[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userId: user.uid,)));
              },
              child: ListTile(
                title: Text(user.name),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(

                    ),
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