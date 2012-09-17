window.westendathletic = window.westendathletic || {};
window.westendathletic.seasons = window.westendathletic.seasons || {};

window.westendathletic.seasons.teams = function() {

	var addTeamButton = null;
	var removeTeamButtons = null;
	var teamsControls = null;

	var addTeam = function() {
		var teamClone = teamsControls.last().clone(true);
		teamsControls.last().after(teamClone);
		updateControlIdAndName(teamClone.find('select'));
		teamClone.find('select').val(0);
		refreshTeams();
	};

	var removeTeam = function(teamToRemove) {
		refreshTeams();
		teamToRemove.find('select').val(0);
		if (teamsControls.length > 1) {
			teamToRemove.remove();
		};
	};

	var updateControlIdAndName = function(control) {
		var id = control.attr('id');
		var idValue = parseInt(id.match(/\d/));

		control.attr('id', id.replace(/\d/, idValue + 1));

		var name = control.attr('name');
		var nameValue = parseInt(name.match(/\d/));

		control.attr('name', name.replace(/\d/, nameValue + 1));
	};

	var refreshTeams = function() {
		var teamsControlsClass = teamsControls.first().attr('class');
		teamsControls = $('.' + teamsControlsClass);
	};

	return {
		init: function (args) {
			addTeamButton = $(args.addTeamButtonId);
			removeTeamButtons = $(args.removeTeamButtonClass);
			teamsControls = $(args.teamControlGroupClass);

			$(addTeamButton).on('click', function() {
				addTeam();
			});

			$(removeTeamButtons).on('click', function() {
				var teamToRemove = $(this).closest(args.teamControlGroupClass);
				removeTeam(teamToRemove);
			});
		}
	};

}();