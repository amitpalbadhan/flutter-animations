import 'package:demo_website/models/project_model.dart';
import 'package:demo_website/utils/constants.dart';
import 'package:demo_website/views/pages/projects/project_info.dart';
import 'package:flutter/material.dart';

import '../../views.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: kBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: projectItems
                    .map(
                      (project) => Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProjectInfo(project: project)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: '${project.id}',
                                  child: CircleAvatar(
                                    radius: 125,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage(project.image),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  project.title,
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
