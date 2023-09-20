import 'package:flutter/material.dart';

class PdfSearch extends StatelessWidget {
  const PdfSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        isFullScreen: false,
        builder: (context, controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () => controller.openView(),
            onChanged: (_) => controller.openView(),
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: false,
                  onPressed: () {
                    // todo
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              )
            ],
          );
        },
        suggestionsBuilder: (context, controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                controller.closeView(item);
              },
            );
          });
        },
      ),
    );
  }
}
