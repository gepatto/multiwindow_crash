package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;


class CenteredBitmap extends Sprite
{
    
    var bitmap:Bitmap;

    public function new(assetName:String){

        super();

        bitmap = new Bitmap (Assets.getBitmapData("images/" + assetName) );
        bitmap.x = -0.5*bitmap.width;
        bitmap.y = -0.5*bitmap.height;

        addChild( bitmap );
    }

}