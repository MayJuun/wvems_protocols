import 'package:flutter/material.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

class PdfSearch extends StatelessWidget {
  const PdfSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SearchAnchor(
        isFullScreen: false,
        builder: (context, controller) {
          return SearchBar(
            controller: controller,
            hintText: 'Search Protocols'.hardcoded,
            onTap: () => controller.openView(),
            onChanged: (_) => controller.openView(),
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Change Version, Settings, Messages',
                child: IconButton(
                  onPressed: () {
                    // todo
                  },
                  icon: const Icon(Icons.menu),
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
