String timeDifference(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays >= 1) {
    return '${difference.inDays} days';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} hours';
  } else {
    return '<1 hour';
  }
}
