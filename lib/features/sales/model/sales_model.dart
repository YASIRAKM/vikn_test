import 'dart:convert';

List<SalesModel> salesModelFromJson(String str) =>
    List<SalesModel>.from(json.decode(str).map((x) => SalesModel.fromJson(x)));

class SalesModel {
  int index;
  String id;
  String voucherNo;
  DateTime date;
  String ledgerName;
  double totalGrossAmtRounded;
  double totalTaxRounded;
  num grandTotalRounded;
  String customerName;
  double totalTax;
  String status;
  num grandTotal;
  bool isBillwised;
  String billwiseStatus;

  SalesModel({
    required this.index,
    required this.id,
    required this.voucherNo,
    required this.date,
    required this.ledgerName,
    required this.totalGrossAmtRounded,
    required this.totalTaxRounded,
    required this.grandTotalRounded,
    required this.customerName,
    required this.totalTax,
    required this.status,
    required this.grandTotal,
    required this.isBillwised,
    required this.billwiseStatus,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
        index: json["index"],
        id: json["id"],
        voucherNo: json["VoucherNo"],
        date: DateTime.parse(json["Date"]),
        ledgerName: json["LedgerName"],
        totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
        totalTaxRounded: json["TotalTax_rounded"]?.toDouble(),
        grandTotalRounded: json["GrandTotal_Rounded"],
        customerName: json["CustomerName"],
        totalTax: json["TotalTax"]?.toDouble(),
        status: json["Status"],
        grandTotal: json["GrandTotal"],
        isBillwised: json["is_billwised"],
        billwiseStatus: json["billwise_status"],
      );
}
