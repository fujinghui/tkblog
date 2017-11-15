<?php
	namespace app\blog\controller;
	use think\Controller;
	use app\blog\model\CategoriesModel;

	use think\Db;
	class Menu extends Controller{
		//private $cateogories = new Categories; 
		public function index(){
			$result = array('status'=>1);
			return json_encode($result);
		}
        public function getMenuList(){
            //header("Access-Control-Allow-Origin:*");
			$menus = CategoriesModel::getMenuList();
			$result = array();
			$result["menu"] = array();

			//print_r $menus;
			for($i = 0; $i < count($menus); $i ++)
			{
				$result["menu"][$i] = array();
				$result["menu"][$i][0] = $menus[$i]["categories_name"];
				$result["menu"][$i][1] = "";
			}
			return json($result);
			// $menus = array("menu"=>array(
			// 	array("menu1","2017-02-01"), 
			// 	array("menu2","2017-03-01"),
			// 	array("menu3","2017-04-01"),
			// 	array("menu4","2017-05-01"),
			// 	array("menu5","2017-06-01")
			// 	));
			//return json($result);
		}
	}
?>
