<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class Article extends Model{
		public static getList(){
			Db::name("article")->select();
		}
	}
?>