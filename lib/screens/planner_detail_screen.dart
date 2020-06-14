import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlannerDetailScreen extends StatefulWidget {
  static const routeName = '/planner-detail';

  @override
  _PlannerDetailScreenState createState() => _PlannerDetailScreenState();
}

class _PlannerDetailScreenState extends State<PlannerDetailScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime _today = DateTime.now();
  final _sentenceFocusNode = FocusNode();
  final _musicFocusNode = FocusNode();
  final _categoryFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _sentenceFocusNode.dispose();
    _musicFocusNode.dispose();
    _sentenceFocusNode.dispose();
    _categoryFocusNode.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (!_formKey.currentState.validate()) {
      return ;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('데일리 플래너'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: _saveForm)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                  onTap: () async {
                    final response = await showDatePicker(
                      context: context,
                      initialDate: _today,
                      firstDate: DateTime.parse('2019-01-01'),
                      lastDate: DateTime.now().add(Duration(days: 7)));
                    setState(() {
                      _today = response;
                    });
                    },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat('yyyy.MM.dd').format(_today),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  height: 500,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: '오늘의 다짐',
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_musicFocusNode);
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: '오늘의 노래'
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_categoryFocusNode);
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              labelText: '카테고리'
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_titleFocusNode);
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: '제목'
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_descriptionFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty || value.length > 15) {
                              return '제목을 입력해주세요';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: '설명'
                          ),
                          onFieldSubmitted: (_) => _saveForm,
                          validator: (value) {
                            if (value.isEmpty) {
                              return '설명을 입력해주세요';
                            }
                            return null;
                          },
                        ),
                      ],
                  )),
                ),
              )
            ],
          ),
        )
    );
  }
}
