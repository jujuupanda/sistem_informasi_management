import 'package:flutter/material.dart';

import '../../../data/models/event_model.dart';
import '../../widgets/event/event_widget.dart';
import '../../widgets/general/general_widget.dart';

class DetailEventPage extends StatefulWidget {
  final EventModel eventModel;

  const DetailEventPage({
    super.key,
    required this.eventModel,
  });

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPage(name: "Detail Pengumuman"),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DetailEventCard(widget: widget),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
