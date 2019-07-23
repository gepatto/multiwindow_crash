package;

import openfl.Assets;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.Font;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

class DebugView extends Sprite {
	
    private var squada:Font;
    private var opensans:Font;
	public var textfield:TextField;

    public function new () {
        
        super();

        squada = Assets.getFont("fonts/Squada_One.ttf");

        textfield = new TextField();
		textfield.x = x;
		textfield.y = y;
		textfield.width = 640;
		textfield.height = 48;
		textfield.defaultTextFormat = new TextFormat(squada.fontName, 24, 0xffffff);
		textfield.selectable = false;
		textfield.embedFonts = true;
	
        addChild(textfield);
        addChild(new TextScroller(24,24));
        addChild(new TextScroller(24,80));
        //addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
    }
       
}