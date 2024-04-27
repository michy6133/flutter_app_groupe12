import 'package:flutter/material.dart';
import '../models/candidate.dart';
import 'candidate_tile.dart';
import 'add_candidate_page.dart';

class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<Candidate> candidates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: candidates.map((candidate) => CandidateTile(candidate: candidate)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCandidatePage()),
          ).then((newCandidate) {
            if (newCandidate != null) {
              setState(() {
                candidates.add(newCandidate);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
