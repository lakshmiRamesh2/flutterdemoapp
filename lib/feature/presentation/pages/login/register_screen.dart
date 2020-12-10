
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/utils/app_color.dart';
import 'package:flutter_app/core/utils/navigation.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/feature/presentation/pages/login/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreenDemo extends StatefulWidget {
  static const String routeName = '/registration_screen_demo';

  @override
  _RegisterScreenDemoState createState() => _RegisterScreenDemoState();
}

class _RegisterScreenDemoState extends State<RegistrationScreenDemo> {
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _usernameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  var _obscurePassword = true;

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // /// Added for testing
    // BlocProvider.of<LoginBloc>(context).add(LoginUserEvent(userId: "superadmin", password: "{SSHA}z7GFnsWFUqJDz0Ac4rG39yNdVLZtdzYyU0o5NiFeNTRHS1cpPUAqSHRRYks="));
    // getPasswordHash();
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is ErrorState &&
              state.message != null &&
              !state.message.isEmpty) {
            Utils.showErrorToast(state.message, context);
            Navigation.back(context);
          } else if (state is LoadingState) {
            Utils.showProgressDialog(context);
          } else if (state is LoadedState) {
            /// Dismissing the progress screen
            Navigation.back(context);

          }
        },
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/1_BG@3x.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                _getFormContainer(),
                /* _getRegisterText(),*/
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getFormContainer() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 13, right: 13, top: 80,bottom: 50),
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              _getAppLogo(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                    "SELF- QUARANTINE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Nunito', fontSize: 18.0, color: Colors.white)),
              ),
              Divider(
                height: 60,
                color: Colors.transparent,
              ),
              _getForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getAppLogo() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Image.asset(
        'assets/app_logo.png',
        width: 90,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _getForm() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getUserName(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getMobileNumber(),
            ),
           // _getButtonPassportNumber(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getPassportNumber(),
            ),

            Divider(
              height: 30,
              color: Colors.transparent,
            ),
            _getLoginButton(),
            _getRegisterText(),
          ],
        ));
  }

  Widget _getUserName() {
    return TextFormField(
      controller: _userNameController,
      maxLines: 1,
      textInputAction: TextInputAction.next,


      validator: (value) {
        return value.isEmpty ? "Full Name" : null;
      },
      focusNode: _usernameFocusNode,
      decoration: InputDecoration(
        labelText: _usernameFocusNode.hasFocus ? 'Full Name' : "Enter Full Name",
        labelStyle: TextStyle(
          fontFamily: Utils.FONT_FAMILY,
          color:
          _usernameFocusNode.hasFocus ? AppColor.red : AppColor.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: TextStyle(
          color: AppColor.red,
          fontFamily: Utils.FONT_FAMILY,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _getMobileNumber() {
    return TextFormField(
      controller: _phoneNumberController,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        return value.isEmpty ? "Mobile Number" : null;
      },
      focusNode: _phoneFocusNode,
      decoration: InputDecoration(
        labelText: _usernameFocusNode.hasFocus ? 'Mobile Number' : "Enter Mobile Number",
        labelStyle: TextStyle(
          fontFamily: Utils.FONT_FAMILY,
          color:
          _usernameFocusNode.hasFocus ? AppColor.red : AppColor.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: TextStyle(
          color: AppColor.red,
          fontFamily: Utils.FONT_FAMILY,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _getPassportNumber() {
    return TextFormField(
      maxLines: 1,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        return value.isEmpty ? "Passport Number" : null;
      },

      decoration: InputDecoration(
        labelText: _usernameFocusNode.hasFocus ? 'Passport Number' : "Enter Passport Number",
        labelStyle: TextStyle(
          fontFamily: Utils.FONT_FAMILY,
          color:
          _usernameFocusNode.hasFocus ? AppColor.red : AppColor.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: TextStyle(
          color: AppColor.red,
          fontFamily: Utils.FONT_FAMILY,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }




  Widget _getLoginButton() {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState.validate()) {

            BlocProvider.of<RegisterBloc>(context).add(RegisterUserEvent(
              name: _userNameController.text,phonenumber: _phoneNumberController.text

              ));

          Utils.dismissKeyboard(context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.only(bottom: 20,top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.backgroundColor,
                AppColor.backgroundColor,
                AppColor.backgroundColor
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 1),
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Center(
          child: Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Utils.FONT_FAMILY,
                fontSize: 16,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )),
        ),
      ),
    );
  }


  Widget _getRegisterText() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'Dont have an account ? ',
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                  fontFamily: Utils.FONT_FAMILY),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                //  Navigation.intent(context, RegisterOptionsScreen.routeName);
                },
              text: 'Register',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColor.white,
                fontSize: 14,
                fontFamily: Utils.FONT_FAMILY,
              ),
            ),
          ],
        ),
      ),
    );
  }


}