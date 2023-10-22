enum PatientTabsEnum {
  overview('Overview', "lib/assets/icons/Folder_file.svg", 'Overview', ["Performance Metrics", "User Engagement"]),
  about('About', "lib/assets/icons/about.svg", 'About', ["Company History", "Mission and Values"]),
  biomarkers('Biomarkers', "lib/assets/icons/bio.svg", 'Biomarkers', ["Blood Test"]),
  risks('Risks', "lib/assets/icons/Chart.svg", 'Risks', ["Market Risks", "Security Concerns"]),
  interventions('Interventions', "lib/assets/icons/Line_alt.svg", 'Interventions', ["Treatment Plans", "Patient Care"]);

  const PatientTabsEnum(this.text, this.iconLocation, this.tabName, this.tabSubCategories);

  final String text;
  final String iconLocation;
  final String tabName;
  final List<String> tabSubCategories;
}


enum MenuTabsEnum {
  home('Home', "lib/assets/icons/Home.svg", 'Home', ["Personal Space", "Comfort and Well-being"]),
  search('Search', "lib/assets/icons/Search.svg", 'Search', ["Keyword Search", "Popular Queries"]),
  chat('Chat', "lib/assets/icons/Chat.svg", 'Chat', ["Group Chats", "Notifications"]);

  const MenuTabsEnum(this.text, this.iconLocation, this.tabName, this.tabSubCategories);

  final String text;
  final String iconLocation;
  final String tabName;
  final List<String> tabSubCategories;
}