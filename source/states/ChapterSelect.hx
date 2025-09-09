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

    var chapter1_button:FlxSprite;
    var chapter2_button:FlxSprite; 
    var chapter3_button:FlxSprite;
    var chapter4_button:FlxSprite;
    var chapterSelect:Int = 0;


    override function create() {

        FlxG.mouse.visible = true;

        bg = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("backgrounds/menuDesat"));
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

        chapter1_button = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("storymenu/chapterPlaceholder"));
	    chapter1_button.screenCenter();
	    add(chapter1_button);

        //
        
        var blackBox = new FlxSprite(0, 0);
        blackBox.makeGraphic(FlxG.width, 25, FlxColor.BLACK);
        blackBox.alpha = 0.6;
        add(blackBox);

        var instructions:FlxText = new FlxText(0, 6, 0, "Selected a Chapter with your mouse!", 26);
		instructions.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        instructions.sceenCenter(X);
		add(instructions);
        
    }

    override function update(elapsed: Float) {
		super.update(elapsed);

        if (controls.BACK) {
            MusicBeatState.switchState(new MainMenuStateNew());
        }
   
    }


}