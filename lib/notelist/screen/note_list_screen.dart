import 'package:flutter/material.dart';
import 'package:flutter_app_homework/style/common_styles.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes"),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(15.0),
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildAddNoteWidget(context),
              _buildSeparatorTextWidget(),
              _buildNotesList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddNoteWidget(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add note",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            _buildNoteTitleField(),
            _buildNoteDescriptionField(),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteTitleField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: CommonStyles.textFormFieldStyle("Title", ""),
      ),
    );
  }

  Widget _buildNoteDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: CommonStyles.textFormFieldStyle("Description", ""),
      ),
    );
  }

  Widget _buildAddButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () {},
        child: Text(
          "Add",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSeparatorTextWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Note List",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      ),
    );
  }

  Widget _buildNotesList(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          child: ListTile(
            leading: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.blue[300]),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ),
            title: Text("Note title"),
            subtitle: Text("Note description"),
            trailing: Icon(Icons.delete),
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.blue[300]),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
            ),
            title: Text("Note title 2"),
            subtitle: Text("Note description 2"),
            trailing: Icon(Icons.delete),
          ),
        ),
      ],
    );
  }
}
