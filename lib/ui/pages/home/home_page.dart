
import 'package:closet_app_xxx/ui/pages/home/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../ui/pages/home/buy_screen/buy_step_screen.dart';
import '../../../ui/pages/home/sell_screen/sellStep_screen.dart';
import '../../../ui/pages/home/src/category_controller.dart';
import '../../../ui/pages/home/src/closet.dart';
import '../../../ui/pages/home/src/favorite.dart';
import '../../libs/floating_action_button_animation.dart';
import '../../../controllers/pages/home_page_controller.dart';
import 'calender_screen/calender_screen.dart';




class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        HomePageProvider.overrideWithProvider(
          HomePageProviderFamily(
            HomePageProviderArg(userId: userId),
          ),
        ),
      ],
      child: _HomePage(userId: userId),
    );
  }
}



class _HomePage extends ConsumerWidget {
  _HomePage({Key? key, this.userId}) : super(key: key);
  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomePageProvider);
    return
      state.user.uid == '' ?
          Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          ):
      userId == null?
    Scaffold(
          backgroundColor: Colors.brown.shade50,
          floatingActionButton: ExpandableFab(
            distance: 112.0,
            children: [
              Column(
                children: [
                  ActionButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => AccountPage(userId: state.user.uid),
                            ));},
                      icon: const Icon(LineIcons.user)),
                  Text('アカウント', style: TextStyle(color: Colors.grey),)
                ],
              ),
              Column(
                children: [
                  ActionButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => BuyStepScreen(),
                          )
                      );
                      if (result) {
                        ref.read(HomePageProvider.notifier).fetchHomePageData();
                      }
                    }, icon: Icon(LineIcons.plus ),
                  ),
                  Text('購入', style: TextStyle(color: Colors.grey),)
                ],
              ),
              Column(
                children: [
                  ActionButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => SellStepScreen(),
                          )
                      );
                      if (result) {
                        ref.read(HomePageProvider.notifier)
                            .fetchHomePageData();
                      }
                    },
                    icon: const Icon(LineIcons.handHoldingUsDollar),
                  ),
                  Text('売却', style: TextStyle(color: Colors.grey),)
                ],
              ),
              Column(
                children: [
                  ActionButton(
                  onPressed: () async {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => CalenderScreen(),
                                ));},
                    icon: const Icon(LineIcons.calendar)),
                  Text('収支', style: TextStyle(color: Colors.grey),)
                ],
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async{
              await ref.read(HomePageProvider.notifier).fetchHomePageData();
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 40,),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), //角の丸み
                              ),
                              side: const BorderSide(
                                  color: Colors.black45
                              ),
                            ),
                            child: Text('今月の収支', style: TextStyle(color: Colors.black),),
                            onPressed: null
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('購入額'),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  height: 30,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(state.buying),
                                            Text('円')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('売却額'),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.5),
                                  ),
                                  height: 30,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(state.selling),
                                            Text('円')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), //角の丸み
                            ),
                            side: const BorderSide(
                                color: Colors.black45
                            ),
                          ),
                          child: Text('お気に入り', style: TextStyle(color: Colors.black),),
                            onPressed: null
                        ),
                      ),
                      SizedBox(height: 200,
                          child: ClosetFavorite()
                      ),


                      ClosetController(),
                      SizedBox(height:320,child: Closet()),
                    ]
                ),
              ),
            ),
          )
      ):
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown.shade50,
        ),
          backgroundColor: Colors.brown.shade50,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), //角の丸み
                            ),
                            side: const BorderSide(
                                color: Colors.black45
                            ),
                          ),
                          child: Text('お気に入り', style: TextStyle(color: Colors.black),),
                          onPressed: null
                      ),
                    ),
                    SizedBox(height: 200,
                        child: ClosetFavorite()
                    ),


                    ClosetController(),
                    SizedBox(height:320,child: Closet()),
                  ]
              ),
            ),
          )
      );
  }
}