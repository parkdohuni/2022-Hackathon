class NavItem {
  final int id;
  final String icon;
  final String label;

  NavItem({required this.label, required this.id, required this.icon});
}

List<NavItem> navItems = [
  NavItem(id: 0, label: "미세먼지", icon: "assets/icons/face-mask-svgrepo-com.svg"),
  NavItem(id: 1, label: "추천장소", icon: "assets/icons/location.png"),
  NavItem(id: 2, label: "예스키즈존", icon: "assets/icons/baby-boy.png"),
];