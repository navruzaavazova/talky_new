enum AppIcons {
  googleIcon('assets/icons/iconGoogle.svg'),
  chevronBack('assets/icons/iconBack.svg'),
  eyesOff('assets/icons/eyesOff.svg'),
  eyes('assets/icons/eyes.svg'),
  emailIcon('assets/icons/iconsEmail.svg'),
  profileIcon('assets/icons/User.svg'),
  profileEdit('assets/icons/Edit.svg'),

  //Chats list
  chevronRight('assets/icons/chatlist/Chevron.svg'),
  floatingMenu('assets/icons/chatlist/FloatingMenu.svg'),
  userIcon('assets/icons/chatlist/User.svg'),
  groupChatIcon('assets/icons/chatlist/Group.svg'),
  search('assets/icons/chatlist/Search.svg'),

  //Chat Room
  closeAttachment('assets/icons/chat/Close.svg'),
  camera('assets/icons/chat/Camera.svg'),
  voiceMessage9('assets/icons/chat/Microphone.svg'),
  moreAttachment('assets/icons/chat/More.svg'),
  sendFile('assets/icons/chat/Attachment.svg'),
  sendMessage('assets/icons/chat/Send.svg');

  const AppIcons(this.icon);
  final String icon;
}
