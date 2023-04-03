import 'package:flutter/material.dart';
import 'package:popular_movies/views/widgets/arrow_up_positioned.dart';

///  Se restringe que el mixin se pueda usar solo
///  en una clase StatefulWidget para poder
///  usar setState aquí y no tener que pasarlo como parámetro
///  o alguna otra técnica

mixin ScrollControllerMixin<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();
  Widget? arrowUpButtonMixin;

  initListenerCloseToEndMixin(Function loadMoreData,
      {withArrowUpValidation = false}) async {
    scrollController.addListener(() async {
      ScrollPosition position = scrollController.position;
      if (position.pixels + 200 > position.maxScrollExtent) {
        await loadMoreData();
        scrollController.animateTo(position.pixels + 200,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
      if (withArrowUpValidation) {
        arrowUpValidation(position.pixels);
      }
      setState(() {});
    });
  }

  void arrowUpValidation(double pixels) {
    if (pixels > 20) {
      arrowUpButtonMixin = ArrowUpButtonWidget(onPressed: goUp);
    } else {
      arrowUpButtonMixin = null;
    }
  }

  void goUp() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
