import 'package:closet_app_xxx/controllers/pages/global/account_edit_page_controller.dart';
import 'package:closet_app_xxx/ui/libs/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'src/image_picker.dart';

class AccountEditPage extends HookConsumerWidget {
  AccountEditPage({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile =
        ref.watch(accountEditPageProvider.select((value) => value.imageFile));
    final isEdit =
        ref.watch(accountEditPageProvider.select((value) => value.isEdit));
    final user =
        ref.watch(accountEditPageProvider.select((value) => value.currentUser));
    final instaUserName = ref.watch(
        accountEditPageProvider.select((value) => value.currentInstaUserName));
    final intro = ref
        .watch(accountEditPageProvider.select((value) => value.currentIntro));

    return user == null
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(instaUserName ?? ''),
              backgroundColor: Colors.brown.shade50,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(LineIcons.angleLeft),
              ),
            ),
            floatingActionButton: !isEdit
                ? Container()
                : FloatingActionButton(
                    child: const Text('変更'),
                    backgroundColor: Color.fromRGBO(239, 235, 233, 1),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await ref
                            .read(accountEditPageProvider.notifier)
                            .updateUser();
                        Navigator.pop(context, true);
                      }
                    },
                  ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 65, left: 65),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Container(
                          width: 250,
                          height: 250,
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: imageFile == null
                                ? Image.network(
                                    user.image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    imageFile,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('名前',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          // width: 250,
                          child: TextField(
                            controller: TextEditingController(text: user.name),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (text) async {
                              await ref
                                  .read(accountEditPageProvider.notifier)
                                  .name(name: text);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ID',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              validator: (value) {
                                if (value != null) {
                                  if (value.length < 6) {
                                    return '六文字以上';
                                  } else if (!RegExp(r'^[0-9a-zA-Z]+$')
                                      .hasMatch(value)) {
                                    return '英数字のみ';
                                  }
                                }
                                return null;
                              },
                              controller: TextEditingController(text: user.id),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  )),
                              onChanged: (text) async {
                                if (_formKey.currentState!.validate()) {
                                  await ref
                                      .read(accountEditPageProvider.notifier)
                                      .id(id: text);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Instagram',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            controller:
                                TextEditingController(text: instaUserName),
                            decoration: InputDecoration(
                                hintText:
                                    instaUserName != '' ? null : 'ユーザーネームを入力',
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (text) async {
                              await ref
                                  .read(accountEditPageProvider.notifier)
                                  .instaUserName(instaUerName: text);
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ひとこと',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            maxLength: 30,
                            controller: TextEditingController(text: intro),
                            decoration: InputDecoration(
                                hintText:
                                    instaUserName != '' ? '' : 'スニーカー大好きマンです',
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )),
                            onChanged: (text) async {
                              await ref
                                  .read(accountEditPageProvider.notifier)
                                  .intro(intro: text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return SafeArea(child: PickImage());
        });
  }
}
