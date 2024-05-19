import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';

class SortBar extends StatelessWidget {
  const SortBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sortProvider = Provider.of<SortProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: TextButton(
            onPressed: () => sortProvider.setCriteria(SortCriteria.labNumber),
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            child: Text(
              'Lab Number',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: sortProvider.criteria == SortCriteria.labNumber
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: TextButton(
            onPressed: () => sortProvider.setCriteria(SortCriteria.name),
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            child: Text(
              'Name',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: sortProvider.criteria == SortCriteria.name
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextButton(
            onPressed: () => sortProvider.setCriteria(SortCriteria.group),
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            child: Text(
              'Group',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: sortProvider.criteria == SortCriteria.group
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextButton(
            onPressed: () => sortProvider.setCriteria(SortCriteria.date),
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            child: Text(
              'Date',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: sortProvider.criteria == SortCriteria.date
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}