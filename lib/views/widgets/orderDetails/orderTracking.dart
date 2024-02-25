// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';
import 'package:timelines/timelines.dart';

class OrderTracking extends StatelessWidget {
  final int orderStatus;
  const OrderTracking({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.circle,
                size: 15,
                color: kPrimaryColor,
              ),
              SizedBox(width: 5),
              Text(
                'تتبع الطلب',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, right: 10.0),
            child: TimelineTile(
              nodePosition: 0,
              contents: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.5, horizontal: 10),
                    child: const Text('في انتظار الموافقة'),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.5, horizontal: 10),
                    child: const Text('في انتظار التوصيل'),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.5, horizontal: 10),
                    child: const Text('تم التوصيل'),
                  ),
                ],
              ),
              node: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TimelineNode(
                      indicator: DotIndicator(
                        color: Colors.green,
                        child: checkIcon(),
                      ),
                      startConnector:
                          const SolidLineConnector(color: Colors.green),
                      endConnector:
                          const SolidLineConnector(color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TimelineNode(
                      indicator: DotIndicator(
                        color: orderStatus >= 1 ? Colors.green : Colors.grey,
                        child: orderStatus >= 1 ? checkIcon() : null,
                      ),
                      startConnector: SolidLineConnector(
                        color: orderStatus >= 1 ? Colors.green : Colors.grey,
                      ),
                      endConnector: SolidLineConnector(
                        color: orderStatus >= 1 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TimelineNode(
                      indicator: DotIndicator(
                        color: orderStatus == 2 ? Colors.green : Colors.grey,
                        child: orderStatus == 2 ? checkIcon() : null,
                      ),
                      startConnector: SolidLineConnector(
                        color: orderStatus == 2 ? Colors.green : Colors.grey,
                      ),
                      endConnector: SolidLineConnector(
                        color: orderStatus == 2 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget checkIcon() {
  return const Icon(
    Icons.check,
    size: 16,
    color: Colors.white,
  );
}
