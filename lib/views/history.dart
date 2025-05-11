import 'package:flutter/material.dart';
import 'package:registration_ieee/const/const_color.dart';
import 'package:registration_ieee/const/const_container.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool scan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("History"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 336,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        scan = true;
                        setState(() {});
                      },
                      child: Container(
                        width: 153.62831115722656,
                        height: 47.77000045776367,
                        child: Center(
                          child: Text(
                            'Scan',
                            style: TextStyle(
                                color: AppColors.secondary, fontSize: 17),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: scan ? AppColors.primary : AppColors.black,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        scan = false;
                        setState(() {});
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            'Attendees',
                            style: TextStyle(
                                color: AppColors.secondary, fontSize: 17),
                          ),
                        ),
                        width: 153.62831115722656,
                        height: 47.77000045776367,
                        decoration: BoxDecoration(
                            color: scan ? AppColors.black : AppColors.primary,
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InfoCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
