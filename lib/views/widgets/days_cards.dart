import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

Widget daysCardWidget(Map<String, dynamic> data, BuildContext context) {
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
        horizontal: 12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${data["id"]}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Offered: ${data["octc"]}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Current: ${data["ctc"]}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // IconButton for call
              IconButton(
                onPressed: () async {
                  final call = Uri.parse('tel:${data["mobile"]}');
                  if (await canLaunchUrl(call)) {
                    launchUrl(call);
                  } else {
                    throw 'Could not launch $call';
                  }
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // due date: 24 Mar 23
                'Due Date\n${DateFormat('dd MMM yy').format(DateTime.parse(data["due_date"]))}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                // level: 10
                'Level\n${data["level"]}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Days left: now - due date
              Text(
                'Days Left\n${DateTime.parse(data["due_date"]).difference(DateTime.now()).inDays}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
