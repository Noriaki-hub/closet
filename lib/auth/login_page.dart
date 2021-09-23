// import 'package:closet_app_xxx/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   // メッセージ表示用
//   String infoText = '';
//
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('Login'),
//                   onPressed: () async {
//                     try {
//                       UserCredential userCredential = await FirebaseAuth
//                           .instance.signInWithEmailAndPassword(
//                           email: email,
//                           password: password,
//
//                       );
//
//                       await Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) {
//                             return FirstPage(userCredential.user!);
//                           }),
//                       );
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'user-not-found') {
//                         print('No user found for that email.');
//                       } else if (e.code == 'wrong-password') {
//                         print('Wrong password provided for that user.');
//                       }
//
//                     } catch (e) {
//                       setState(() {
//                         infoText = "ログインに失敗しました。IDまたはパスワードが無効です。：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('Signup Page'),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RegisterPage(),
//                         )
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('Back'),
//                   onPressed: () {
//                     Navigator.popUntil(context, (route) => route.isFirst);
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   // メッセージ表示用
//   String infoText = '';
//
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'パスワード'),
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               Container(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 child: ElevatedButton(
//                   child: Text('Signup'),
//                   onPressed: () async {
//                     try {
//
//                       UserCredential userCredential  = await FirebaseAuth
//                           .instance.createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                     } on FirebaseAuthException catch (e) {
//                       if (e.code == 'weak-password') {
//                         print('The password provided is too weak.');
//                       } else if (e.code == 'email-already-in-use') {
//                         print('The account already exists for that email.');
//                       }
//                     } catch (e) {
//                       setState(() {
//                         infoText = "登録に失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('Back'),
//                   onPressed: () {
//                     Navigator.popUntil(context, (route) => route.isFirst);
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }