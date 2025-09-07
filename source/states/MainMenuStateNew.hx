package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.FlxG;
import flixel.text.FlxText;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState
{
	public static var updateVer:String = '1.5';

	var background:FlxSprite;
	var storyMode_button:FlxSprite;
	var freeplay_button:FlxSprite;
	var chapterSelect:Int = 1;
	var allowMouse:Bool = true;

  	override function create() {

		background = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menuBG'));
		background.screenCenter();
		add(background);

		//

		storyMode_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
		storyMode_button.setPosition(0, 200)
		add(storyMode_button);

		freeplay_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
		freeplay_button.setPosition(500, 200)
		add(freeplay_button);

		var fnfVer:FlxText = new FlxText(12, FlxG.height - 400, 0, "Crazy Funker's " + updateVer + " [Developer Build]", 12);
		add(fnfVer);

    }

	override function update(elapsed: Float) {

		if (FlxG.mouse.justPressed && storyMode_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY))) {
    		MusicBeatState.switchState(new StoryMenuState());
		}

		if (FlxG.mouse.justPressed && freeplay_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY))) {
    		MusicBeatState.switchState(new FreeplayState());
		}
		
	}
	 
}

