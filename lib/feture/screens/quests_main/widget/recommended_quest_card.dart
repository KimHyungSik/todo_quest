import 'package:flutter/material.dart';

import '../../../../models/quest/quest.dart';

Widget recommendedQuestCard(
  Quest quest,
  Function(Quest) onQuestClick,
) {
  return GestureDetector(
    onTap: () => onQuestClick(quest),
    child: Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quest title
            Text(
              quest.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),

            if (quest.categoriesList?.first.name != null)
              Text(
                quest.categoriesList!.first.name,
                style: const TextStyle(fontSize: 10),
              ),

            const SizedBox(height: 2),

            // Quest description
            if (quest.description != null) Text(quest.description!),
            const SizedBox(height: 8),

            // Display reward title if available
            if (quest.rewardTitle != null)
              Text(
                '보상: ${quest.rewardTitle!.name}',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),

            // Show quest categories if available
            if (quest.categoriesList != null &&
                quest.categoriesList!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 8,
                  children: quest.categoriesList!.map((category) {
                    return Chip(
                      label: Text(category.name),
                      backgroundColor: Colors.blue.shade100,
                      labelStyle: const TextStyle(fontSize: 12),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
