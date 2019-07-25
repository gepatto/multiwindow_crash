package;

import openfl.events.TimerEvent;
import openfl.utils.Timer;
import openfl.utils.Assets;
import openfl.events.Event;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.Font;

class TextScroller extends Sprite{

    private var bufferString:String = "Hit A to toggle between assets. Hit C to add to toggle bewteen adding to a container or the stage in the second window";
	private var opensans:Font;
	private var textfield:TextField;
    private var iTimer:Timer;

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
	    textfield.background = true;
        textfield.backgroundColor = 0x00000000;
        
        addChild(textfield);
        addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
        textfield.text = bufferString;

    }

    function this_addedToStage(e:Event){
        iTimer = new Timer(120,0);	
		iTimer.addEventListener(TimerEvent.TIMER, onTimer);
		iTimer.start();
    }

    function onTimer(e:Event){
        var s = bufferString.charAt(0);
        bufferString = bufferString.substr(1) + s;
        textfield.text = bufferString;
    }
}