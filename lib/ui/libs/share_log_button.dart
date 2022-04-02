
import 'package:closet_app_xxx/controllers/pages/share_log_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShareLogPage extends StatelessWidget {
  const ShareLogPage(
      {Key? key,
        required this.currentUrl, required this.genre})
      : super(key: key);

  final String currentUrl;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        ShareLogPageProvider.overrideWithProvider(
         ShareLogPageProviderFamily(
           ShareLogPageProviderArg(currentUrl: currentUrl, genre: genre),
          ),
        ),
      ],
      child: _ShareLogPage(),
    );
  }
}

class _ShareLogPage extends HookConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ShareLogPageProvider);

    return AlertDialog(
      content: state.url == ''? SizedBox(height:150,child: Loading()):ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: BoxDecoration(
            ),
            child: Image.network(
              state.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title:  Text(state.title)
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ログに投稿'),
          onPressed: () async{
            await ref.read(ShareLogPageProvider.notifier).addShare();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('戻る'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}