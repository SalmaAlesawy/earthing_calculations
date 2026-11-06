import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/contact_us_features/contact_us_view_model/contact_us_cubit.dart';
import 'package:earthing_calc/features/projects_features/projects_view/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Contact Us", style: textTheme.titleLarge),
        centerTitle: true,
      ),
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          ContactUsCubit contactUsCubit = context.read<ContactUsCubit>();
          return Column(
            children: [
              Assets.images.contactUs.image(),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorsPalette.buttonBackground,
                ),
                child: Column(
                  children: [
                    ProjectCard(
                      subtitle: Text(
                        "eng.mohamed@gmail.com",
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorsPalette.mainOrange,
                        ),
                      ),
                      title: Text("Email", style: textTheme.bodyLarge),
                      leading: Icon(
                        Icons.email_rounded,
                        color: ColorsPalette.mainOrange,
                        size: 50,
                      ),
                      onPressed: () {
                        contactUsCubit.sendEmail();
                      },
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: ColorsPalette.grayText,
                    ),
                    ProjectCard(
                      leading: Icon(
                        Icons.phone,
                        color: ColorsPalette.mainOrange,
                        size: 50,
                      ),
                      title: Text("Phone", style: textTheme.bodyLarge),
                      subtitle: Text(
                        "+966502611665",
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorsPalette.mainOrange,
                        ),
                      ),
                      onPressed: () {
                        contactUsCubit.makePhoneCall();
                      },
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: ColorsPalette.grayText,
                    ),
                    ProjectCard(
                      leading: Icon(
                        Icons.perm_phone_msg_sharp,
                        color: ColorsPalette.mainOrange,
                        size: 50,
                      ),
                      title: Text("WhatsApp", style: textTheme.bodyLarge),
                      subtitle: Text(
                        "+9966502611665",
                        style: textTheme.bodySmall?.copyWith(
                          color: ColorsPalette.mainOrange,
                        ),
                      ),
                      onPressed: () {
                        contactUsCubit.openWhatsApp();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
