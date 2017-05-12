<?php

class Base extends \Phalcon\Mvc\Model
{

    public function parsing_url(){
		$uri_arr=explode("?",$_SERVER['REQUEST_URI']);
		if (!empty($uri_arr[1])) {
			$url=$uri_arr[1];
			$url_arr=explode("&",$url);
			if (count($url_arr)>1) {
				foreach ($url_arr as $key => $value) {
					if ($key==0) {
						continue;
					}
					$val[]="'".explode("=",$value)[1]."'";
				}
				$url_string=implode(",",$val);
				return $url_string;
			}else{
				return '';
			}
		}else{
			return '';
		}
	}

}
