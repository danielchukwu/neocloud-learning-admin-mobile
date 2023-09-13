

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';


class ClassGetXController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var scrollController = ScrollController().obs;

  // Mock Data
  RxList<FacultyModel> facultiesToSelectFrom = List.generate(15, (index) => FacultyModel(id: '$index', name: 'Cyber Security')).obs;
  RxList<UserModel> usersToSelectFrom = List.generate(15, (index) => UserModel(id: '$index', name: 'John Default', avatar: defaultProfileAvatar)).obs;

  // Fields
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  Rx<File?> coverImgFile = null.obs;
  RxList<FacultyModel> selectedFaculties = RxList();
  RxList<UserModel> selectedEducatorsList = RxList();
  RxList<ClassModuleModel> modules = RxList();

  // error handling variables
  RxBool coverImgFileHasError = false.obs;
  RxBool hodHasError = false.obs;
  RxBool educatorsListHasError = false.obs;
  RxBool modulesHasError = false.obs;
  RxString modulesErrorMessage = ''.obs;

  RxBool isSubmittingForm = false.obs;

  // features enabling variables
  RxBool enableAddModules = false.obs;
  RxBool enableAddSchedules = false.obs;
  RxBool enableAutomateDateTime = false.obs;
  RxBool enableUpdateTitle = false.obs;

  // form schedule tiles
  RxBool enableSetDateAndTime = false.obs;
  RxBool enableAddScheduleDescription = false.obs;
  RxBool enableAddScheduleClasswork = false.obs;
  RxBool enableUpdateScheduleDescription = false.obs;
  RxBool enableUpdateScheduleClasswork = false.obs;

  updateSelectedEducators(List<UserModel> users) {
    selectedEducatorsList = users.obs;
  }

  updateSelectedFaculty(List<FacultyModel> fac) {
    selectedFaculties = fac.obs;
  }

  // Modules
  updateModule(int index, ClassModuleModel newModule) {
    if (newModule.title.isNotEmpty) {
      modules[index] = newModule;
    }
  }

  deleteModule(index) {
    modules.removeAt(index);
    modules = [...modules.value].obs;
  }

  void addModule(ClassModuleModel module) {
    modules.add(module);
  }

  void setModules(List<ClassModuleModel> newModule) {
    modules = newModule.obs;
  }

  // Class form
  bool createClassFormDataIsValid() {
    // cover must be provided
    if (coverImgFile == null) {
      coverImgFileHasError = true.obs;
      return false;
    }
    coverImgFileHasError = false.obs;

    // a faculty must be provided
    if (selectedFaculties.isEmpty) {
      hodHasError = true.obs;
      return false;
    }
    hodHasError = false.obs;

    // atleast 1 educator must be provided
    if (selectedEducatorsList.isEmpty) {
      educatorsListHasError = true.obs;
      return false;
    }
    educatorsListHasError = false.obs;

    // modules must be provided (at least 3)
    if (modules.isEmpty || modules.length < 3) {
      modulesHasError = true.obs; 
      modulesErrorMessage = 'At least 3 modules must be added'.obs;
      return false;
    } 
    modulesHasError = false.obs; 
    modulesErrorMessage = ''.obs;

    // All modules must have at least 1 schedule in them
    for (var module in modules) {
      if (module.classSchedules == null || module.classSchedules != null && module.classSchedules!.isEmpty) {
        modulesErrorMessage = 'All specified modules should have at least 1 schedule added'.obs;
        modulesHasError = true.obs;
        return false;
      }
    }
    modulesErrorMessage = ''.obs;
    modulesHasError = false.obs;

    return true;
  }

  Future<void> submitCreateClassForm() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  // RESET
  reset() {
    formKey = GlobalKey<FormState>().obs;
    scrollController = ScrollController().obs;

    // Mock Data
    facultiesToSelectFrom = List.generate(15, (index) => FacultyModel(id: '$index', name: 'Cyber Security')).obs;
    usersToSelectFrom = List.generate(15, (index) => UserModel(id: '$index', name: 'John Default', avatar: defaultProfileAvatar)).obs;

    // Fields
    titleController = TextEditingController().obs;
    descriptionController = TextEditingController().obs;
    coverImgFile = null.obs;
    selectedFaculties = RxList();
    selectedEducatorsList = RxList();
    modules = RxList();

    // error handling variables
    coverImgFileHasError = false.obs;
    hodHasError = false.obs;
    educatorsListHasError = false.obs;
    modulesHasError = false.obs;
    modulesErrorMessage = ''.obs;

    isSubmittingForm = false.obs;

    // features enabling variables
    enableAddModules = false.obs;
    enableAddSchedules = false.obs;
    enableAutomateDateTime = false.obs;
    enableUpdateTitle = false.obs;

    // form schedule tiles
    enableSetDateAndTime = false.obs;
    enableAddScheduleDescription = false.obs;
    enableAddScheduleClasswork = false.obs;
    enableUpdateScheduleDescription = false.obs;
    enableUpdateScheduleClasswork = false.obs;
  }
}