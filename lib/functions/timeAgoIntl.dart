// ignore_for_file: file_names

import 'package:timeago/timeago.dart' as timeago;

class TimeAgoIntlMessages implements timeago.LookupMessages {
  final String locale;

  TimeAgoIntlMessages(this.locale);

  String _prependWith(String word, int n) {
    return '$n $word';
  }

  @override
  String prefixAgo() => 'منذ';

  @override
  String prefixFromNow() => 'من الآن';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String wordSeparator() => ' ';

  @override
  String lessThanOneMinute(int seconds) => 'ثوانٍ';

  @override
  String aboutAMinute(int minutes) => _prependWith('دقيقة', minutes);

  @override
  String minutes(int minutes) => _prependWith('دقائق', minutes);

  @override
  String aboutAnHour(int minutes) => 'ساعة';

  @override
  String hours(int hours) => _prependWith('ساعات', hours);

  @override
  String aDay(int hours) => 'يوم';

  @override
  String days(int days) => _prependWith('أيام', days);

  @override
  String aboutAMonth(int days) => 'شهر';

  @override
  String months(int months) => _prependWith('أشهر', months);

  @override
  String aboutAYear(int year) => 'سنة';

  @override
  String years(int years) => _prependWith('سنوات', years);
}
