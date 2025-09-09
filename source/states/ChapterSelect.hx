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

    var chapter1_button:FlxSprite;
    var chapter2_button:FlxSprite; 
    var chapter3_button:FlxSprite;
    var chapter4_button:FlxSprite;
    var chapterSelect:Int = 0;


    override function create() {

        bg = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("backgrounds/menuDesat"));
	    bg.screenCenter();
	    add(bg);

        bg = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image("storymenu/chapterPlaceholder"));
	    bg.screenCenter();
	    add(bg);
        
    }

    override function update(elapsed: Float) {
		super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE) {
            MusicBeatState.switchState(new MainMenuStateNew());
        }
   
    }


}