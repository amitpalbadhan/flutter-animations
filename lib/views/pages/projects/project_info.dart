import 'package:demo_website/models/project_model.dart';
import 'package:flutter/material.dart';

class ProjectInfo extends StatelessWidget {
  final ProjectModel project;
  const ProjectInfo({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.3, vertical: height * 0.2),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${project.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        project.image,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SelectableText(
                    project.title,
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(height: 15),
                  SelectableText(
                    project.description,
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
