import 'package:flutter/material.dart';
import 'package:sommelio/config/app-colors.dart';
import 'package:sommelio/models/resumeevent.dart';

class ResumeEventCase extends StatelessWidget {
  final ResumeEvent resumeEvent;
  final int index;

  const ResumeEventCase(
      {Key? key, required this.resumeEvent, required this.index})
      : super(key: key);

  // Méthode pour obtenir les couleurs en fonction de l'index
  Map<String, Color> getColorsByIndex(int index) {
    switch (index) {
      case 0:
        return {
          'background': AppColors.blue,
          'date': AppColors.yellow,
          'text': AppColors.white,
        };
      case 1:
        return {
          'background': AppColors.white,
          'date': AppColors.pink,
          'text': AppColors.black,
        };
      case 2:
        return {
          'background': AppColors.green,
          'date': AppColors.red,
          'text': Colors.white,
        };
      default:
        return {
          'background': AppColors.white,
          'date': Colors.black,
          'text': Colors.black,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = getColorsByIndex(index);

    return Container(
      height: 121,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors['background'],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resumeEvent.date,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colors['date'],
                ),
              ),
              const Spacer(),
              Text(
                resumeEvent.companyName,
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  color: colors['text'],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                resumeEvent.description,
                style: TextStyle(
                  fontSize: 12,
                  color: colors['text'],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.location_on, color: colors['text']),
                  const SizedBox(width: 5),
                  Text(
                    resumeEvent.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: colors['text'],
                    ),
                  ),
                ],
              )
            ],
          ),
          Image.asset(
            resumeEvent.pictureUrl != null
                ? "assets/Photos/${resumeEvent.pictureUrl}.webp"
                : "assets/other/eventWine.png",
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
