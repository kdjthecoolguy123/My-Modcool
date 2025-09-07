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
	var button:FlxSprite;
	var chapterSelect:Int = 1;
	var fnfVer:FlxText;

  override function create()

    {
	background = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menuBG'));
	add(background);
	button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
	add(button);

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 0, "[TEST]", 12);
	add(fnfVer);
    }
	 
}

