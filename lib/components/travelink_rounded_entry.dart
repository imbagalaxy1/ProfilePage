import 'dart:ui';

import 'package:flutter/material.dart';

class TravelinkRoundedTextField extends StatelessWidget{

  String? hintText;
  double? marginLeft;
  double? marginRight;
  double? marginTop;
  double? marginBottom;

  Icon? suffixIcon;
  Icon? prefixIcon;

  TravelinkRoundedTextField({
    super.key,
    this.hintText,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.suffixIcon,
    this.prefixIcon
  });

  TravelinkRoundedTextField.normal({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    double allMargins = 0.0
  }){
    marginLeft = allMargins;
    marginRight = allMargins;
    marginTop = allMargins;
    marginBottom = allMargins;
  }

  TravelinkRoundedTextField.axisPadded({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    double xMargin = 0.0,
    double yMargin = 0.0
  }){
    marginLeft = xMargin;
    marginRight = xMargin;
    marginTop = yMargin;
    marginBottom = yMargin;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white
        ),
        borderRadius: const BorderRadius.all(Radius.circular(25))
      ),
      margin: EdgeInsets.fromLTRB(marginLeft!, marginTop!, marginRight!, marginBottom!),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16,0,16,0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    )
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF9aa5ac),
                    fontFamily: 'Nunito Sans',
                    fontVariations: [
                      FontVariation('wght', 700)
                    ],
                    fontStyle: FontStyle.italic,
                    letterSpacing: 0.7
                  ),
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon
              ),
            ),
          )
        ],
      ),
    );
  }

}