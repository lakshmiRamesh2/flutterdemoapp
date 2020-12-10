import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/app_color.dart';
import 'package:flutter_app/core/utils/navigation.dart';

import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

class DeclarationDialog extends StatefulWidget {

  final Function onClick;

  DeclarationDialog({this.onClick});

  @override
  _DeclarationDialogState createState() => _DeclarationDialogState();
}

class _DeclarationDialogState extends State<DeclarationDialog> {
  var _termsChecked = false;

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
      padding: EdgeInsets.only(top: 24, left: 11, right: 11, bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getHeading(),
          Divider(
            height: 22,
            color: Colors.transparent,
          ),
          _getDeclarationText(),
          Divider(
            height: 30,
            color: Colors.transparent,
          ),
          _getTermsCheckBox(),
          _getFooterButtons(context),
        ],
      ),
    );
  }

  Widget _getHeading() {
    return Text(
      "Declaration",
      style: TextStyle(
        color: AppColor.appBarBackground,
        fontFamily: Utils.FONT_FAMILY,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getDeclarationText() {
    return Text(
      "I hereby declare that the information furnished above is true complete and correct to the best of my knowledge and belief. I understand that in the event of my information being found false or incorrect at any stage I shall be liable to the legal action imposed by the law.",
      style: TextStyle(
        color: AppColor.textBlack,
        fontFamily: Utils.FONT_FAMILY,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _getTermsCheckBox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _termsChecked = !_termsChecked;
        });
      },
      child: Row(
        children: [
          _termsChecked
              ? SvgPicture.asset("images/ic_checkbox_checked.svg")
              : SvgPicture.asset("images/ic_checkbox_unchecked.svg"),
          Container(width: 20,),
          Text(
            "I agree with all Terms & Conditions",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColor.red,
              fontFamily: Utils.FONT_FAMILY,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
    /*return Theme(
      data: ThemeData(
        unselectedWidgetColor: AppColor.checkboxRed,
        toggleableActiveColor: Colors.grey,
      ),
      child: CheckboxListTile(
        checkColor: AppColor.checkboxRed,
        tristate: false,
        // activeColor: Colors.grey,
        value: termsChecked,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (isChecked) {
          setState(() {
            termsChecked = isChecked;
          });
        },
        title: Text(
          "I agree with all Terms & Conditions",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColor.red,
            fontFamily: Utils.FONT_FAMILY,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );*/
  }

  Widget _getFooterButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _getCancelButton(context),
        ),
        Container(
          width: 30,
        ),
        Expanded(
          child: _getLoginButton(context),
        )
      ],
    );
  }

  Widget _getCancelButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.back(context),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColor.buttonBorder, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: AppColor.textRed,
              fontSize: 14,
              fontFamily: Utils.FONT_FAMILY,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!_termsChecked) {
          Toast.show("Please agree to terms & conditions", context);
        } else {
          widget.onClick();
        }
      },
      child: Container(
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
          child: Text("Submit",
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
