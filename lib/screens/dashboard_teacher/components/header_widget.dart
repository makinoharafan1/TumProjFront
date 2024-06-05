import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/sort_bar_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  Provider.of<SearchProvider>(context, listen: false)
                      .setQuery(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: cardBackgroundColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(mediumCircularRadius),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(mediumCircularRadius),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(mediumCircularRadius),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4,),
        const SortBar(),
        const SizedBox(height: 4),
      ],
    );
  }
}
