import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seatController = TextEditingController();

  // EmployeeListController employeeListController =
  //     Get.put(EmployeeListController()); // Register the controller here
  // AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    call();
  }

  void call() async {
    Logger().i("CALLING SHIT");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titlebar(),
              SizedBox(
                height: 10.h,
              ),
              // GetBuilder<EmployeeListController>(
              //   builder: (controller) {
              //     return SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.8260,
              //       child: employeeListController.fetchingData
              //           ? Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     CircularProgressIndicator(
              //                       color: AppTheme.primaryColor,
              //                     )
              //                   ],
              //                 ),
              //               ],
              //             )
              //           : ListView.builder(
              //               itemCount: employeeListController
              //                   .getAssignedEmployeesResponseModel
              //                   .modifiedResult
              //                   .length,
              //               itemBuilder: (context, index) {
              //                 return SeatWidget(
              //                   name:
              //                       "${employeeListController.getAssignedEmployeesResponseModel.modifiedResult[index].firstName} ${employeeListController.getAssignedEmployeesResponseModel.modifiedResult[index].lastName}",
              //                   email: employeeListController
              //                       .getAssignedEmployeesResponseModel
              //                       .modifiedResult[index]
              //                       .email,
              //                   seatNo: employeeListController
              //                       .getAssignedEmployeesResponseModel
              //                       .modifiedResult[index]
              //                       .assetId,
              //                   onEdit: () async {
              //                     await employeeListController.getAssignAssets(
              //                         employeeListController
              //                             .getAssignedEmployeesResponseModel
              //                             .modifiedResult[index]
              //                             .id
              //                             .toString());
              //                     employeeListController.selectEmployeeName(
              //                       employeeListController
              //                           .getAssignedEmployeesResponseModel
              //                           .modifiedResult[index]
              //                           .firstName,
              //                       employeeListController
              //                           .getAssignedEmployeesResponseModel
              //                           .modifiedResult[index]
              //                           .id,
              //                     );
              //                     await Get.to(EmployeeProfileScreen(
              //                       name:
              //                           "${employeeListController.getAssignedEmployeesResponseModel.modifiedResult[index].firstName} ${employeeListController.getAssignedEmployeesResponseModel.modifiedResult[index].lastName}",
              //                       seatNo: employeeListController
              //                           .getAssignedEmployeesResponseModel
              //                           .modifiedResult[index]
              //                           .assetId
              //                           .toString(),
              //                     ));
              //                   },
              //                 );
              //               },
              //             ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Row titlebar() {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            //    Get.toNamed(AppPages.assignSeatPage);
          },
        ),
      ],
    );
  }
}
