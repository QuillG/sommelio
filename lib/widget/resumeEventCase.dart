import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/models/resumeevent.dart';

class ResumeEventCase extends StatelessWidget {
  final ResumeEvent resumeEvent;

  const ResumeEventCase({Key? key, required this.resumeEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                resumeEvent.date,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                resumeEvent.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                resumeEvent.location,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Text(
                resumeEvent.companyName,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}