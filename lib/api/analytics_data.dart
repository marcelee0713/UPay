import 'package:citefest/api/transactions.dart';
import 'package:citefest/models/analytics.dart';
import 'package:citefest/models/transactions.dart';
import 'package:intl/intl.dart';

Future<Analytics> getAllData({required String uid}) async {
  Analytics data = Analytics(
    dailyExpenses: [],
    dailyIncome: [],
    monthlyExpenses: [],
    monthlyIncome: [],
  );
  try {
    TransactionsRes? transactions = await apiGetTransactions(uid: uid);

    if (transactions != null && transactions.list.isNotEmpty) {
      List<TransactionModel> list = transactions.list;

      List<AnalyticsData> monthlyExpenses = [];

      for (var transaction in list) {
        if (transaction.amountType == "decrease") {
          bool had = false;
          String month = transaction.createdAt.split(' ')[0];

          // If that month is already an element at the current list;
          if (monthlyExpenses.isNotEmpty) {
            for (var expense in monthlyExpenses) {
              if (expense.label == month) {
                expense.amount += int.parse(transaction.amount);
                had = true;
              }
            }
          }

          if (!had) {
            // Now prevent this if the above code is true
            AnalyticsData monthData =
                AnalyticsData(month, int.parse(transaction.amount));

            monthlyExpenses.add(monthData);
          }
        }
      }

      List<AnalyticsData> dailyExpenses = await getDailyExpensesData(uid: uid);

      // TODO: Get Incomes Data
    }

    return data;
  } catch (err) {
    throw err.toString();
  }
}

Future<List<AnalyticsData>> getDailyExpensesData({required String uid}) async {
  List<AnalyticsData> dailyExpenses = [];

  try {
    TransactionsRes? transactions = await apiGetTransactions(uid: uid);
    if (transactions != null && transactions.list.isNotEmpty) {
      List<TransactionModel> list = transactions.list;

      DateTime currentDate = DateTime.now();

      for (int i = 0; i < 7; i++) {
        DateTime currentDay = currentDate.subtract(Duration(days: i));
        String formattedDate = DateFormat('MMM d yyyy').format(currentDay);

        int amountHolder = 0;
        String day = DateFormat('E').format(currentDay);

        for (var transaction in list) {
          if (transaction.createdAt == formattedDate &&
              transaction.amountType == "decrease") {
            amountHolder += int.parse(transaction.amount);
          }
        }

        AnalyticsData obj = AnalyticsData(day, amountHolder);
        dailyExpenses.add(obj);
      }
    }

    return dailyExpenses;
  } catch (err) {
    throw err.toString();
  }
}
