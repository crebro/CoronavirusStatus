class StringService {
  String putCommasOnStringInt(String text) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return text.replaceAllMapped(reg, (Match match) => '${match[1]},');
  }
}
