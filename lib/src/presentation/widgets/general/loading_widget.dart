part of 'general_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0x4DD5D5D5),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
          strokeWidth: 5,
        ),
      ),
    );
  }
}
