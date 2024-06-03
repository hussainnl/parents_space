import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parent_space_new/ui/size_config.dart';
import 'package:parent_space_new/ui/them.dart';

class InputPost extends StatelessWidget {
  const InputPost(
      {super.key, required this.title, this.controller, this.widget});
  final String title;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titlestyle,
            ),
            Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenhight * .4,
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      style: subTitleStyle,
                      readOnly: widget != null ? true : false,
                      cursorColor:
                          Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                      controller: controller,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintStyle: subTitleStyle,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: context.theme.colorScheme.background)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: context.theme.colorScheme.background)),
                      ),
                    )),
                    widget ?? Container()
                  ],
                )),
          ],
        ));
  }
}
