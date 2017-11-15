<?php
	namespace app\blog\model;
	use think\Model;
	use think\Db;
	class ArticleModel extends Model{
		/*
		* 2017.11.15 femy
		* article model
		*/
		protected $name = "article";
		public static function getList(){
			Db::name("article")->select();
		}
		//get all article list
		public function getArticles(){
			return $this->select();
		}
	}
?>