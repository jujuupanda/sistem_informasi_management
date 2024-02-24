part of 'main_widget.dart';

class UserInfoMain extends StatelessWidget {
  final String? name;
  final String? noId;
  final String? className;

  const UserInfoMain({
    this.name,
    this.noId,
    this.className,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name == "" ? "Nama Pengguna" : name!,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          noId == "" ? "No ID/Pengenal" : noId!,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          className == "" ? "Jurusan/Kelas" : className!,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
