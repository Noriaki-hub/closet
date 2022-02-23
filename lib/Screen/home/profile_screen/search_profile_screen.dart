
import 'package:closet_app_xxx/model/CustomExeption.dart';
import 'package:closet_app_xxx/model/auth/current/current_controller.dart';
import 'package:closet_app_xxx/model/friends/controllers/friendsRequest_controller.dart';
import 'package:closet_app_xxx/model/friends/controllers/friendsRequestedList_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../model/friends/controllers/friends_controller.dart';

class SearchProfileScreen extends HookConsumerWidget {

  String image;
  String name;
  String uid;
  bool isGotRequested = false;


  SearchProfileScreen(this.image, this.name, this.uid, );


  @override
  Widget  build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);



    return Scaffold(
        body: Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white60,
                      BlendMode.dstATop),
                  image: AssetImage('images/clo.png'),
                  fit: BoxFit.cover,
                )),
            child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                Container(
                height: 110,
                width: 200,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.5)
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(name, style: TextStyle(
                          fontSize: 20,
                        ),),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(
                            ),
                            child: Image.network(
                              image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

                    SizedBox(height: 20,),


                    Container(

                      height: 30,
                      width: 200,

                      child:
                        uid != user.uid ?
                      ProviderScope(
                          overrides: [
                            followProvider.overrideWithProvider(followProviderFamily(uid))
                          ],
                          child: _sendRequest(uid, name, image)):
                        ButtonTheme(
                            minWidth: 150,
                            height: 30,
                            child: Center(child: Text(
                              'MyAccount', style: TextStyle(fontWeight: FontWeight.bold),))
                        )
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            )
        )
    );
  }
}

class _sendRequest extends HookConsumerWidget {
  const _sendRequest(this.uid, this.name, this.image, {Key? key,}) : super(key: key);

  final String uid;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(followProvider);
    return value.when(data: (items) => items.isEmpty ?
    ButtonTheme(
        minWidth: 150,
        height: 30,
        child: RaisedButton(onPressed: () {
          ref.read(followProvider.notifier).sendRequest(uid: uid);
        },
          child: Center(child: Text(
            'Follow', style: TextStyle(fontWeight: FontWeight.bold),)),
          color: Colors.blueAccent.shade100,
        )
    )
        :
    ButtonTheme(
        minWidth: 150,
        height: 30,
        child: RaisedButton(onPressed: () {
          ref.read(followProvider.notifier).deleteSendRequest(uid: uid);
        },
          child: Center(child: Text(
            'Followed', style: TextStyle(fontWeight: FontWeight.bold),)),
          color: Colors.grey,)


    ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            _ItemListError(
              message: error is CustomException
                  ? error.message!
                  : 'Something went wrong',
            )
    );
  }
}







class _ItemListError extends HookConsumerWidget {
  final String message;

  const _ItemListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          // ElevatedButton(
          //     onPressed: () => ref
                  // .read(clothesListControllerProvider.notifier)
                  // .getClothesList(uid),
              // child: Text('Retry')
          // ),
        ],
      ),
    );
  }
}
