package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.math.FlxPoint;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState
{
	public static var updateVer:String = '1.5';

	var background:FlxSprite;
	var charactersBG:FlxSprite;
	var charactersBG_2:FlxSprite;
	var characterSpeed:Float = 10;

	var storyMode_button:FlxSprite;
	var freeplay_button:FlxSprite;

	var chapterSelect:Int = 1;
	var allowMouse:Bool = true;

  	override function create() {

		FlxG.mouse.visible = true;

		background = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('menuBG'));
		background.screenCenter();
		add(background);

		charactersBG = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('charactersBG'));
		charactersBG.setPosition(Flx.width, FlxG.height - charactersBG.height);
		add(charactersBG);

		charactersBG_2 = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('charactersBG'));
		charactersBG_2.setPosition(Flx.width * 2, FlxG.height - charactersBG_2.height);
		add(charactersBG_2);

		//

		storyMode_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
		storyMode_button.setPosition(0, 200);
		add(storyMode_button);

		freeplay_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('go'));
		freeplay_button.setPosition(500, 200);
		add(freeplay_button);

		var fnfVer:FlxText = new FlxText(12, 12, 0, "Crazy Funker's " + updateVer + " [Developer Build]", 12);
		add(fnfVer);

    }

	override function update(elapsed: Float) {
		super.update(elapsed);

		// the BG

		charactersBG.x -= characterSpeed * elapsed;
		charactersBG_2.x -= characterSpeed * elapsed;

		if (charactersBG.x + charactersBG.width <= 0) {
    		charactersBG.x = FlxG.width * 2;
		}

		if (charactersBG_2.x + charactersBG_2.width <= 0) {
    		charactersBG_2.x = FlxG.width * 2;
		}

		// buttons here

		if (FlxG.mouse.justPressed && storyMode_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxFlicker.flicker(charactersBG, 1.1, 0.15)
    		MusicBeatState.switchState(new StoryMenuState());
		}

		if (FlxG.mouse.justPressed && freeplay_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxFlicker.flicker(charactersBG_2, 1.1, 0.15)
    		MusicBeatState.switchState(new FreeplayState());
		}
		
	}
	 
}

