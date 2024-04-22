import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:koupet/theme/app_color.dart';
import 'package:koupet/view/component/custom_button.dart';
import 'package:koupet/view/component/custom_text_field.dart';
import 'package:koupet/view_model/login_view_model.dart';

class PageLogin extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ConstantsColor.lightGreenColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              buildHeaderLogo(),
              SizedBox(height: 20),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: screenHeight * 0.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTextLogin(),
                            SizedBox(height: 70),
                            _buildEmailTextField(),
                            SizedBox(height: 10),
                            _buildPasswordTextField(),
                            _buildForgotPassword(context),
                            SizedBox(height: 40),
                            _buildLoginButton(context),
                            _buildRegisterTextButton(context),
                                          
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeInUp _buildRegisterTextButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: ConstantsAdress.dontAccount,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ConstantsAdress.register,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          viewModel.openRegisterPage(context);
                        },
                    )
                  ]),
            ),
          )),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
      child: CompCustomButton(
        buttonText: ConstantsAdress.login,

        onPressedCallback: () {
          // Form validasyonu yap
          if (_formKey.currentState?.validate() == true) {
            viewModel.login(
              context,
              _emailController.text.trim(),
              _passwordController.text.trim(),
            );
          }
        },
      ),
    );
  }



  Widget _buildForgotPassword(BuildContext context){
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
      child: GestureDetector(
        onTap: () {
          viewModel.forgotPassword(context);

        },
        child:Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              ConstantsAdress.forgotPassword,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ),
    );
  }


  FadeInUp buildForgotPassword() {
    return FadeInUp(
        child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Text(
          ConstantsAdress.forgotPassword,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 16),
        ),
      ),
    ));
  }

  FadeInUp _buildPasswordTextField() {
    return FadeInUp(
        child: CompCustomTextField(
         controller: _passwordController,
          obscureText: true,
      iconData: Icons.lock,
      hintText: ConstantsAdress.password,
    ));
  }

  FadeInUp _buildEmailTextField() {
    return FadeInUp(
        child: Form(
          key: _formKey,
          child: CompCustomTextField(
            controller: _emailController,
            obscureText: false,
                iconData: Icons.email,
                hintText: ConstantsAdress.email,
              ),
        ));
  }

  FadeIn _buildTextLogin() {
    return FadeIn(
      child: Text(
        ConstantsAdress.login,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 35,
        ),
      ),
    );
  }

  Widget buildHeaderLogo() {
    return FadeInDown(
      child: Lottie.asset(
        ConstantsAdress.donate_animation,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }
}
