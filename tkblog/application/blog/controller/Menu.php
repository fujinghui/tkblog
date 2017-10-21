<?php
	namespace app\blog\controller;
	use think\Controller;
	class Menu extends Controller{

		public function index(){
			$result = array('status'=>1);
			return json_encode($result);
		}
		public function getMenuList(){
			$menus = array("menu"=>array(
				array("menu1","2017-02-01"), 
				array("menu2","2017-03-01"),
				array("menu3","2017-04-01"),
				array("menu4","2017-05-01"),
				array("menu5","2017-06-01")
				));
			return json($menus);
		}
	}
?>