package states;

import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState

{

  override function create()

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Crazy Funker's v1.5 [Dev Build]", 12);
	fnfVer.scrollFactor.set();
	fnfVer.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	add(fnfVer);
	changeItem();
    
}

