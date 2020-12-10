import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_color.dart';
import 'package:flutter_app/core/utils/utils.dart';


class RegistrationDialog extends StatelessWidget {
  
  final Function onClick;

  RegistrationDialog({this.onClick});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16),
      // ),
      insetPadding: EdgeInsets.only(
        left: 11,
        right: 11,
      ),
      elevation: 0,
      child: _contentBox(context),
    );
  }

  Widget _contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white,
      ),
      padding: EdgeInsets.only(top: 30, left: 11, right: 11, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getHeading(),
          Divider(
            height: 30,
            color: Colors.transparent,
          ),
          _getOKButton()
        ],
      ),
    );
  }

  Widget _getHeading() {
    return Text(
      "Registration submitted\nsuccessfully!",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.appBarBackground,
        fontFamily: Utils.FONT_FAMILY,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getOKButton() {
    return GestureDetector(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: 160,
        height: 60,
        margin: EdgeInsets.only(bottom: 20, top: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.appBarBackground,
                AppColor.backgroundGrey,
                AppColor.red
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
          child: Text("OK".toUpperCase(),
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
}
