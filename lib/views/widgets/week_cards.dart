import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'common_count_widget.dart';

Widget weekCardWidget({
  required DateTime day,
  int totalCount = 10,
  int hrdCount = 3,
  int teach1Count = 2,
  int followUpCount = 5,
  required List<String> allTabs,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 4,
    ),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 2,
            height: 40,
            color: Colors.red.shade800,
          ),
          const SizedBox(width: 8),
          Text(
            // 24 Mar
            DateFormat('dd MMM').format(day).split(" ").join("\n").toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CommonCountWidget(
            name: allTabs[1],
            count: hrdCount,
          ),
          const Spacer(),
          CommonCountWidget(
            name: allTabs[2],
            count: teach1Count,
          ),
          const Spacer(),
          CommonCountWidget(
            name: allTabs[3],
            count: followUpCount,
          ),
          const Spacer(),
          CommonCountWidget(
            fillColor: Colors.grey.shade600,
            name: "Total",
            count: totalCount,
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
