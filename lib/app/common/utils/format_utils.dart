String formatCount(int? count) {
  if (count == null) return '0';
  if (count >= 1000000) {
    return '${(count / 1000000).toStringAsFixed(1)}M'; // For millions
  } else if (count >= 1000) {
    return '${(count / 1000).toStringAsFixed(1)}k'; // For thousands
  }
  return count.toString(); // For small numbers
}
