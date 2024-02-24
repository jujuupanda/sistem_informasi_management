import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc/event/event_bloc.dart';
import '../../widgets/event/event_widget.dart';
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
          const HeaderPage(
            name: "Pengumuman",
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
                          child: EventCard(
                            listEvents: listEvents[index],
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
