import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/utils/custom_color.dart';
import '../../../../../../domain/local_data_base/data_base_repository.dart';
import '../model/audit_response.dart';

class AuditDetailsScreen extends StatefulWidget {
  const AuditDetailsScreen({super.key});

  @override
  State<AuditDetailsScreen> createState() => _AuditDetailsScreenState();
}

class _AuditDetailsScreenState extends State<AuditDetailsScreen> {
  final DateFormat inputFormatter = DateFormat("yyyy-MM-DDThh:mm:ss");
  final DateFormat outputFormatter = DateFormat("yyyy-MM-DD, hh:mm aa");
  List<Data> list = [];

  @override
  void initState() {
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return (list.length == 0)
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "No Audits available right now.\n Go to Update Details screen and update.",
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColor.black, fontSize: 14),
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              Data item = list[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.name ?? "",
                      style: const TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Branch:   ${item.branchName ?? "n/a"}",
                      style: const TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Start Date:   ${getDisplayFormat(item.startedDate ?? "")}",
                      style: const TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Closing Taken:   ${getDisplayFormat(item.closingTakenDateTime ?? "")}",
                      style: const TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last Billed Invoice:   ${item.lastBilledInvoNumber ?? "n/a"}",
                      style: const TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: CustomColor.textGrey,
                    )
                  ],
                ),
              );
            },
            itemCount: list.length,
          );
  }

  void updateList() async {
    list.clear();
    AuditResponse? auditResponse = await DatabaseRepository().getAuditData();
    list.addAll(auditResponse?.data ?? []);
    setState(() {});
  }

  String getDisplayFormat(String s) {
    try {
      return outputFormatter.format(inputFormatter.parse(s));
    } catch (e) {
      print("Exception :${e.toString()}");
      return "n/a";
    }
  }
}
