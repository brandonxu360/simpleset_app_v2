// DATE TIME CONVERSION FUNCTIONS
String dateTimeToString(DateTime dateTime) {
  String month = dateTime.month.toString().padLeft(2, '0');
  String day = dateTime.day.toString().padLeft(2, '0');
  String year = (dateTime.year % 100)
      .toString()
      .padLeft(2, '0'); // Extract last two digits
  return '$month/$day/$year';
}
