<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class Categories extends Model{
		//protected $connection = ""
		public static function getMenuList(){
			return Db::table("categories")->select();
		}
	}
?>