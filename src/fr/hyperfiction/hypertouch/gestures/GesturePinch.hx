package fr.hyperfiction.hypertouch.gestures;

import fr.hyperfiction.hypertouch.enums.GestureTypes;
import fr.hyperfiction.hypertouch.gestures.AGesture;
import fr.hyperfiction.hypertouch.events.TransformGestureEvent;

#if android
import nme.JNI;
#end

#if cpp
import cpp.Lib;
import nme.Lib;
#end

/**
 * ...
 * @author shoe[box]
 */
@:build(org.shoebox.utils.NativeMirror.build( )) class GesturePinch extends AGesture{

	private static inline var ANDROID_CLASS : String = 'fr.hyperfiction.hypertouch.GesturePinch';

	// -------o constructor
		
		/**
		* constructor
		*
		* @param	
		* @return	void
		*/
		public function new() {
			super( );

		}
	
	// -------o public
				
				

	// -------o protected
	
		/**
		* 
		* 
		* @private
		* @return	void
		*/
		override private function _activate( ) : Void{

			#if android
			_java_instance = getInstance( );
			#end	

			#if cpp
			set_callback_pinch( _onPinch );
			#end

			#if ios
			HyperTouch.HyperTouch_activate( 4 , 1 );
			#end

		}

		/**
		* 
		* 
		* @private
		* @return	void
		*/
		private function _onPinch( a : Array<Dynamic> ) : Void{
			
			var ev : TransformGestureEvent = new TransformGestureEvent( GESTURE_PINCH , a[ 1 ] , a[ 2 ] , a[ 3 ] , a[ 3 ] );
				ev.phase = _translate_phase( a[ 0 ] );
			stage_emit( ev );
			
		}

	// -------o misc

	// -------o Android

		#if android

		/**
		* 
		* 
		* @public
		* @return	void
		*/
		@JNI
		static public function getInstance( ) : GesturePinch {
						
		}

		#end

	// -------o CPP
		
		/**
		* 
		* 
		* @public
		* @return	void
		*/
		@CPP("hypertouch")
		public function set_callback_pinch( f : Array<Dynamic>->Void ) : Void {
						
		}
}