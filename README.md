# West Virginia EMS (WVEMS) Protocols

A provider-facing Flutter app to view clinical / EMS protocols quickly and efficiently.

This app includes the current operational guidelines and protocols developed by the EMS Operational Medical Directors in the Western Virginia EMS Region, along with other helpful resources to view offline and online. The app contains interactive features such as push notifications, videos, collaboration tools, external links, interactivity with our social media channels, and much more. Easy navigation tools, search functions, and bookmarks are in our application

Copyright is held by the [Western Virginia EMS Council, Inc](https://western.vaems.org/).

<img align="right" src="wvems-demo.gif" width="320"/>

## Where to Find

This app is available on the [Apple App Store](https://apps.apple.com/ca/app/wvems-protocols-operational/id1437286516) and the [Google Play Store](https://play.google.com/store/apps/details?id=com.WVEMSProtocols). It is free to download.

A single link to this protocol can be found here (Play Store + App Store + PDF, depending on which system is used to open it):

<https://onelink.to/xu9aq8>

That link is accessible via QR code as well:

<img align="center" src="assets/png/share_qr_code.png" width="320"/>

## App Structure

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Wvems Protocols works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

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

-------;

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
