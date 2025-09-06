package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState


{
	
	var background:FlxSprite;

  override function create()

    {
	background = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
	add(lol);

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 400, "[TEST]", 12);
	add(fnfVer);

    }
    
}

