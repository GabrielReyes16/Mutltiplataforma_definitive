import 'package:flutter/material.dart';
import 'package:fulbo/fulbo.dart';
import 'package:fulbo/fulbo_database.dart';

class FulboDetailsView extends StatefulWidget {
  final int? teamId;

  const FulboDetailsView({Key? key, this.teamId}) : super(key: key);

  @override
  _FulboDetailsViewState createState() => _FulboDetailsViewState();
}

class _FulboDetailsViewState extends State<FulboDetailsView> {
  FulboDatabase fulboDatabase = FulboDatabase.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController foundingYearController = TextEditingController();
  TextEditingController lastChampionshipDateController = TextEditingController();

  FulboModel? team;

  bool isLoading = false;
  bool isNewTeam = false;

  @override
  void initState() {
    super.initState();
    if (widget.teamId == null) {
      isNewTeam = true;
    } else {
      refreshTeam();
    }
  }

  void refreshTeam() {
    fulboDatabase.read(widget.teamId!).then((value) {
      setState(() {
        team = value;
        nameController.text = team!.name;
        foundingYearController.text = team!.foundingYear.toString();
        lastChampionshipDateController.text =
            team!.lastchampionshipDate?.toIso8601String() ?? ''; // Handling nullable DateTime
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(isNewTeam ? 'Nuevo Equipo' : 'Detalles del Equipo'),
        actions: [
          IconButton(
            onPressed: saveTeam,
            icon: const Icon(Icons.save),
          ),
          if (!isNewTeam)
            IconButton(
              onPressed: deleteTeam,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Equipo',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    TextField(
                      controller: foundingYearController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Año de Fundación',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          controller: lastChampionshipDateController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Fecha del Último Campeonato',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: team?.lastchampionshipDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        lastChampionshipDateController.text = picked.toIso8601String();
      });
    }
  }

  void saveTeam() {
    setState(() {
      isLoading = true;
    });

    final model = FulboModel(
      name: nameController.text,
      foundingYear: int.tryParse(foundingYearController.text) ?? 0,
      lastchampionshipDate: DateTime.tryParse(lastChampionshipDateController.text),
    );

    if (isNewTeam) {
      fulboDatabase.create(model).then((_) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      });
    } else {
      model.id = team!.id;
      fulboDatabase.update(model).then((_) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
      });
    }
  }

  void deleteTeam() {
    fulboDatabase.delete(team!.id!);
    Navigator.pop(context);
  }
}
