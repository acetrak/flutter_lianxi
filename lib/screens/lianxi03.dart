import 'package:flutter/material.dart';

class Lianxi03 extends StatelessWidget {
  GlobalKey<FormState> _loginKey = GlobalKey();



  String _username;
  String _password;

  _login() {

    var loginState = _loginKey.currentState;
    if (loginState.validate()) {
      loginState.save();
      print('_username； $_username------------_password:$_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标题'),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: '请输入', labelText: '请输入用户名', filled: true),
                  onSaved: (val) => _username = val,
                  onFieldSubmitted: (val) {},
                  validator: (val) {
                    if (val.length == 0) return '请输入用户名';
                    return null;
                  },
                  onChanged: (val){
                    var loginState = _loginKey.currentState;
                    loginState.validate();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: '请输入', labelText: '请输入密码', filled: true),
                  onSaved: (val) => _password = val,
                  onFieldSubmitted: (val) {},
                  validator: (val) {
                    if (val.length < 3) return '密码长度不能小于3';
                    if (val.length > 6) return '密码长度不能大于6';
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: _login,
                    child: Text(
                      '登录',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
