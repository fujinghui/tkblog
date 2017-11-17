<?php
	namespace app\blog\controller;
	use think\Controller;
	use app\blog\model\ArticleModel;
	use app\blog\model\UserModel;
	use app\blog\model\CategoriesModel;
	use app\blog\standard\FRS;
	class Article extends Controller{
		public function index(){

		}
		public function getArticles(){
			$user = new UserModel();
			$categories = new CategoriesModel();
			$article = new ArticleModel();
			$list = $article->getArticles();
			$frs = new FRS();
			for($i = 0; $i < count($list); $i ++)
			{
				$list[$i]->user_info = $user->getUserById($list[$i]->user_id);
				$list[$i]->categories_info = $categories->getCategoriesById($list[$i]->categories_id);
			}
			$frs->data = $list;
			$frs->count = count($list);
			$frs->status = 1;
			return json($frs);
		}
	}

?>