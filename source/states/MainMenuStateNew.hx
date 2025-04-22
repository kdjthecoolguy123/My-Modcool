package states;

import.flixel.FlxSprite;
import.flixel.FlxState;
import.flixel.text.FlxText;
import.flixel.ui.FlxButton;
import.flixel.ui.FlxMath;

class MainMenuStateNew extends TitleState
{

  var sprite:FlxSprite;
  override pubblic function create():void
  {

    super.create();
    
    sprite = new.FlxSprite();
    sprite.makeGraphic(300, 300, flixel.util.FlxColor.WHITE);
    sprite.x = 200
    sprite.y = 200

    add(sprite);
    
  }

}

