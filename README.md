## IMPORTANT INFORMATION

You have to add only 3 String in Super Tabs.

## Features

Change the segment with different tabs or pages with beautiful Super Tab.

## Getting started

Install the Package

```dart
flutter pub add super_tabs
```

Import the Package

```dart
import 'package:super_tabs/super_tabs.dart';
```

## Usage

```dart
  int selectedIndex = 0;
```

```dart
 SuperTabs(
    list: const [
    "Current",
    "Completed",
    "Cancelled",
    ],
    selectedColor: Colors.indigo,
    unselectedColor: Colors.white,
    selectedIndex: selectedIndex,
    onClick: (int value) {
    setState(() {
        selectedIndex = value;
    });
    },
),
```

## Additional information

This package can be use to change between the segments with a beautiful Super Tab.
If you have any issue with the package you can create an issue in Github.
