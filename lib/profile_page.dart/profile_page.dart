import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:talky_new/models/user_data_model.dart';
import 'package:talky_new/providers/firebase_provider.dart';
import 'package:talky_new/providers/image_picker_provider.dart';
import 'package:talky_new/providers/loading_indicator_provider.dart';
import 'package:talky_new/utils/app_colors.dart';
import 'package:talky_new/utils/app_icons.dart';
import 'package:talky_new/utils/app_string.dart';
import 'package:talky_new/utils/auth_mode.dart';
import 'package:talky_new/widgets/custom_app_bar.dart';
import 'package:talky_new/widgets/custom_text_form.dart';
import 'package:talky_new/widgets/sign_in_up_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        func: () {},
        centerText: AppString.profile,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),
          child:
              Consumer3<FirebaseProvider, LoadingProvider, ImagePickerProvider>(
            builder: (context, firebaseProvider, loadProvider, imageProvider,
                child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 95,
                          backgroundColor: AppColors.avatarColor,
                          child: imageProvider.selectedImage == null
                              ? SvgPicture.asset(
                                  AppIcons.profileIcon.icon,
                                  height: 40,
                                )
                              : Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(95)),
                                    child: Image.file(
                                      imageProvider.selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 190,
                                    ),
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: () async {
                              await imageProvider.imagePicker();
                            },
                            icon: SvgPicture.asset(
                              AppIcons.profileEdit.icon,
                            ),
                            iconSize: 24,
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.primaryBlue,
                              ),
                              shape: WidgetStatePropertyAll(
                                CircleBorder(),
                              ),
                            ),
                            constraints:
                                BoxConstraints.tightFor(height: 50, width: 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextForm(
                    controller: nameController,
                    hintText: AppString.enterName,
                    isCorrect: firebaseProvider.isComplete,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextForm(
                    controller: descriptionController,
                    hintText: AppString.enterDescription,
                    isCorrect: firebaseProvider.isComplete,
                  ),
                  const SizedBox(
                    height: 163,
                  ),
                  SignInUpButton(
                    text: AppString.complete,
                    isPressed: loadProvider.isComplete,
                    func: () async {
                      loadProvider.changeState(
                        AuthMode.isComplete,
                      );
                      final uploadImage = await firebaseProvider
                          .imageUpload(imageProvider.selectedImage!);
                      await firebaseProvider.saveUserData(
                        model: UserDataModel(
                            name: nameController.text,
                            description: descriptionController.text,
                            image: uploadImage),
                      );

                      loadProvider.changeState(AuthMode.isComplete);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
