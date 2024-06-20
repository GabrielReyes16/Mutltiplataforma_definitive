import 'package:flutter/material.dart';
import 'package:fulbo/fulbo.dart';
import 'package:fulbo/fulbo_database.dart';
import 'package:fulbo/fulbo_details_view.dart';

class FulbosView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const FulbosView({Key? key});

  @override
  State<FulbosView> createState() => _FulbosViewState();
}

class _FulbosViewState extends State<FulbosView> {
  FulboDatabase fulboDatabase = FulboDatabase.instance;

  List<FulboModel> teams = [];

  @override
  void initState() {
    refreshTeams();
    super.initState();
  }

  @override
  void dispose() {
    // Close the database
    fulboDatabase.close();
    super.dispose();
  }

  /// Gets all the teams from the database and updates the state
  refreshTeams() {
    fulboDatabase.readAll().then((value) {
      setState(() {
        teams = value;
      });
    });
  }

  /// Navigates to the FulboDetailsView and refreshes the teams after the navigation
  goToTeamDetailsView({int? id}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FulboDetailsView(teamId: id)),
    );
    refreshTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Equipos de fútbol',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: teams.isEmpty
            ? const Text(
                'No hay equipos aún',
                style: TextStyle(color: Colors.white),
              )
            : ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  final team = teams[index];
                  return GestureDetector(
                    onTap: () => goToTeamDetailsView(id: team.id),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        color: Colors.blue, // Cambia el color como desees
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Fundado en ${team.foundingYear}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Último campeonato: ${team.lastchampionshipDate}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                team.name,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToTeamDetailsView,
        tooltip: 'Añadir equipo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
