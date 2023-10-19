import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/constants.dart';
import 'package:laza/features/home/presentation/manager/user_cubit/user_cubit.dart';

import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';

class DrawerInfoListTile extends StatefulWidget {
  const DrawerInfoListTile({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<DrawerInfoListTile> createState() => _DrawerInfoListTileState();
}

class _DrawerInfoListTileState extends State<DrawerInfoListTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<UserCubit>(context).getUserData(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  // backgroundColor: Theme.of(context).colorScheme.background,
                  radius: 40,
                  child: CachedNetworkImage(imageUrl: state.user.image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      state.user.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textstyle17,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Verified Account',
                        style: Styles.textstyle13,
                      ),
                      SvgPicture.asset(AssetData.verified),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Text('3 Orders'),
              )
            ],
          );
        } else if (state is UserFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
