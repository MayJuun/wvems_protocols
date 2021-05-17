# West Virginia EMS (WVEMS) Protocols

A provider-facing Flutter app to view clinical / EMS protocols quickly and efficiently.

This app includes the current operational guidelines and protocols developed by the EMS Operational Medical Directors in the Western Virginia EMS Region, along with other helpful resources to view offline and online. The app contains interactive features such as push notifications, videos, collaboration tools, external links, interactivity with our social media channels, and much more. Easy navigation tools, search functions, and bookmarks are in our application

Copyright is held by the Western Virginia EMS Council, Inc.

<img align="right" src="wvems-demo.gif" width="320"/>

## Design

Prototype / wireframes, if relevant.

## Architecture

This app loosely follows the [Model-View-Controller+Services] `(MVC+S) architecture`, which has both [simple] and [production-level] examples of use. Whereas the above examples make heavy use of Provider, ChangeNotifier, and StatefulWidgets, we are instead using [Get] and some of the [Getx pattern] to simplify state management, routing, and dependency injection.

Our take on MVC+S is as follows:

- `model`: Class/objects created specifically for this app
- `views`: The UI layer, which is separated into multiple `pages` and may optionally be managed via a `viewcontroller`
- `controller`: Manages state of the model and resultant data. Controller classes typically extend `GetxController` (automatically disposed) and `GetxService` (rarely/never disposed)
- `service`: Connects your app with the outside world (e.g. internet or local file system).
- `command`: A high level function that performs a specific task, such as login/logout. It may utilize controllers, APIs, models, etc as necessary.

<img align="center" src="getMVCS.png" width="550"/>

## Folder Structure

The following is the folder structure under the `/lib` folder:

| **Folder**   | **Subfolder**                          | **Description**                                                                                        |
| ------------ | -------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| /_internal   |                                        | custom modifications, constants / enums, utility classes                                               |
|              | /components                            | custom components / variations on Flutter widgets                                                      |
|              | /constants                             | local constants created for the app                                                                    |
|              | /enums                                 | predefined, named constants                                                                            |
|              | /utils                                 | local functions that do things like formatting                                                         |
| /api         |                                        | optional API key location                                                                              |
|              | &lt;custom>.dart                       | private API keys                                                                                       |
|              | api_public.dart                        | public API keys (no gitignore)                                                                         |
|              | api.dart                               | generic export file                                                                                    |
| /controllers |                                        | manages state of the model and resultant data                                                          |
|              | /commands                              | performs a specific global task (login, logout, change password)                                       |
|              | ../&lt;custom>_command.dart            | custom command class                                                                                   |
|              | ../abstract_command.dart               | abstract class for commonly used controllers, placeholder execute() method for commands                |
|              | &lt;custom>_controller.dart            | custom controller, typically used for state management                                                 |
| /models      |                                        | classes / objects created specifically for this app                                                    |
|              | &lt;custom>_data.dart                  | custom data class                                                                                      |
|              | &lt;custom>_model.dart                 | data model that typically modifies or shapes a data class                                              |
| /routes      |                                        | maps route to screen widgets                                                                           |
|              | app_pages.dart                         | the directory of each page within an app                                                               |
|              | app_routes.dart                        | string route names used in the app                                                                     |
| /services    |                                        | interaction with the outside world (REST, FHIR, http, file storage)                                    |
| /ui          |                                        | essentially all things a user sees in the app                                                          |
|              | /styled_components                     | shared widgets that use a common design system / theme so that the app seems consistent across screens |
|              | ../styled_&lt;widget_name>.dart        |                                                                                                        |
|              | /views                                 | top level widgets that are loaded via a route                                                          |
|              | ../&lt;screen_name>/                   |                                                                                                        |
|              | ../../&lt;screen_name>.dart            | the screen widget, may optionally include 'page', 'card', or 'panel' at the end based on view type     |
|              | ../../&lt;screen_name>_binding.dart    | controllers/services that are loaded (or lazy-loaded) in a view                                        |
|              | ../../&lt;screen_name>_controller.dart | the viewcontroller that only affects this screen widget                                                |
|              | ../../&lt;screen_name>_test.dart       | any relevant tests for the screen widget or its viewcontroller                                         |
|              | icons.dart                             | icon asset locations                                                                                   |
|              | localization.dart                      | strings with multiple translations                                                                     |
|              | strings.dart                           | strings used throughout an app                                                                         |
|              | themes.dart                            | custom themes and font sizes                                                                           |
| main.dart    |                                        | the first file a Dart app runs

## Style Guide

Follow the [Dart style guide].

Of note, you should:

- Use `UpperCamelCase` for types.
- Use `lowercase_snake_case` for libraries, packages, directories, and files.
- Use `lowerCamelCase` for constant names.
- Use `lowerCamelCase` for everything else (like variable names).
- Capitalize acronyms and abbreviations longer than two letters (Http rather than HTTP or http).
- A leading underscore makes a member variable private. Only use it if it is private.
- You can use single line if statements for returns.
- Use `///` instead of `/** */` for multi-line comments.

For VS Code, install the Dart and Flutter plugin. Set your editor to [format on save].

## Converting PDF to JSON (temporary fix)

Temporary workaround to turn a pdf into a JSON file

```terminal
pdfgrep -nH '.*' FILENAME.pdf | sed 'H;1h;$!d;x;y/\n/ /' | sed "s/\"/'/g" | tr -s ' ' > input.txt
```

Then:

- Open the file
- Turn all of the 'FILENAME.pdf:' elements into carriage returns
- To the right of the index, add ':::'   (key inputs in this order    cmd + right, :, :)

In terminal, run:

```terminal
jq -R -n -c '[inputs|split(":::")|{(.[0]):.[1]}] | add' input.txt > output.json
```

Finally, select and delete all ' \f ' and ' \f' fields

-------

So I don't forget what each of these means, I'll explain them below:

- [pdfgrep](https://pdfgrep.org/doc.html) will search for items within a PDF using extended regular expressions. I'm specifically using the `'.*'` expression to get the entire raw file. When testing, add the `--max-count 2` flag
- pdfgrep data are piped through `sed 'H;1h;$!d;x;y/\n/ /'` to remove all carriage returns, through `sed "s/\"/'/g"` to convert all double quotes to single quotes (so it'll work as a JSON), and through `tr -s ' '` to remove all trailing whitespace. The result is saved to `input.txt` with the formatting of `FILENAME.pdf:1: page 1 text FILENAME.pdf:2: page 2 text...`. I am intentionally using 'FILENAME.pdf:' as a unique search term for this document
- I manually turn all `FILENAME.pdf:` instances into carriage returns, and then move over (using cmd + right, since that skips by word and works regardless of how many digits are in the page number) and add two extra `:` fields, thus giving:

```terminal

1::: page 1 text
2::: page 2 text
```

- After deleting the first (empty) line, I save my results and run `jq -R -n -c '[inputs|split(":::")|{(.[0]):.[1]}] | add' input.txt`, which uses `:::` as a delimeter between key / value pairs and carriage return as a delimeter for each entry. This result is saved as `output.json`, though it (unfortunately) also contains ` \f ` in all fields save for the last (which has ' \f' without the trailing space). After deleting those escape characters and extra whitespaces, I now have a fully implemented JSON from a PDF!

Some of my steps can be better automated/optimized...but this works.

Final point, to get these commands to work on my Mac, I needed to run `brew install pdfgrep jq`, since I didn't have either of these installed beforehand. Thank you [homebrew](https://brew.sh)!

[Dart style guide]: https://dart.dev/guides/language/effective-dart/style
[format on save]: https://flutter.dev/docs/development/tools/formatting#automatically-formatting-code-in-vs-code
[Get]: https://pub.dev/packages/get#the-three-pillars
[Getx pattern]: https://github.com/kauemurakami/getx_pattern
[Model-View-Controller+Services]: https://blog.gskinner.com/archives/2020/09/flutter-state-management-with-mvcs.html
[PRAPARE app]: https://github.com/firejuun/prapare
[simple]: https://github.com/gskinnerTeam/flutter-mvcs-hello-world
[production-level]: https://github.com/gskinnerTeam/flokk
