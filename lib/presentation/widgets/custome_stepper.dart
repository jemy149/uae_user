import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomeStepper extends StatelessWidget {
  const CustomeStepper(
      {Key? key,
      required this.isWaiting,
      required this.isAccepted,
      required this.isWaitingForDelivery,
      required this.isProgressing,
      required this.isFinished})
      : super(key: key);
  final bool isWaiting;
  final bool isAccepted;
  final bool isWaitingForDelivery;
  final bool isProgressing;
  final bool isFinished;
  final double outerCircleAvatarRadius = 12;
  final double innerCircleAvatarRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: outerCircleAvatarRadius,
                  backgroundColor: AppColors.green,
                  child: CircleAvatar(
                    radius: innerCircleAvatarRadius,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Visibility(
                          visible: isWaiting,
                          child: const Icon(
                            Icons.check,
                            size: 17,
                            color: AppColors.green,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 2,
            color: AppColors.green,
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: outerCircleAvatarRadius,
                  backgroundColor: AppColors.green,
                  child: CircleAvatar(
                    radius: innerCircleAvatarRadius,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Visibility(
                          visible: isAccepted,
                          child: const Icon(
                            Icons.check,
                            size: 17,
                            color: AppColors.green,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 2,
            color: AppColors.green,
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: outerCircleAvatarRadius,
                  backgroundColor: AppColors.green,
                  child: CircleAvatar(
                    radius: innerCircleAvatarRadius,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Visibility(
                          visible: isProgressing,
                          child: Icon(
                            Icons.check,
                            size: 17,
                            color: AppColors.green,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 2,
            color: AppColors.green,
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: outerCircleAvatarRadius,
                  backgroundColor: AppColors.green,
                  child: CircleAvatar(
                    radius: innerCircleAvatarRadius,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Visibility(
                          visible: isWaitingForDelivery,
                          child: const Icon(
                            Icons.check,
                            size: 17,
                            color: AppColors.green,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 2,
            color: AppColors.green,
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: outerCircleAvatarRadius,
                  backgroundColor: AppColors.green,
                  child: CircleAvatar(
                    radius: innerCircleAvatarRadius,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Visibility(
                          visible: isFinished,
                          child: const Icon(
                            Icons.check,
                            size: 17,
                            color: AppColors.green,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
