part of 'main_widget.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({
    super.key,
  });

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Column(
        children: [
          const Text("Pengumuman Terkini"),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              if (state is EventGetEventSuccessState) {
                if (state.listEvents.isNotEmpty) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                    ),
                    ///Add date check for newest event within 7days
                    child: ListView.builder(
                      shrinkWrap: false,
                      padding: EdgeInsets.zero,
                      itemCount: state.listEvents.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.listEvents[index].eventName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      "Tidak ada pengumuman",
                      style: GoogleFonts.openSans(),
                    ),
                  );
                }
              }
              return Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  "Tidak ada pengumuman",
                  style: GoogleFonts.openSans(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
