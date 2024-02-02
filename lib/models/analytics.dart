class AnalyticsData {
  String label;
  int amount;

  AnalyticsData(
    this.label,
    this.amount,
  );

  // Getter for amount
  int get _amount => amount;

  // Setter for amount
  set _amount(int value) {
    amount = value;
  }
}

class Analytics {
  final List<AnalyticsData> monthlyExpenses;
  final List<AnalyticsData> dailyExpenses;
  final List<AnalyticsData> monthlyIncome;
  final List<AnalyticsData> dailyIncome;

  Analytics(
      {required this.monthlyExpenses,
      required this.dailyExpenses,
      required this.monthlyIncome,
      required this.dailyIncome});
}
