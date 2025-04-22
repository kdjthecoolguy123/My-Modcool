package states;

import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState

{

  override function create()

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 400, "[TEST]", 12);
	add(fnfVer);
    
}

