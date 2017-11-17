<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class CategoriesModel extends Model{
		//protected $connection = ""
		public static function getMenuList(){
			return Db::table("categories")->select();
		}
		public function getCategoriesById($id){
			$result = Db::table("categories")->where("categories_id", $id)->select();
			if(count($result) > 0)
				return $result[0];
			return null;
		}
	}
?>