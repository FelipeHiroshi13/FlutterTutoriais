import 'package:flutter/material.dart';

class TaskSummarySliverAppBar extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;
  final int inProgressTasks;
  final int pendingTasks;

  const TaskSummarySliverAppBar({
    super.key,
    required this.totalTasks,
    required this.completedTasks,
    required this.inProgressTasks,
    required this.pendingTasks,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 200,
      expandedHeight: 200,
      pinned: true,
      floating: true,
      backgroundColor: Colors.deepPurple,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TaskInfo(
                    label: 'Total',
                    count: totalTasks,
                    color: Colors.white,
                  ),
                  _TaskInfo(
                    label: 'Concluídas',
                    count: completedTasks,
                    color: Colors.greenAccent,
                  ),
                  _TaskInfo(
                    label: 'Em andamento',
                    count: inProgressTasks,
                    color: Colors.amberAccent,
                  ),
                  _TaskInfo(
                    label: 'Pendentes',
                    count: pendingTasks,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskInfo extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _TaskInfo({
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(
            fontSize: 24,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
