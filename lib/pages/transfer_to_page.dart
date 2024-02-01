import 'package:citefest/widgets/universal/auth/arrow_back.dart';
import 'package:citefest/widgets/universal/auth/auth_info.dart';
import 'package:flutter/material.dart';

class TransferTo extends StatefulWidget {
  const TransferTo({Key? key}) : super(key: key);

  @override
  State<TransferTo> createState() => _TransferToState();
}

class _TransferToState extends State<TransferTo> {
  List<Map<String, dynamic>> organizations = [
    {'name': 'BPI Bank', 'logo': 'assets/images/icons/person1.png'},
    {'name': 'BDO Bank', 'logo': 'assets/images/icons/user.png'},
    {'name': 'Steam Wallet', 'logo': 'assets/images/icons/person1.png'},
    {'name': 'Pay Maya', 'logo': 'assets/images/icons/person1.png'},
    {'name': 'Earth Project', 'logo': 'assets/images/icons/user.png'},
    // Add more banks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
            ArrowBack(onTap: () => Navigator.pop(context)),
            const AuthInfo(
              headText: "Transfer To",
              subText: "reminder that transaction fee increases on daily use frequency",
            ),
            const SizedBox(height: 30),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: organizations.length,
              separatorBuilder: (context, index) => const Divider(), // Add Divider
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    organizations[index]['logo'],
                    width: 50,
                    height: 50,
                  ),
                  title: Text(organizations[index]['name']),
                  trailing: const Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    // Navigate to the transaction page for the selected organization
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionPage(
                          organization: Organization(
                            name: organizations[index]['name'],
                            logo: organizations[index]['logo'],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Organization {
  final String name;
  final String logo;

  Organization({required this.name, required this.logo});
}

class TransactionPage extends StatelessWidget {
  final Organization organization;

  const TransactionPage({Key? key, required this.organization}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ArrowBack(onTap: () => Navigator.pop(context)),
            const AuthInfo(
              headText: "Transfer Money",
              subText: "",
            ),
            const SizedBox(height: 30),
            _buildFormField(title: 'Account Name', hintText: 'Enter Account Name'),
            _buildFormField(title: 'Account Number', hintText: 'Enter Account Number'),
            _buildFormField(title: 'Amount', hintText: 'Enter Amount (Must have no cents)'),
            _buildFormField(title: 'Notes (Optional)', hintText: 'Enter message'),
            const SizedBox(height: 20),
            const Text(' A P10 transaction fee will be charged for this transaction*', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),
            // Add any additional widgets or information here
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your confirmation logic here
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({required String title, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

