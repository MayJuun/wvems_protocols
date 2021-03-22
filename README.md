# West Virginia EMS (WVEMS) Protocols

A provider-facing Flutter app to view clinical / EMS protocols quickly and efficiently.

This app includes the current operational guidelines and protocols developed by the EMS Operational Medical Directors in the Western Virginia EMS Region, along with other helpful resources to view offline and online. The app contains interactive features such as push notifications, videos, collaboration tools, external links, interactivity with our social media channels, and much more. Easy navigation tools, search functions, and bookmarks are in our application

Copyright is held by the Western Virginia EMS Council, Inc. 

<!-- <img align="right" src="demo.gif" width="250"/> -->

## Design

Prototype / wireframes, if relevant. 

## Architecture

architecture / folder structure info


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
