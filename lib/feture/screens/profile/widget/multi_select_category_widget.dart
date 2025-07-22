import 'package:flutter/material.dart';
import '../../../../models/quest/category/quest_category.dart';

class MultiSelectCategoryWidget extends StatelessWidget {
  final List<QuestCategory> categories;
  final List<QuestCategory> selectedCategories;
  final Function(QuestCategory) onCategoryToggle;
  final VoidCallback? onSelectAll;
  final VoidCallback? onClearAll;

  const MultiSelectCategoryWidget({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.onCategoryToggle,
    this.onSelectAll,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '관심 카테고리',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: onSelectAll,
                  child: const Text('전체 선택'),
                ),
                TextButton(
                  onPressed: onClearAll,
                  child: const Text('전체 해제'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Selection counter
        Text(
          '${selectedCategories.length}개 카테고리 선택됨',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        
        // Category chips
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: categories.map((category) {
            final isSelected = selectedCategories.any((c) => c.id == category.id);
            
            return _buildCategoryChip(
              context,
              category: category,
              isSelected: isSelected,
              onTap: () => onCategoryToggle(category),
            );
          }).toList(),
        ),
        
        // Description text
        if (selectedCategories.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '선택한 카테고리는 퀘스트 추천에 우선적으로 반영됩니다.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCategoryChip(
    BuildContext context, {
    required QuestCategory category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? Theme.of(context).colorScheme.primary 
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
                ? Theme.of(context).colorScheme.primary 
                : Theme.of(context).colorScheme.outline,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              Icon(
                Icons.check_circle,
                size: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected 
                    ? Theme.of(context).colorScheme.onPrimary 
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}