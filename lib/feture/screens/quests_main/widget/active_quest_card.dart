import 'package:flutter/material.dart';
import '../../../../models/user/user_quest/user_quest.dart';
import '../../../../utils/quest_time_calculator.dart';

Widget activeQuestCard(UserQuestInfo userQuest, Function(UserQuestInfo) onTap) {
  final timeInfo = QuestTimeCalculator.calculateQuestTime(userQuest);
  final timeColor = _getTimeStatusColor(timeInfo.timeStatusColor);
  
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: InkWell(
      onTap: () => onTap(userQuest),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quest title and status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userQuest.questTitle,
                        style: const TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (userQuest.questDescription != null)
                        Text(
                          userQuest.questDescription!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Status indicator
                _buildStatusChip(userQuest.userQuestStatus ?? 'active'),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Quest information
            Row(
              children: [
                // Difficulty indicator
                if (userQuest.difficulty != null) ...[
                  Icon(
                    Icons.bar_chart,
                    size: 16,
                    color: Colors.orange.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    userQuest.difficultyDisplayLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
                
                // Duration and time information
                Icon(
                  timeInfo.isExpired ? Icons.warning : Icons.schedule,
                  size: 16,
                  color: timeColor,
                ),
                const SizedBox(width: 4),
                Text(
                  timeInfo.shortRemainingTime,
                  style: TextStyle(
                    fontSize: 12,
                    color: timeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            // Time progress bar
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: timeInfo.progressPercentage.clamp(0.0, 1.0),
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(timeColor),
                    minHeight: 4,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(timeInfo.progressPercentage * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 11,
                    color: timeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            
            // Reward information
            if (userQuest.rewardsExp > 0) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '보상: ${userQuest.rewardsExp} EXP',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.amber.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    ),
  );
}

Widget _buildStatusChip(String status) {
  Color backgroundColor;
  Color textColor;
  String displayText;
  
  switch (status.toLowerCase()) {
    case 'in_progress':
    case 'active':
    case '진행중':
      backgroundColor = Colors.blue.shade100;
      textColor = Colors.blue.shade700;
      displayText = '진행중';
      break;
    case 'paused':
    case '일시정지':
      backgroundColor = Colors.orange.shade100;
      textColor = Colors.orange.shade700;
      displayText = '일시정지';
      break;
    case 'pending':
    case '대기중':
      backgroundColor = Colors.grey.shade100;
      textColor = Colors.grey.shade700;
      displayText = '대기중';
      break;
    case 'completed':
    case '완료':
      backgroundColor = Colors.green.shade100;
      textColor = Colors.green.shade700;
      displayText = '완료';
      break;
    default:
      backgroundColor = Colors.grey.shade100;
      textColor = Colors.grey.shade700;
      displayText = status;
  }
  
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      displayText,
      style: TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Color _getTimeStatusColor(TimeStatusColor timeStatusColor) {
  switch (timeStatusColor) {
    case TimeStatusColor.normal:
      return Colors.green;
    case TimeStatusColor.warning:
      return Colors.orange;
    case TimeStatusColor.urgent:
      return Colors.red.shade600;
    case TimeStatusColor.expired:
      return Colors.red.shade800;
  }
}