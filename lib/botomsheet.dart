
import 'package:flutter/material.dart';







class AppBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
    double? maxHeight,
    double? initialChildSize,
    double? maxChildSize,
    double? minChildSize,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).canvasColor),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context2) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? MediaQuery.of(context2).size.height * 0.89,
            maxWidth: MediaQuery.of(context2).size.width * 0.9,
          ),
          child: DraggableScrollableSheet(
            initialChildSize: initialChildSize ?? 1,
            maxChildSize: maxChildSize ?? 1,
            minChildSize: minChildSize ?? 0.4,
            expand: false,
            builder: (BuildContext context2, ScrollController scr) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scr,
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: child,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 30,
                      color: Theme.of(context).canvasColor,
                      margin: const EdgeInsets.only(bottom: 15),
                      alignment: Alignment.topCenter,
                      child: const Center(
                        child: SizedBox(
                          width: 70,
                          // child: CustomDivider(height: 4),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}