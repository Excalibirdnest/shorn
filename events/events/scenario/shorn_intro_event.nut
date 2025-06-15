this.shorn_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.shorn_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_107.png[/img]{Beasts beset civilisation at every turn, marauding and slaughtering innocents by the dozen. You were the commander of a troupe of beast hunters, dedicated to the defense of the common people. But that was years ago now. \n\n Your company was slaughtered by a hexe who commanded a legion of schrats. Only you and your second in command survived. Since then, the beasts have only gotten more numerous, and staying in retirement would be a dishonor on your fallen brothers. \n\n But a human is far too frail to battle the night. You must become more. Monsters for monsters. You enlist the help of your old second in command, an alchemist, and an anatomist to build a company of things beyond humanity. \n\n You create the Shorn. }",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The cost of evolution will be paid for in blood.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "A New Beginning";
	}

	function onPrepareVariables( _vars )
	{
	}

	function onClear()
	{
	}

});

