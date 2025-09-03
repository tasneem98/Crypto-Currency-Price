// Extension of double to percent change to remove the down sign
extension PercentChangeExtension on double {
  String get percentChange => abs().toString();
}
