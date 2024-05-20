import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';

class SortBar extends StatelessWidget {
  const SortBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sortProvider = Provider.of<SortProvider>(context);

    Icon getSortIcon(SortCriteria criteria) {
      if (sortProvider.criteria == criteria) {
        return sortProvider.ascending
            ? const Icon(Icons.arrow_upward, size: 14)
            : const Icon(Icons.arrow_downward, size: 14);
      } else {
        return const Icon(Icons.sort, size: 14);
      }
    }

    Widget buildSortButton(String text, SortCriteria criteria, int flex) {
      return Expanded(
        flex: flex,
        child: TextButton(
          onPressed: () {
            sortProvider.setCriteria(criteria);
            sortProvider.toggleSortOrder();
          },
          style: TextButton.styleFrom(alignment: Alignment.center),
          child: Row(
            children: [
              Flexible(
                // fit: FlexFit.tight,
                child: RichText(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text,
                        style: TextStyle(
                          fontWeight: sortProvider.criteria == criteria
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      WidgetSpan(
                        child: getSortIcon(criteria),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10),
        buildSortButton('Lab №', SortCriteria.labNumber, 125),
        buildSortButton('Name', SortCriteria.name, 444),
        buildSortButton('Group', SortCriteria.group, 193),
        buildSortButton('Date', SortCriteria.date, 203),
        const SizedBox(width: 60),
      ],
    );
  }
}