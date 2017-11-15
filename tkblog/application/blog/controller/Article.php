<?php
	namespace app\blog\controller;
	use think\Controller;
	use app\blog\model\ArticleModel;
	use app\blog\standard\FRS;
	class Article extends Controller{
		public function index(){

		}
		public function getArticles(){
			$article = new ArticleModel();
			$list = $article->getArticles();
			$frs = new FRS();

			$frs->data = $list;
			$frs->count = count($list);
			$frs->status = 1;
			return json($frs);
		}
	}

?>