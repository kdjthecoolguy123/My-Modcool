package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState


{

	var lol:FlxSprite;

  override function create()

    {
	lol = new FlxSprite().loadGraphic(Paths.image(menuDesat));
	lol.x = 200;
	lol.y = 200;
	add(lol);

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 400, "[TEST]", 12);
	add(fnfVer);

    }
    
}

