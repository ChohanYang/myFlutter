import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/data/JoinOrLogin.dart';


class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
         CustomPaint(
           size: size,
           // painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context)),
         ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size), // Container(width: 100, height: 50, color: Colors.black,)
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.10,
              ),
              Consumer<JoinOrLogin>(builder: (context, joinOrLogin, child) =>
                  GestureDetector(
                      onTap: () {
                        JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context);
                        joinOrLogin.toggle();
                },
                      child: Text(joinOrLogin.isJoin?"Already have an Account? Sign in":"Don't have an Account?")
                  )
              ),
                Container(
                height: size.height * 0.05,
              )
            ],
          )
        ],
      ),
      ),
    );
  }


  Widget get _logoImage => Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: FittedBox(
        fit: BoxFit.contain,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://picsum.photos/200"),
        ),
      ),
    ),
  );

  Widget _authButton(Size size){
    return Positioned(
      left: size.width*0.1,
      right:size.width*0.1,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
            // color: Colors.blue,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(25)),
            onPressed: (){
              if(_formKey.currentState!.validate()){
                print("button pressed!!");

              }
            }),
      ),
    );
  }

  Widget _inputForm(Size size){
    return Padding(padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12,bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "password",
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please input correct password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 40,
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (context, value, child) => Opacity(
                      opacity: value.isJoin? 0 :1,
                        child: Text("Don't forget Password")),
          ),
                ],
              )),
        ),
      ),
    );
  }
}
