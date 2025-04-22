package states;

import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuStateNew extends TitleState

{

  var sprite:FlxSprite;
  override function create():void
    
    lol = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		lol.visible = false;
		lol.setGraphicSize(Std.int(lol.width * 0.8));
		lol.updateHitbox();
		lol.screenCenter(X);
		lol.antialiasing = ClientPrefs.data.antialiasing;

    add(lol);
    
}

