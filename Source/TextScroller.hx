package;

import openfl.utils.Assets;
import openfl.events.Event;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.Font;

class TextScroller extends Sprite{
    
    private var bufferString:String = "Hit A to toggle between assets. This is a test, do not leave your desk. Coffee and tissues will be provided";
	private var opensans:Font;
	private var textfield:TextField;

    public function new( x:Float, y:Float){
        
        super();

        opensans = Assets.getFont("fonts/OpenSans-Regular.ttf");

	    textfield = new TextField();
		textfield.x = x;
		textfield.y = y;
		textfield.width = 640;
		textfield.height = 48;
		textfield.defaultTextFormat = new TextFormat(opensans.fontName, 24, 0xffffff);
		textfield.selectable = false;
		textfield.embedFonts = true;
	
        addChild(textfield);
        addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
        textfield.text = bufferString;
    }

    function this_addedToStage(e:Event){
        addEventListener(Event.ENTER_FRAME, this_enterFrame);
    }

    function this_enterFrame(e:Event){
        var s = bufferString.charAt(0);
        bufferString = bufferString.substr(1) + s;
        textfield.text = bufferString;
    }
}