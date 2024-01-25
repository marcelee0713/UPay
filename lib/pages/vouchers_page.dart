import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  // Custom data structure to hold voucher information
  List<VoucherType> voucherTypes = [
    VoucherType('Academic Voucher', ['Voucher 1', 'Voucher 2', 'Voucher 3']),
    VoucherType('Non-Academic Voucher', ['Voucher A', 'Voucher B', 'Voucher C', 'Voucher D']),
    VoucherType('In-App Voucher', ['Voucher X', 'Voucher Y']),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Small static container at the top
          Container(
            height: 150,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Static Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Scrollable container at the bottom half
          Expanded(
            child: ListView.builder(
              itemCount: voucherTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Voucher Type Container
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        voucherTypes[index].name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Voucher List within Voucher Type
                    Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: voucherTypes[index].vouchers.length,
                        itemBuilder: (BuildContext context, int subIndex) {
                          return GestureDetector(
                            onTap: () {
                              // Handle tap on voucher
                              print('Tapped on ${voucherTypes[index].name}, ${voucherTypes[index].vouchers[subIndex]}');
                            },
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.all(8),
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  voucherTypes[index].vouchers[subIndex],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom data structure to hold voucher information
class VoucherType {
  final String name;
  final List<String> vouchers;

  VoucherType(this.name, this.vouchers);
}
