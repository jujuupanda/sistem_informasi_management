import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/event_model.dart';

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
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    context.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Detail Pengumuman",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    Icons.settings_rounded,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(8),
                    Text(
                      widget.eventModel.eventName!,
                      style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      "Dibuat oleh ${widget.eventModel.author!} - ${widget.eventModel.date!}",
                      style: GoogleFonts.openSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(
                      height: 8,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const Gap(10),
                    Text(
                      widget.eventModel.eventData!,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
