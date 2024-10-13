enum AppIcons {
  googleIcon('assets/icons/iconGoogle.svg'),
  chevronBack('assets/icons/iconBack.svg'),
  eyesOff('assets/icons/eyesOff.svg'),
  eyes('assets/icons/eyes.svg'),
  emailIcon('assets/icons/iconsEmail.svg'),
  profileIcon('assets/icons/User.svg'),
  profileEdit('assets/icons/Edit.svg'),


  //Chat and list
  chevronRight('assets/icons/chatlist/Chevron.svg'),
  floatingMenu('assets/icons/chatlist/FloatingMenu.svg'),
  userIcon('assets/icons/chatlist/User.svg'),
  groupChatIcon('assets/icons/chatlist/Group.svg'),
  search('assets/icons/chatlist/Search.svg');

  const AppIcons(this.icon);
  final String icon;
}
