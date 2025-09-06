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
	var chapterSelect:Int = 0

  override function create()

    {
	background = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menuBG'));
	add(background);
	button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
	add(button);

	var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 0, "[TEST]", 12);
	add(fnfVer);

    }

	public function new() {
        super();
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    }

    function onKeyDown(event:KeyboardEvent):Void {
        if (event.keyCode == Keyboard.RIGHT) {
            chapterSelect++;
            trace(chapterSelect);
        }
    }
}
    
}

