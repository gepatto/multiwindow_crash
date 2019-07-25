package;

import openfl.events.TimerEvent;
import openfl.utils.Timer;
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

	private var assetName:String = "cross_medium.png";
	private var opensans:Font;
	private var textfield:TextField;
	private var container:Sprite;
	private var dbv:DebugView;
	private var maxItems:Int = 50;
	private var shouldAddToContainer:Bool = false;
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

		mainWindow.x = 0;

		container = new Sprite();
		addChild(container);
		addChild(new TextScroller(0,0));
		dbv =  new DebugView();
		secondWindow.stage.addChild( dbv );
		secondWindow.x = Std.int(mainWindow.display.bounds.width) - secondWindow.width;
		stage.addEventListener(MouseEvent.MOUSE_DOWN, stage_mousedown);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, stage_keydown);
		stage.addEventListener(Event.ENTER_FRAME, stage_enterframe);
		
		dbv.textfield.text = "Something random: " + Math.random();
	}

	function stage_enterframe(e:Event){
		addItem(  Math.random()*stage.stageWidth, 80.0 + Math.random() * stage.stageHeight );
	}

	function stage_keydown(e:KeyboardEvent){
		
		switch(e.keyCode){
			
			case Keyboard.A:
				assetName = assetName=="cross_medium.png"?"cross_large.png":"cross_medium.png";
			
			case Keyboard.C:
				for(i in 0... instances_m.length ){
					if(shouldAddToContainer){
						dbv.container.removeChild(instances_s[i]);
						dbv.addChild(instances_s[i]);
					}else{
						dbv.removeChild(instances_s[i]);
						dbv.container.addChild(instances_s[i]);
					}
				}
				shouldAddToContainer = !shouldAddToContainer;
		}
	}

	function stage_mousedown(e:MouseEvent){
		addItem(e.stageX,e.stageY);
	}

	function addItem(x:Float,y:Float){
		var i = new CenteredBitmap("cross_large.png");
		i.x = x; i.y=y;
		instances_m.push(i);
		container.addChild(i);

		var j = new CenteredBitmap(assetName);
		j.x = x; j.y=y;
		instances_s.push(j);
		
		if(shouldAddToContainer){
			dbv.container.addChild(j);
		}else{
			dbv.addChild(j);
		}
		dbv.textfield.text = "Using Asset  " + assetName + " ,Something random: " + Math.random();

		if(instances_m.length>maxItems){
			container.removeChild(instances_m[0]);
			instances_m.shift();
		}
		
		if(instances_s.length>maxItems){
			if(shouldAddToContainer){
				dbv.container.removeChild(instances_s[0]);
			}else{
				dbv.removeChild(instances_s[0]);
			}
			instances_s.shift();
		}
	}
}
