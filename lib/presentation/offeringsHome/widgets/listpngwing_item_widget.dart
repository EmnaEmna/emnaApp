import 'package:emnapp/core/utils/image_constant.dart';
import 'package:emnapp/core/utils/size_utils.dart';
import 'package:emnapp/theme/app_decoration.dart';
import 'package:emnapp/theme/app_style.dart';
import 'package:emnapp/widgets/custom_image_view.dart';

import '../models/listpngwing_item_model.dart';
import 'package:emnapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListpngwingItemWidget extends StatelessWidget {
  ListpngwingItemWidget(this.listpngwingItemModelObj);

  ListpngwingItemModel listpngwingItemModelObj;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: getMargin(
            right: 24,
          ),
          padding: getPadding(
            all: 14,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPngwing55x65,
                height: getVerticalSize(
                  55,
                ),
                width: getHorizontalSize(
                  65,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    6,
                  ),
                ),
                margin: getMargin(
                  top: 1,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 18,
                ),
                child: Text(
                  listpngwingItemModelObj.artworkTxt,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtGilroyMedium14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
