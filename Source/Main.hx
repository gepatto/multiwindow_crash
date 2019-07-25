package;

import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.display.Window;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.Font;
import openfl.utils.Assets;

class Main extends Sprite
{
	var mainWindow:Window;
	var secondWindow:Window;

    private var bufferString:String = "Hit A to toggle between assets. This is a test, do not leave your desk. Coffee and tissues will be provided";
	private var assetName:String = "cross_medium.png";
	private var opensans:Font;
	private var textfield:TextField;
	private var dbv:DebugView;
	private var instances_m:Array<CenteredBitmap> = [];
	private var instances_s:Array<CenteredBitmap> = [];

	public function new()
	{
		super();

		mainWindow = cast(stage.application.windows[0], Window);
		mainWindow.onClose.add(function() {
		 	// exit app when we close mainWindow
			openfl.system.System.exit(0);
		});

		secondWindow = cast(stage.application.windows[1], Window);

		mainWindow.stage.addChild(new TextScroller(24,24));
		mainWindow.x = 0;
		dbv =  new DebugView();
		secondWindow.stage.addChild( dbv );
		secondWindow.x = Std.int(mainWindow.display.bounds.width) - secondWindow.width;
		stage.addEventListener(MouseEvent.MOUSE_DOWN, stage_mousedown);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keydown);
		stage.addEventListener(Event.ENTER_FRAME, stage_enterframe);
		dbv.textfield.text = "Something random: " + Math.random();
	}

	function stage_enterframe(e:Event){
		addItem(  Math.random()*stage.stageWidth, Math.random() * stage.stageHeight );
	}

	function stage_keydown(e:KeyboardEvent){
		if(e.keyCode == Keyboard.A){
			assetName = assetName=="cross_medium.png"?"cross_large.png":"cross_medium.png";
		}
	}

	function stage_mousedown(e:MouseEvent){
		 addItem(e.stageX,e.stageY);
	}

	function addItem(x:Float,y:Float){
		var i = new CenteredBitmap("cross_large.png");
		i.x = x; i.y=y;
		instances_m.push(i);
		addChild(i);

		var j = new CenteredBitmap(assetName);
		j.x = x; j.y=y;
		instances_s.push(j);
		dbv.addChild(j);
		dbv.textfield.text = "Something random: " + Math.random();

		if(instances_m.length>25){
			removeChild(instances_m[0]);
			instances_m.shift();
		}
		
		if(instances_s.length>25){
			dbv.removeChild(instances_s[0]);
			instances_s.shift();
		}
	}
}
