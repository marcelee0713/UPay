import 'package:citefest/api/transactions.dart';
import 'package:citefest/models/analytics.dart';
import 'package:citefest/models/transactions.dart';
import 'package:intl/intl.dart';

Future<List<AnalyticsData>> monthExpensesData({required String uid}) async {
  try {
    TransactionsRes? transactions = await apiGetTransactions(uid: uid);

    List<AnalyticsData> monthlyExpenses = [];

    if (transactions != null && transactions.list.isNotEmpty) {
      List<TransactionModel> list = transactions.list;

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
    }

    return monthlyExpenses;
  } catch (err) {
    throw err.toString();
  }
}

Future<List<AnalyticsData>> monthlyIncomesData({required String uid}) async {
  try {
    TransactionsRes? transactions = await apiGetTransactions(uid: uid);

    List<AnalyticsData> monthlyIncomes = [];

    if (transactions != null && transactions.list.isNotEmpty) {
      List<TransactionModel> list = transactions.list;

      for (var transaction in list) {
        if (transaction.amountType == "increase") {
          bool had = false;
          String month = transaction.createdAt.split(' ')[0];

          // If that month is already an element at the current list;
          if (monthlyIncomes.isNotEmpty) {
            for (var income in monthlyIncomes) {
              if (income.label == month) {
                income.amount += int.parse(transaction.amount);
                had = true;
              }
            }
          }

          if (!had) {
            // Now prevent this if the above code is true
            AnalyticsData monthData =
                AnalyticsData(month, int.parse(transaction.amount));

            monthlyIncomes.add(monthData);
          }
        }
      }
    }

    return monthlyIncomes;
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
    return [];
  }
}

Future<List<AnalyticsData>> getDailyIncomeData({required String uid}) async {
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
              transaction.amountType == "increase") {
            amountHolder += int.parse(transaction.amount);
          }
        }

        AnalyticsData obj = AnalyticsData(day, amountHolder);
        dailyExpenses.add(obj);
      }
    }

    return dailyExpenses;
  } catch (err) {
    return [];
  }
}
