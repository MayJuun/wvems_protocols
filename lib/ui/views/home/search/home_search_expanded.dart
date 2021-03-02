import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/views/home/search/home_search_item.dart';

class HomeSearchExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PdfStateController pdfStateController = Get.find();

    return Material(
      color: Colors.white,
      elevation: 4.0,
      borderRadius: BorderRadius.circular(8),
      child: ImplicitlyAnimatedList<String>(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        items: pdfStateController.pdfPageText.items.take(6).toList(),
        areItemsTheSame: (a, b) => a == b,
        itemBuilder: (context, animation, text, i) {
          return SizeFadeTransition(
            animation: animation,
            child: HomeSearchItem(text: text),
          );
        },
        updateItemBuilder: (context, animation, text) {
          return FadeTransition(
            opacity: animation,
            child: HomeSearchItem(text: text),
          );
        },
      ),
    );
  }
}
