import 'package:closet_app_xxx/controllers/pages/follow_media_log_page_controller.dart';
import 'package:closet_app_xxx/ui/pages/timeline/media/src/grid_tile.dart';
import 'package:closet_app_xxx/ui/pages/timeline/media/src/log_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FollowLogList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final logMaps =
        ref.watch(followMediaLogPageProvider.select((value) => value.logMap));
    final logList = logMaps.entries.map((e) => Log(e.key, e.value)).toList();
    return logList.isEmpty
        ? Center(
            child: Text(
              '',
              style: TextStyle(color: Colors.black45),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: ListView.builder(
              itemCount: logList.length,
              itemBuilder: (BuildContext context, int index) {
                final log = logList[index];
                return Tile(
                  share: log.share,
                  user: log.user,
                );
              },
            ),
          );
  }
}
