import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resume/admin/admin.dart';
import 'package:resume/widget/text/heading_text.dart';
import '../constants.dart';
import '../widget/custom_button.dart';
import '../widget/custom_snackbar.dart';
import '../widget/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          height: width <= 1100 ? height : width,
          width: width <= 1100 ? 400 : 500,
         
          child: Form(
            key: _signInFormKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadingText(text: 'Sign In',color: Colors.white,),
                const SizedBox(height:30),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: height / (height / 20)),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                SizedBox(height: height / (height / 20)),
                CustomButton(
                  text: 'Sign In',
                  onTap: () {
                    if (_signInFormKey.currentState!.validate()) {
                      signInUser(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signInUser({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProjectsPage()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
