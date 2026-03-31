import 'package:firebase/model/user_model.dart';
import 'package:firebase/pages/home_screen.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginRegisterPage());
}

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  UserService userService = UserService();
  String? errormesage;
  bool isLogin = true;

  void showMessage(String message,bool isError){ 

ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.redAccent : Colors.limeAccent,
          duration: Duration(seconds: 3),
        ),
      );
  }

  Future<void> createUser() async {
    try {
   final UserCredential userCred=    await  Auth().createUser(
        email: emailController.text,
        password: passwordController.text,
      );
      UserModel newUser=UserModel(uid: userCred.user!.uid, name: nameController.text, surname: surnameController.text, mailAddress: userCred.user!.email!, );
      await userService.createDbUser(newUser);
      showMessage("Kayıt Başarılı", false);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>HomeScreen()), (route) => false);
         


    } on FirebaseAuthException catch (e) {
      showMessage("Kayıt başarısız, $errormesage", true);
      setState(() {
        errormesage = e.message;
      });
    }
  }

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text,
        password: passwordController.text,
      );
    showMessage("Giriş Başarılı", false);

    } on FirebaseAuthException catch (e) {
      showMessage("Giriş başarısız, $errormesage", true);
      setState(() {
        errormesage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
             TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
             TextField(
              controller: surnameController,
              decoration: InputDecoration(
                hintText: "Surname",
                border: OutlineInputBorder(),
              ),
            ),
             TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Passworddd",
                border: OutlineInputBorder(),
              ),
            ),
            errormesage != null ? Text(errormesage!) : SizedBox.shrink(),
            ElevatedButton(
              onPressed: () {
                if (isLogin) {
                  signIn();
                } else {
                  createUser();
                }
              },
              child: isLogin ? const Text("Login") : const Text("Register"),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text("henuz hesabın yokmu tıkla"),
            ),
          ],
        ),
      ),
    );
  }
}
