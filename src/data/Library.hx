package data;

import nme.Assets;
import nme.media.Sound;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.text.Font;

class Library {
	static var assets:Hash<Dynamic> = new Hash<Dynamic>();
	
	public static function getImage(i:Image):BitmapData {
		// nme already caches images
		return Assets.getBitmapData(Library.getFilename(i));
	}
		
	public static function getFont():Font {
		var name = Registry.font;
		if (!assets.exists(name)){
			assets.set(name, Assets.getFont("assets/"+Registry.font+".ttf"));
		}
		return cast(assets.get(name), Font);
	}
	
	public static function getSound(s:Sound):nme.media.Sound {
		var name = Library.getFilename(s);
		if (!assets.exists(name)){
			assets.set(name, Assets.getSound(name));
		}
		return cast(assets.get(name), nme.media.Sound);
	}
	
	public static function getMusic(s:Music):nme.media.Sound {
		var name = Library.getFilename(s);
		if (!assets.exists(name)){
			assets.set(name, Assets.getSound(name));
		}
		return cast(assets.get(name), nme.media.Sound);
	}
		
	public static function getFilename(i:Dynamic):String {
		var prefix = "";
		var suffix = "";
		if (Type.getEnum(i) == Image) {
			prefix = "img/";
			suffix = ".png";
		} else if (Type.getEnum(i) == Sound) {
			prefix = "snd/";
			suffix = ".wav";
		} else if (Type.getEnum(i) == Music) {
			prefix = "music/";
			suffix = ".mp3";
		}
	
		return "assets/" + Type.enumConstructor(i).toLowerCase() + suffix;
	}
	
}

enum Image {
	GRASSBLOCK
	MAYABLOCK
	BRICKBLOCK
	SHIP
	STEELBLOCK
	SANDBLOCK
}

enum Sound {
}

enum Music {
}