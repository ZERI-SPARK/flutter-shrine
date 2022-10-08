import 'package:flutter/material.dart';

const magicString = 'zerispark';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              onSubmitted: (value) => _submitUser(),
              decoration: InputDecoration(
                labelText: 'username',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus ? Theme.of(context).colorScheme.secondary : _unfocusedColor,
                ),
                // filled: true,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              onSubmitted: (value) => _submitUser(),
              decoration: InputDecoration(
                labelText: 'password',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus ? Theme.of(context).colorScheme.secondary : _unfocusedColor,
                ),
                // filled: true,
              ),
              obscureText: true,
            ),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            ButtonBar(
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: [
                TextButton(
                  onPressed: _clearFormFields,
                  child: const Text('CANCLE'),
                   style: ButtonStyle(
                     foregroundColor: MaterialStateProperty.all(
                       Theme.of(context).colorScheme.secondary,
                     ),
                     shape: MaterialStateProperty.all(
                       const BeveledRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(7.0),
                         ),
                       ),
                     ),
                   ),
                  
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  onPressed: _submitUser,
                  child: const Text('NEXT'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8.0),
                    shape: MaterialStateProperty.all(
                       const BeveledRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(7.0),
                         ),
                       ),
                     ),
                      // backgroundColor:
                      //     MaterialStateProperty.all(Colors.grey[300]),
                      // foregroundColor: MaterialStateProperty.all(Colors.black)
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _submitUser() {
    if (_usernameController.text.isEmpty && _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter Details'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ));
    } else if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter Username'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ));
    } else if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter Password'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ));
    } else if (_usernameController.text.compareTo(magicString) == 0 &&
        _passwordController.text.compareTo(magicString) == 0) {
      Navigator.pop(context);
    } else {
      _clearFormFields();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Wrong Username or password! Try Again'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  void _clearFormFields() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
// TODO: Add AccentColorOverride (103)
