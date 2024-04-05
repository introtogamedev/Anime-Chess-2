function pieceName(_team){
    static team1Names = 0;
	static team2Names = 0;

	if (_team == team.TEAM_BLUE){
		team1Names ++;
		return "Team BLUE Piece " + string(team1Names);
	}else if (_team == team.TEAM_RED){
		team2Names ++;
		return "Team RED Piece " + string(team2Names);
	}
}