<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class UserModel extends Model{
		public static function getUserById($id){
			$result = Db::table("user")->where("user_id", $id)->select();
			if(count($result) > 0)
				return $result[0];
			return null;
		}
	}
?>