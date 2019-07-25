package;

import openfl.Assets;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.text.Font;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

class DebugView extends Sprite {
	
    private var squada:Font;
    private var opensans:Font;
	public var textfield:TextField;
    public var container:Sprite;


    public function new () {
        
        super();

        container = new Sprite();

        squada = Assets.getFont("fonts/Squada_One.ttf");

        textfield = new TextField();
		textfield.x = x;
		textfield.y = y;
		textfield.width = 640;
		textfield.height = 32;
        textfield.autoSize = TextFieldAutoSize.NONE;
		textfield.defaultTextFormat = new TextFormat(squada.fontName, 24, 0xffffff);
		textfield.selectable = false;
		textfield.embedFonts = true;
        textfield.background = true;
        textfield.backgroundColor = 0x00000000;
        addChild(container);

        addChild(textfield);
        addChild(new TextScroller(0,32));
        addChild(new TextScroller(0,80));
        //addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
    }
       
}