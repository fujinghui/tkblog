<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class CategoriesModel extends Model{
		//protected $connection = ""
		public static function getMenuList(){
			return Db::table("categories")->select();
		}
	}
?>