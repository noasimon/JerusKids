import 'package:latlong/latlong.dart';
// import 'package:flutter/material.dart';
// import 'category.dart';

// final List<Entry> playgrounds = <Entry>[
//   Entry(
//     'מתקנים',
//     <Entry>[
//       Entry(
//         'נדנדות',
//         <Entry>[
//           Entry('נדנדות בטיחותיות לקטנטנים'),
//           Entry('נדנדות לגדולים'),
//         ],
//       ),
//       Entry(
//         'מגלשות',
//         <Entry>[
//           Entry('מגלשות קטנות'),
//           Entry('מגלשות גדולות'),
//         ],
//       ),
//       Entry('סולם חבלים'),
//     ],
//   ),
// ];

Map<String, LatLng> getCoords() {
  Map<String, LatLng> coords = new Map<String, LatLng>();

  coords.putIfAbsent("PgShimoni", () => new LatLng(31.763725, 35.202158));
  coords.putIfAbsent("PgMichvar", () => new LatLng(31.756790, 35.203533));
  coords.putIfAbsent("PgPillbox", () => new LatLng(31.769325, 35.209223));
  coords.putIfAbsent(
      "PgIndian", () => new LatLng(31.763284290363973, 35.20306830679631));
  coords.putIfAbsent(
      "PgNayot", () => new LatLng(31.76753104751292, 35.20434556986857));
  coords.putIfAbsent(
      "PgGmordehay", () => new LatLng(31.762200789621254, 35.19934961541523));
  coords.putIfAbsent(
      "PgOnya", () => new LatLng(31.7526622923245, 35.193738713758236));
  coords.putIfAbsent(
      "PgPalmach", () => new LatLng(31.767148376393383, 35.208673253673744));
  coords.putIfAbsent(
      "PgGonenim", () => new LatLng(31.755158288853853, 35.20962092162882));
  return coords;
}
