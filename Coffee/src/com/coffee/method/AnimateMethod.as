package com.coffee.method
{
	import com.coffee.view.AnimateButton;
	import com.coffee.view.ChildMenu;
	import com.coffee.view.Main;
	import com.coffee.view.MenuStrip;
	import com.coffee.view.TitleMenu;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.effects.Fade;
	import mx.effects.Move;
	import mx.effects.Pause;
	import mx.effects.Sequence;
	import mx.effects.SoundEffect;
	import mx.formatters.CurrencyFormatter;
	
	import spark.components.Group;
	import spark.components.Label;
	
	
	public class AnimateMethod
	{
		
		
		/**			无餐的构造函数		*/
		public function AnimateMethod(){}
		
		
		
		
// ------------			全局变量		--------------------------------
		
		/**			移动对象	使用时指定建议指定他的所有属性		*/
		private var _move:Move = new Move();
		
		/**			再次移动的对象	使用时指定建议指定他的所有属性			*/
		private var _moveAgain:Move = new Move();
		
		/**			第三次移动的对象	使用时指定建议指定他的所有属性			*/
		private var _moveThree:Move = new Move();
		
		/**			暂停效果，	使用时建议指定他的所有属性			*/
		private var _pause:Pause = new Pause();
		
		/**			但如淡出的效果			*/
		private var _fade:Fade = new Fade();
		
		/**			菜单项的效果延迟时间	默认是100毫秒	*/
		private var _menuAnimateDuration:Number = 100;
		
		
		
// ------------			全局方法		--------------------------------		
		
		/**	隐藏Loading图片	，250毫秒之后向左移动	
		 * 	@param target：要移动隐藏的Loading对象    
		 * 	*/
		public function hideLoading(target:DisplayObject):void{
			// 先显示Loading图片
			target.visible = true;
			
			// 创建序列，移动loading图片
			var seq:Sequence = new Sequence(target);
			
			// 先向右移动30像素
			this._move.xBy = 20;
			this._move.duration = 200;
			
			// 静止100毫秒
			this._pause.duration = 100;
			
			// 在向左移动，直至隐藏自己
			this._moveAgain.xTo = -(target.width+20);
			this._moveAgain.duration = 150;
			
			// 按照顺序开始播放效果
			seq.addChild(this._move);
			seq.addChild(this._pause);
			seq.addChild(this._moveAgain);
			seq.play();
			
			// 播放加载声音
			Main._soundEffect = new SoundEffect(target);
			Main._soundEffect.source = "sounds/loading.mp3";
			Main._soundEffect.play();
			
		}
		
		/**	显示最上方的红线	, 400毫秒之后完全显示	
		 * 	@param target:要显示的红线对象，
		 **/
		public function showRedLine(target:DisplayObject):void{
			target.visible = true;
			
			// 从程序的右边框，向左边框移动
			this._move.xFrom = -target.width;
			this._move.xTo = 0;
			this._move.target = target;
			this._move.duration = 400;
			this._move.play();
		}
		
		/**	显示版权信息	
		 * 	@param buttom:最下方的横条
		 * 	@param copy：最终要显示的版权信息
		 * 	@param groupSound:要显示的声音控制层
		 * 	*/
		public function showBottomCopyRightAndSoundControl(bottom:Image,copy:Image,groupSound:Group):void{
			bottom.visible = true;
			
			// 最下面的横条向左移动
			this._move.xFrom = bottom.width;
			this._move.xTo = -bottom.width;
			this._move.target = bottom;
			this._move.duration = 800;
			this._move.play();
			
			// 等待横条向左移动到0（x=0），显示版权信息（向上移动）
			setTimeout(function():void{				
				copy.visible = true;
				
				// 版权信息向上移动
				_moveAgain.yFrom = copy.height;
				_moveAgain.yTo = 0;
				_moveAgain.xTo = 1;
				_moveAgain.target = copy;
				_moveAgain.duration = 100;
				_moveAgain.play();				
			},400);
			
			// 等待横条向左移动到0（x=0），显示声音控制图片层（向上移动）
			setTimeout(function():void{				
				groupSound.visible = true;
				
				// 版权信息向上移动
				_moveAgain.yFrom = groupSound.parent.height;
				_moveAgain.yTo = 15;
				_moveAgain.xTo = 680;
				_moveAgain.target = groupSound;
				_moveAgain.duration = 100;
				_moveAgain.play();				
			},400);
			
		}
		
		/**	鼠标移动到菜单上时，显示特效
		 * 	@param childMenu:一个子菜单对象
		 **/
		public function rollOverMenu(childMenu:ChildMenu):void{
			
			var seqRed:Sequence = new Sequence(childMenu.lblRed);
			var seqGray:Sequence = new Sequence(childMenu.lblGray);
			
			// 红色文字，先向右移动，
			this._move.xFrom = 36;
//			this._move.xTo = childMenu.width;
			this._move.xTo = 50;
			this._move.yFrom = 17;
			this._move.yTo = 17;
			// 然后在向左移动到，灰色文字的位置			
//			this._moveAgain.xFrom = childMenu.width;
			this._moveAgain.xFrom = 50;
			this._moveAgain.xTo = 20;
			this._moveAgain.yFrom = 32;
			this._moveAgain.yTo = 32;
			
			// 第三次移动，貌似很有弹性的那种感觉
			this._moveThree.xFrom = 20;
			this._moveThree.xTo = 36;			
			this._moveThree.yFrom = 32;
			this._moveThree.yTo = 32;			
			this._moveThree.duration = this._menuAnimateDuration/2.0;
			
			// 红色文字要完成的效果
			seqRed.addChild(this._move);
			seqRed.addChild(this._moveAgain);
			seqRed.addChild(this._moveThree);
			seqRed.duration = this._menuAnimateDuration;
			seqRed.play();
			
			// 灰色文字，先向左移动，
			this._move.xFrom = 34;
			this._move.xTo = 0;
			this._move.yFrom = 32;
			this._move.yTo = 32;
			// 然后在向右移动到，红色文字的位置
			this._moveAgain.xFrom = 0;
			this._moveAgain.xTo = 50;
			this._moveAgain.yFrom = 17;
			this._moveAgain.yTo = 17;
			
			// 第三次移动，貌似很有弹性的那种感觉
			this._moveThree.xFrom = 50;
			this._moveThree.xTo = 34;			
			this._moveThree.yFrom = 17;
			this._moveThree.yTo = 17;
			this._moveThree.duration = this._menuAnimateDuration/2.0;
			
			// 灰色文字要完成的效果
			seqGray.addChild(this._move);
			seqGray.addChild(this._moveAgain);
			seqGray.addChild(this._moveThree);
			seqGray.duration = this._menuAnimateDuration;
			seqGray.play();
			
			// 鼠标移入到ChildMenu对象中，改变字体颜色，橙色
			setTimeout(function():void{
				childMenu.lblGray.setStyle("color" , "#CF7C06");
			},this._menuAnimateDuration);
			
			// 播放声音
			if(Main._isPlaySound){
				Main._soundEffect = new SoundEffect(childMenu);
				Main._soundEffect.source = "sounds/click.mp3";
				Main._soundEffect.play();
			}
		}
		
		/**	鼠标移出菜单时，显示 特效
		 * 	@param childMenu:一个子菜单对象
		 **/
		public function rollOutMenu(childMenu:ChildMenu):void{
			
			var seqRed:Sequence = new Sequence(childMenu.lblRed);
			var seqGray:Sequence = new Sequence(childMenu.lblGray);
			
			// 红色文字，先向右移动，
			this._move.xFrom = 36;
			this._move.xTo = 50;
			this._move.yFrom = 32;
			this._move.yTo = 32;
			// 然后在向左移动到，灰色文字的位置			
			this._moveAgain.xFrom = 50;
			this._moveAgain.xTo = 20;
			this._moveAgain.yFrom = 17;
			this._moveAgain.yTo = 17;
			
			// 第三次移动，貌似很有弹性的那种感觉
			this._moveThree.xFrom = 20;
			this._moveThree.xTo = 36;			
			this._moveThree.yFrom = 17;
			this._moveThree.yTo = 17;			
			this._moveThree.duration = this._menuAnimateDuration/2.0;
						
			seqRed.addChild(this._move);
			seqRed.addChild(this._moveAgain);
			seqRed.addChild(this._moveThree);
			seqRed.duration = this._menuAnimateDuration;
			seqRed.play();
			
			// 灰色文字，先向左移动，
			this._move.xFrom = 34;
			this._move.xTo = 0;
			this._move.yFrom = 17;
			this._move.yTo = 17;
			
			// 然后在向右移动到，红色文字的位置
			this._moveAgain.xFrom = 0;
			this._moveAgain.xTo = 50;
			this._moveAgain.yFrom = 32;
			this._moveAgain.yTo = 32;
						
			// 第三次移动，貌似很有弹性的那种感觉
			this._moveThree.xFrom = 50;
			this._moveThree.xTo = 34;			
			this._moveThree.yFrom = 32;
			this._moveThree.yTo = 32;
			this._moveThree.duration = this._menuAnimateDuration/2.0;
			
			// 灰色文字要完成的效果
			seqGray.addChild(this._move);
			seqGray.addChild(this._moveAgain);
			seqGray.addChild(this._moveThree);
			seqGray.duration = this._menuAnimateDuration;
			seqGray.play();
			
			// 鼠标移入到ChildMenu对象中，改变字体颜色，灰色
			setTimeout(function():void{
				childMenu.lblGray.setStyle("color" , "#909391");
			},this._menuAnimateDuration);
		}
		
		/**	显示所有子菜单项，用于窗体加载时调用
		 * 	@param childMenus：所有子菜单的泛型	
		 **/
		public function showMenu(childMenus:Vector.<ChildMenu>):void{
			var duration:Number = 100;
			
			for(var i:int = 0 ; i < childMenus.length ; i ++){
				// 获取子菜单对象
				var childMenu:ChildMenu = childMenus[i];
				
				childMenu.visible = true;
				
				// 创建序列
				var seq:Sequence = new Sequence(childMenu);
				
				// 先向下移动
				this._move = new Move();
				this._move.yFrom = childMenu.y-20;
				this._move.yTo = childMenu.y+20;
				
				// 在向上移动
				this._moveAgain = new Move();
				this._moveAgain.yTo = childMenu.y;
				
				seq.addChild(this._move);
				seq.addChild(this._moveAgain);
				seq.duration = duration*(i+1);
				seq.play();
				
				// 播放声音
				if(Main._isPlaySound){
					Main._soundEffect = new SoundEffect(childMenu);
					Main._soundEffect.source = "sounds/click.mp3";
					Main._soundEffect.play();
				}
			}
			
		}
		
		/**	显示冒烟的咖啡，
		 * 	@param coffee:要显示的咖啡对象
		 * */
		public function showSmokeCoffee(coffee:Image):void{
			// 显示冒烟的咖啡，并设置显示的Flash文件
			coffee.visible = true;
			coffee.source = "swf/smokecoffee.swf";
		}
		
		/**	设置显示标题栏菜单，
		 * 	@param titleMenu：要显示的标题栏出的菜单对象（TitleMenu）*/
		public function showTitleMenu(titleMenu:TitleMenu):void{
			// 定时，挨个显示标题菜单
			setTimeout(this.showTitleChildMenu,100,titleMenu.imgHome);
			setTimeout(this.showTitleChildMenu,150,titleMenu.imgNew);
			setTimeout(this.showTitleChildMenu,200,titleMenu.imgOnline);
		}
		
		/**	显示标题栏处菜单子项
		 * 	@param childTitle：要显示的子菜单*/
		private function showTitleChildMenu(childTitle:Image):void{
			
			childTitle.visible = true;
			
			var seq:Sequence = new Sequence(childTitle);

			this._move = new Move();
			this._move.yFrom = -24;
			this._move.yTo = 5;
			this._move.duration = 300;
			
			this._moveAgain = new Move();
			this._moveAgain.yTo = 0;
			this._moveAgain.duration = 50;
			
			seq.addChild(this._move);
			seq.addChild(this._moveAgain);
			seq.play();
		}
		
		/**	标题栏处的子菜单，鼠标移入，显示特效
		 * 	@param titleChildMenu：要显示特效的TitleMenu中的子元素（Image）*/
		public function titleChildMenu_rollOverHandler(titleChildMenu:Image):void{
			var seq:Sequence = new Sequence(titleChildMenu);
			
			this._move.xFrom = titleChildMenu.x;
			this._move.xTo = titleChildMenu.x;
			this._move.yFrom = 0;
			this._move.yTo = -10;
			this._move.duration = 100;
			
			this._moveAgain.xFrom = titleChildMenu.x;
			this._moveAgain.xTo = titleChildMenu.x;
			this._moveAgain.yTo = 5;
			this._moveAgain.duration = 100;
			
			this._moveThree.xFrom = titleChildMenu.x;
			this._moveThree.xTo = titleChildMenu.x;
			this._moveThree.yTo = 0;
			this._moveThree.duration = 50;
			
			seq.addChild(this._move);
			seq.addChild(this._moveAgain);
			seq.addChild(this._moveThree);
			seq.play();
			
			if(Main._isPlaySound){
				Main._soundEffect = new SoundEffect(titleChildMenu);
				Main._soundEffect.source = "sounds/click.mp3";
				Main._soundEffect.play();
			}
		}
				
		/**	鼠标移入菜单条的特效
		 * 	@param menuStrip:要显示特效的菜单条对象
		 * */
		public function menuStrip_rollOver(menuStrip:MenuStrip):void{
			// 显示菜单条下面的背景图片
			menuStrip.imgBG.alpha = 1;
			
			// 移动红点
			this._move.xFrom = 8;
			this._move.xTo = 0;
			this._move.target = menuStrip.imgDot;
			this._move.duration = 100;
			this._move.play();
			
			// 播放声音
			if(Main._isPlaySound){
				Main._soundEffect = new SoundEffect(menuStrip.imgDot);
				Main._soundEffect.source = "sounds/slide.mp3";
				Main._soundEffect.play();
			}
		}
		
		/**	鼠标移出菜单条的特效
		 * 	@param menuStrip:要显示特效的菜单条对象
		 * */
		public function menuStrip_rollOut(menuStrip:MenuStrip):void{
			// 隐藏菜单条下面的背景
			menuStrip.imgBG.alpha = 0;
			
			// 还原红点
			this._move.xFrom = 0;
			this._move.xTo = 8;
			this._move.target = menuStrip.imgDot;
			this._move.duration = 100;
			this._move.play();			
		}
		
		/**	要显示效果的层，切换显示内容的层的特效
		 * 	@param groupList：要显示效果的层的集合，*/
		public function showChildContent(groupList:ArrayCollection):void{
			
			// 删除弹出来的窗口
			Main.removeTitleWindow();
			for(var i:int = 0 ; i < groupList.length ; i ++){
				// 获取子菜单对象
				var obj:DisplayObject = groupList[i];
				
				obj.visible = true;
				
				// 创建序列
				var seq:Sequence = new Sequence(obj);
				
				// 先向下移动
				this._move = new Move();
				this._move.yFrom = obj.y-20;
				this._move.yTo = obj.y+20;
				
				// 在向上移动
				this._moveAgain = new Move();
				this._moveAgain.yTo = obj.y;
				
				seq.addChild(this._move);
				seq.addChild(this._moveAgain);
				seq.duration = 200+(i*80);
				seq.play();
				
				// 播放声音
				if(Main._isPlaySound){
					Main._soundEffect = new SoundEffect(obj);
					Main._soundEffect.source = "sounds/click.mp3";
					Main._soundEffect.play();
				}
			}
		}
		
		/**	要隐藏的层，切换显示层之前，先隐藏之前的层
		 * 	@param groupList:要隐藏的层的集合*/
		public function hideChildContent(groupList:ArrayCollection):Number{
			var duration:Number = -1;
			
			for(var i:int = 0 ; i < groupList.length ; i ++){
				// 获取子菜单对象
				var obj:DisplayObject = groupList[i];
				
				obj.visible = true;
				
				// 创建序列
				var seq:Sequence = new Sequence(obj);
				
				// 先向下移动
				this._move = new Move();
				this._move.xFrom = obj.x;
				this._move.xTo = obj.x-20;

				// 在向上移动
				this._moveAgain = new Move();
				this._moveAgain.xTo = 600;
				
				seq.addChild(this._move);
				seq.addChild(this._moveAgain);
				seq.duration = 200+(i*50);
				duration= seq.duration;
				seq.play();
				
				// 播放声音
				if(Main._isPlaySound){
					Main._soundEffect = new SoundEffect(obj);
					Main._soundEffect.source = "sounds/click.mp3";
					Main._soundEffect.play();
				}
			}
			
			return duration;
		}
		
		/**	鼠标移入图片，图片发白效果，鼠标变小手
		 * 	@param object：事件的对象*/
		public function rollOver_ImageByFade(event:MouseEvent):void{
			(event.currentTarget as DisplayObject).alpha = 0.8;
			Mouse.cursor = MouseCursor.BUTTON;
			
			// 播放声音
			if(Main._isPlaySound){
				Main._soundEffect = new SoundEffect(event.currentTarget as DisplayObject);
				Main._soundEffect.source = "sounds/slide.mp3";
				Main._soundEffect.play();
			}
		}
		
		/**	鼠标移入图片，图片还原发白效果，鼠标变会默认的
		 * 	@param event：事件对象*/
		public function rollOut_ImageByFade(event:MouseEvent):void{
			(event.currentTarget as DisplayObject).alpha = 1;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
	}
}