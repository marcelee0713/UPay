import 'package:citefest/constants/colors.dart';
import 'package:citefest/widgets/universal/sub_section_info.dart';
import 'package:citefest/widgets/universal/user_status_bar.dart';
import 'package:citefest/widgets/vouchers/voucher_box.dart';
import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          HeaderBar(
            subText: "spend wise and use",
            headText: "Your Vouchers",
            onPressProfile: () {},
            onPressNotif: () {},
          ),
          const SizedBox(height: 20),
          const SubSectionInfo(
            iconPath: "assets/images/icons/coins.png",
            leftHeadText: "Top Up now",
            leftSubText: "earn more rewards",
            rightHeadText: "up to 50% off",
            rightSubText: "no minimum spend",
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Academic Vouchers",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 178,
                child: ListView.builder(
                  itemCount: acadVouchs().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return VoucherBox(
                      headText: acadVouchs()[index].headText,
                      desc: acadVouchs()[index].desc,
                      holder: acadVouchs()[index].holderName,
                      imagePath: "assets/images/icons/worktimecuate-1.png",
                      onTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Non-Academic Vouchers",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 178,
                child: ListView.builder(
                  itemCount: nonAcadVouchs().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return VoucherBox(
                      headText: nonAcadVouchs()[index].headText,
                      desc: nonAcadVouchs()[index].desc,
                      holder: nonAcadVouchs()[index].holderName,
                      imagePath: "assets/images/icons/selfcheckoutriki-1.png",
                      onTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Non-Academic Vouchers",
                style: TextStyle(
                  color: ColorPalette.accentBlack,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 178,
                child: ListView.builder(
                  itemCount: inAppVouchers().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return VoucherBox(
                      headText: inAppVouchers()[index].headText,
                      desc: inAppVouchers()[index].desc,
                      holder: inAppVouchers()[index].holderName,
                      imagePath: "assets/images/icons/creditcardcuate-1.png",
                      onTap: () {},
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<VoucherType> acadVouchs() {
    List<VoucherType> list = [
      VoucherType("PHINMA-UPANG", "10% off", "any academic related fees."),
      VoucherType("PHINMA-UPANG", "10% off", "any academic related fees."),
      VoucherType("PHINMA-UPANG", "10% off", "any academic related fees."),
    ];
    return list;
  }

  List<VoucherType> nonAcadVouchs() {
    List<VoucherType> list = [
      VoucherType(
          "Student Plaza", "25% off", "on any food products at Student Plaza."),
      VoucherType(
          "Student Plaza", "25% off", "on any food products at Student Plaza."),
      VoucherType(
          "Student Plaza", "25% off", "on any food products at Student Plaza."),
    ];
    return list;
  }

  List<VoucherType> inAppVouchers() {
    List<VoucherType> list = [
      VoucherType("UPay", "Free transaction fee", "on any UPay Transactions."),
      VoucherType("UPay", "Free transaction fee", "on any UPay Transactions."),
      VoucherType("UPay", "Free transaction fee", "on any UPay Transactions."),
    ];
    return list;
  }
}

// Custom data structure to hold voucher information
class VoucherType {
  final String holderName;
  final String headText;
  final String desc;

  VoucherType(this.holderName, this.headText, this.desc);
}
