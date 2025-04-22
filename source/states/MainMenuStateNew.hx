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

    super.create();
    
    sprite = new.FlxSprite();
    sprite.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
    sprite.x = 200
    sprite.y = 200

    add(sprite);
    

}

