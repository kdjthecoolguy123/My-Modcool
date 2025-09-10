package states;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.math.FlxPoint;
import lime.app.Application;

class ChapterSelect extends MusicBeatState
{
    var bg:FlxSprite;
    var bgImage:Int = FlxG.random.int(1, 4);
	var charactersBG:FlxSprite;
	var charactersBG_2:FlxSprite;
	var characterSpeed:Float = 35;
	var characterAlpha:Float = 0.4;	

    var chapter1_button:FlxSprite;
    var chapter2_button:FlxSprite; 
    var chapter3_button:FlxSprite;
    var chapterButtonsDistance:Int = 150;
    var selected:Bool = false;
    var chapterSelect:Int = 0;


    override function create() {

        FlxG.mouse.visible = true;

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

		charactersBG = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("mainmenu/charactersBG"));
		charactersBG.antialiasing = ClientPrefs.data.antialiasing;
		charactersBG.setPosition(0, FlxG.height - charactersBG.height);
		charactersBG.alpha = characterAlpha;
		add(charactersBG);

		charactersBG_2 = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("mainmenu/charactersBG_2"));
		charactersBG_2.antialiasing = ClientPrefs.data.antialiasing;
		charactersBG_2.setPosition(charactersBG.width, FlxG.height - charactersBG_2.height);
		charactersBG_2.alpha = characterAlpha;
		add(charactersBG_2);

        //

        chapter1_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("storymenu/chapterPlaceholder"));
	    chapter1_button.screenCenter(Y);
        chapter1_button.x = 150;
	    add(chapter1_button);

        chapter2_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("storymenu/chapterPlaceholder"));
	    chapter2_button.screenCenter(XY);
	    add(chapter2_button);

        chapter3_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("storymenu/chapterPlaceholder"));
	    chapter3_button.screenCenter(Y);
        chapter3_button.x = FlxG.width - 150 - chapter2_button.width;
	    add(chapter3_button);

        //
        
        var blackBox = new FlxSprite(0, 0);
        blackBox.makeGraphic(FlxG.width, 50, FlxColor.BLACK);
        blackBox.alpha = 0.6;
        add(blackBox);

        var instructions:FlxText = new FlxText(0, 2, 0, "Selected a Chapter with your mouse!", 12);
		instructions.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        instructions.screenCenter(X);
		add(instructions);
        
    }

    override function update(elapsed: Float) {
		super.update(elapsed);

		charactersBG.x -= characterSpeed * elapsed;
		charactersBG_2.x -= characterSpeed * elapsed;

		if (charactersBG.x + charactersBG.width <= 0) {
    		charactersBG.x = charactersBG_2.x + charactersBG_2.width;
		}

		if (charactersBG_2.x + charactersBG_2.width <= 0) {
    		charactersBG_2.x = charactersBG.x + charactersBG.width;
		}

        if (!selected && FlxG.mouse.justPressed && chapter1_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			selected = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound("confirmMenu"));
			FlxFlicker.flicker(chapter1_button, 1.1, 0.04, true, function(_) {
			MusicBeatState.switchState(new StoryMenuState());
			});
		}

        if (!selected && FlxG.mouse.justPressed && chapter2_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			selected = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound("confirmMenu"));
			FlxFlicker.flicker(chapter2_button, 1.1, 0.04, true, function(_) {
			MusicBeatState.switchState(new StoryMenuState());
			});
		}

        if (!selected && FlxG.mouse.justPressed && chapter3_button.overlapsPoint(new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY), true)) {
			selected = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound("confirmMenu"));
			FlxFlicker.flicker(chapter3_button, 1.1, 0.04, true, function(_) {
			MusicBeatState.switchState(new StoryMenuState());
			});
		}

	    if (!selected && controls.BACK) {
            FlxG.sound.play(Paths.sound("cancelmenu"));
            MusicBeatState.switchState(new MainMenuStateNew());
        }
   
    }


}