import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/admin/widgets/header_widget.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: customContainer(
            width: double.infinity,
            color: AppColors.whiteColor,
            child:  headerWidget(userManagement, context)
          )
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 8,
          child: customTableWidget(context)
        )
      ],
    );
  }
}


Widget customTableWidget(BuildContext context) {
  return SingleChildScrollView(
            child: customContainer(
              color: AppColors.whiteColor,
              margin: commonSysmPadding(context, horizontal: 5, vertical: 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        users,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: ResponsiveUtil.width(60, context),
                        height: ResponsiveUtil.height(45, context),
                        child: commonTextField(
                          hintText: "Search Users",
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5)
                          )
                          )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(
                        color: AppColors.greyColor,
                        width: 0.9
                      ),
                      headingTextStyle: Theme.of(context).textTheme.titleSmall,
                      dataTextStyle: Theme.of(context).textTheme.bodySmall,
                            columns: const [
                              DataColumn(label: Text('Image')),
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Phone No')),
                              DataColumn(label: Text('Address')),
                              DataColumn(label: Text('City')),
                              DataColumn(label: Text('Joining Date')),
                              DataColumn(label: Text('Bookings')),
                              DataColumn(label: Text('Actions')),
                            ],
                            rows: userData
                    .map(
                      (data) => DataRow(cells: [
                        DataCell(
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.yellowColor,
                          )
                        ),
                        DataCell(Text(data['name'])),
                        DataCell(Text(data['email'])),
                        DataCell(Text(data['phone no'])),
                        DataCell(Text(data['address'], maxLines: 4,)),
                        DataCell(Text(data['city'])),
                        DataCell(Text(data['joining date'],)),
                        DataCell(Text(data['bookings'].toString())),
                        DataCell(
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(AppIcons.editIcon, size: GeneralSize.iconSize, color: AppColors.greenColor,),),
                              IconButton(onPressed: (){

                              }, icon: Icon(AppIcons.deleteIcon, size: GeneralSize.iconSize, color: AppColors.redColor,)) 
                            ],
                          )
                        ),
                      ]),
                    )
                    .toList(),
                          ),
                  ),
                ],
              ),
            ),
          );
}




final List<Map<String, dynamic>> userData = [
    {
      'serial no': 1,
      'name': 'John Doe',
      'email': 'john@example.com',
      'phone no': '123-456-7890',
      'address': '123 Main  St',
      'city': 'Anytown',
      'joining date': '2024-04-01',
      'bookings': 5,
      'actions': 'Edit/Delete'
    },
    // Add more user data as needed
  ];


   final List<Map<String, String>> columnLabels = [
    {'label': 'Serial No'},
    {'label': 'Name'},
    {'label': 'Email'},
    {'label': 'Phone No'},
    {'label': 'Address'},
    {'label': 'City'},
    {'label': 'Joining Date'},
    {'label': 'Bookings'},
    {'label': 'Actions'},
  ];