import 'package:intl/intl.dart';

currentTime(DateTime dateTime) {
  // DateTime dateNow = DateTime.now();
  final date = DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
  final parsedDate = date.replaceAllMapped(
    RegExp(
        r'\b(January|February|March|April|May|June|July|August|September|October|November|December|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\b'),
    (Match match) {
      switch (match.group(0)) {
        case 'January':
          return 'Januari';
        case 'February':
          return 'Februari';
        case 'March':
          return 'Maret';
        case 'April':
          return 'April';
        case 'May':
          return 'Mei';
        case 'June':
          return 'Juni';
        case 'July':
          return 'Juli';
        case 'August':
          return 'Agustus';
        case 'September':
          return 'September';
        case 'October':
          return 'Oktober';
        case 'November':
          return 'November';
        case 'December':
          return 'Desember';
        case 'Monday':
          return 'Senin';
        case 'Tuesday':
          return 'Selasa';
        case 'Wednesday':
          return 'Rabu';
        case 'Thursday':
          return 'Kamis';
        case 'Friday':
          return 'Jumat';
        case 'Saturday':
          return 'Sabtu';
        case 'Sunday':
          return 'Minggu';
        default:
          return match.group(0)!;
      }
    },
  );
  return parsedDate;
}
