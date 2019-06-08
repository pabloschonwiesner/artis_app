// import 'package:artis_app/locale/AppLang.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';


// class SignInGoogle extends StatefulWidget {
//   @override
//   State createState() => SignInGoogleState();
// }

// class SignInGoogleState extends State<SignInGoogle> {
//   GoogleSignIn _googleSignIn;
//   GoogleSignInAccount _currentUser;
//   String _contactText;

//   SignInGoogleState() {
//       _googleSignIn = GoogleSignIn(
//         scopes: [
//           'email',
//           'https://www.googleapis.com/auth/userinfo.profile', 
//         ]
//       );
//   }

  

//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
//       setState(() {
//         _currentUser = account;
//       });
//       // if (_currentUser != null) {
//       //   _handleGetContact();
//       // }
//     });
//     _googleSignIn.signInSilently();
//   }

//   // Future<void> _handleGetContact() async {
//   //   setState(() {
//   //     _contactText = "Loading contact info...";
//   //   });
//   //   final http.Response response = await http.get(
//   //     'https://people.googleapis.com/v1/people/me/connections'
//   //     '?requestMask.includeField=person.names',
//   //     headers: await _currentUser.authHeaders,
//   //   );
//   //   if (response.statusCode != 200) {
//   //     setState(() {
//   //       _contactText = "People API gave a ${response.statusCode} "
//   //           "response. Check logs for details.";
//   //     });
//   //     print('People API ${response.statusCode} response: ${response.body}');
//   //     return;
//   //   }
//   //   final Map<String, dynamic> data = json.decode(response.body);
//   //   print('Data: $data');
//   //   final String namedContact = _pickFirstNamedContact(data);
//   //   setState(() {
//   //     if (namedContact != null) {
//   //       _contactText = "I see you know $namedContact!";
//   //     } else {
//   //       _contactText = "No contacts to display.";
//   //     }
//   //   });
//   // }

//   // String _pickFirstNamedContact(Map<String, dynamic> data) {
//   //   final List<dynamic> connections = data['connections'];
//   //   final Map<String, dynamic> contact = connections?.firstWhere(
//   //     (dynamic contact) => contact['names'] != null,
//   //     orElse: () => null,
//   //   );
//   //   if (contact != null) {
//   //     final Map<String, dynamic> name = contact['names'].firstWhere(
//   //       (dynamic name) => name['displayName'] != null,
//   //       orElse: () => null,
//   //     );
//   //     if (name != null) {
//   //       return name['displayName'];
//   //     }
//   //   }
//   //   return null;
//   // }

//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _handleSignOut() async {
//     _googleSignIn.disconnect();
//   }

//   Widget _buildBody() {
//     if (_currentUser != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: GoogleUserCircleAvatar(
//               identity: _currentUser,
//             ),
//             title: Text(_currentUser.displayName ?? ''),
//             subtitle: Text(_currentUser.email ?? ''),
//           ),
//           Text(AppLang.of(context).trans('loginSignIn')),
//           Text(_contactText ?? ''),
//           RaisedButton(
//             child: Text(AppLang.of(context).trans('loginButtonSignOut')),
//             onPressed: _handleSignOut,
//           ),
//           // RaisedButton(
//           //   child: Text(AppLang.of(context).trans('loginButtonRefresh')),
//           //   onPressed: _handleGetContact,
//           // ),
//         ],
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Text(AppLang.of(context).trans('loginNotSignedIn')),
//           RaisedButton(
//             child: Text(AppLang.of(context).trans('loginButtonSignIn')),
//             onPressed: _handleSignIn,
//           ),
//         ],
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         // ConstrainedBox(
//         //   constraints: const BoxConstraints.expand(),
//         //   child: _buildBody(),
//         // ),
//         Container(
//           height: 200,
//           child: _buildBody(),
//         ),
//         Container(
//           height: 100,
//           child: Text(_currentUser == null ? 'Hola' : _currentUser.displayName),
//         )
//       ],
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //       appBar: AppBar(
//   //         title: const Text('Google Sign In'),
//   //       ),
//   //       body: ConstrainedBox(
//   //         constraints: const BoxConstraints.expand(),
//   //         child: _buildBody(),
//   //       ));
//   // }
// }