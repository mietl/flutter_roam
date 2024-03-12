import 'package:flutter/material.dart';
import 'package:flutter_roam/api/api_constants.dart';
import 'package:flutter_roam/api/login_api.dart';
import 'package:flutter_roam/pages/home_page.dart';
import 'package:flutter_roam/util/extended.dart';
import 'package:flutter_roam/util/string.dart';
import 'package:flutter_roam/util/toast.dart';
import 'package:flutter_roam/widgets/input_type.dart';
import 'package:flutter_roam/widgets/login_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool invokeLogin = false;
  String? username;
  String? password;
  Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    primaryColor = Theme.of(context).primaryColor;
    return  Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,size: 16,),
            onPressed: () => {
              // Navigator.of(context).pop('刷新')
            },
          ),
          actions: const [
            InkWell(child: Text("忘记密码？"))
          ]
      ),
      body: _buildView()
    );
  }

  _buildView() {
    return Stack(
      children: [
        ..._buildBackground(),
        _buildLoginFrom()
      ],
    );
  }

  _buildBackground() {
    return [
      // 背景图片
      // Positioned.fill(
      //   child: Image.asset(
      //           'assets/img/58336177.png',
      //           fit: BoxFit.cover)
      // ),
      // 模糊效果
      // BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
      //   child: Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     color: Colors.black.withOpacity(0), // 背景颜色透明
      //   ),
      // ),
    ];
  }

  _buildLoginFrom(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 41,horizontal: 22),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text("欢迎登陆",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 26.0),
          InputType(
              hintText: '请输入用户名',
              onChanged: (value){
                username = value;
                checkInputSubmit();
              }
          ),
          const SizedBox(height: 17.0),
          InputType(
            hintText: '请输入密码',
            obscureText: true,
            onChanged: (value){
              password = value;
              checkInputSubmit();
            },
          ),
          const SizedBox(height: 17.0),
          LoginButton(
            onPressed: invokeLogin? startLogin:null,
            child: const Text('登录',style: TextStyle(
              fontWeight: FontWeight.bold
            )),
          ),
          const SizedBox(height: 14.0),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: openSignUp,
              child: const Text('注册账户')
            ),
          )
        ],
      ),
    );
  }

  void startLogin() async {
    try{
       var result  = await LoginApi.passwordLogin(username!, password!);
       if(mounted){
         Toast.show(context, '登录成功');
         context.replace(const MyHomePage());
       }
    }catch(e){
      if(mounted){
        Toast.show(context,e.toString());
      }
    }
  }

  void checkInputSubmit() {
    if((isEmpty(username) || isEmpty(password)) && invokeLogin == true){
      setState(() {
        invokeLogin = false;
      });
    }else if(isNotEmpty(username) && isNotEmpty(password) && invokeLogin == false){
      setState(() {
        invokeLogin = true;
      });
    }
  }

  void openSignUp() async {
    Uri uri = Uri.parse(ApiConstants.testUrl);

    bool isLaunch = await launchUrl(uri,mode: LaunchMode.externalApplication);
    if(!isLaunch && mounted){
      Toast.show(context,'不能跳转');
    }
  }
}
