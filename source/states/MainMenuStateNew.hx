package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.math.FlxPoint;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import states.ChapterSelect;	
import options.OptionsState;

class MainMenuStateNew extends MusicBeatState
{
	public static var updateVer:String = "1.5";

	var bg:FlxSprite;
	var bgImage:Int = FlxG.random.int(1, 4);
	var charactersBG:FlxSprite;
	var charactersBG_2:FlxSprite;
	var characterSpeed:Float = 35;

	var storyMode_button:FlxSprite;
	var freeplay_button:FlxSprite;
	var selected:Bool = false;

	var allowMouse:Bool = true;

  	override function create() {

		FlxG.mouse.visible = true;

		// Background code

		bg = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("backgrounds/menuDesat"));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.screenCenter();
		add(bg);

		if (bgImage == 1) {
    		bg.loadGraphic(Paths.image("backgrounds/menuDesat"));
		}

		if (bgImage == 2) {
    		bg.loadGraphic(Paths.image("backgrounds/menuBG"));
		}

		if (bgImage == 3) {
    		bg.loadGraphic(Paths.image("backgrounds/menuBGMagenta"));
		}

		if (bgImage == 4) {
    		bg.loadGraphic(Paths.image("backgrounds/menuBGBlue"));
		}

		charactersBG = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("mainmenu/buttonPlaceholder"));
		charactersBG.antialiasing = ClientPrefs.data.antialiasing;
		charactersBG.setPosition(0, FlxG.height - charactersBG.height);
		add(charactersBG);

		charactersBG_2 = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("mainmenu/buttonPlaceholder"));
		charactersBG_2.antialiasing = ClientPrefs.data.antialiasing;
		charactersBG_2.setPosition(charactersBG.width, FlxG.height - charactersBG_2.height);
		add(charactersBG_2);

		// Buttons code

		storyMode_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("go"));
		storyMode_button.setPosition(0, 200);
		add(storyMode_button);

		freeplay_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("go"));
		freeplay_button.setPosition(500, 200);
		add(freeplay_button);

		var crazyFunkersVer:FlxText = new FlxText(6, FlxG.height - 22, 0, "Crazy Funker's " + updateVer + " [Developer Build]", 12);
		crazyFunkersVer.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(crazyFunkersVer);

    }

	override function update(elapsed: Float) {
		super.update(elapsed);

		// the BG

		charactersBG.x -= characterSpeed * elapsed;
		charactersBG_2.x -= characterSpeed * elapsed;

		if (charactersBG.x + charactersBG.width <= 0) {
    		charactersBG.x = charactersBG_2.x + charactersBG_2.width;
		}

		if (charactersBG_2.x + charactersBG_2.width <= 0) {
    		charactersBG_2.x = charactersBG.x + charactersBG.width;
		}

		// buttons here

		if (!selected && FlxG.mouse.justPressed && storyMode_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			selected = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound("confirmMenu"));
			FlxFlicker.flicker(storyMode_button, 1.1, 0.04, true, function(_) {
				MusicBeatState.switchState(new ChapterSelect());
			});

		}

		if (!selected && FlxG.mouse.justPressed && freeplay_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			selected = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound("confirmMenu"));
			FlxFlicker.flicker(freeplay_button, 1.1, 0.04, true, function(_) {
				MusicBeatState.switchState(new FreeplayState());
			});
    		
		}

		if (!selected && controls.BACK) {
			FlxG.sound.play(Paths.sound("cancelmenu"));
            MusicBeatState.switchState(new TitleState());
        }
		
	}
	 
}

