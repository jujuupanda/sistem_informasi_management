import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/bloc/event/event_bloc.dart';
import '../../../routes/name_routes.dart';
import '../../widgets/general/general_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late EventBloc _eventBloc;

  _getEventForUser() {
    _eventBloc = context.read<EventBloc>();
    _eventBloc.add(EventGetEventForUserEvent());
  }

  ///TODO: Add feature filter for list events
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
                      "Pengumuman",
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
            child: RefreshIndicator(
              onRefresh: () async {
                return await Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    _getEventForUser();
                  },
                );
              },
              child: BlocBuilder<EventBloc, EventState>(
                builder: (context, state) {
                  if (state is EventLoadingState) {
                    return const Center(
                      child: LoadingWidget(),
                    );
                  }
                  if (state is EventGetEventSuccessState) {
                    final listEvents = state.listEvents;
                    return ListView.builder(
                      itemCount: listEvents.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Card.outlined(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listEvents[index].eventName!,
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Dibuat oleh ${listEvents[index].author} - ${listEvents[index].date}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    listEvents[index].eventData!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Gap(10),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            context.pushNamed(
                                              Routes.detailEvent,
                                              extra: listEvents[index],
                                            );
                                          },
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Center(
                                            child: Text(
                                              "Baca Selengkapnya",
                                              style: GoogleFonts.openSans(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: LoadingWidget(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
