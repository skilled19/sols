<?php
    class CodeAbbey
    {
        protected static $_instance;
        private function __construct()
        {
        }
        private function __clone()
        {
        }
        public static function getInstance()
        {
            if (null === self::$_instance)
            {
                self::$_instance = new self();
            }
            return self::$_instance;
        }
        private function primefactor($num) 
        {
            $sqrt = sqrt($num);
            for ($i = 2; $i <= $sqrt; $i++) 
            {
                if (bcmod($num,$i) == 0) 
                {
                    $array = array_merge(self::primefactor($num/$i), array($i));
                    sort($array);
                    return $array;
                }
            }
            return array($num);
        }
        public function intfac($data)
        {
            $f = file( $data, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($f as $key => $value)
            {
                $composite = self::primefactor($value);
                foreach ($composite as $key => $value)
                    $result .= $value."*";
                $result = substr($result,0,-1)." ";
            };
            return $result;
        }
    }

    echo CodeAbbey::getInstance()->intfac('php://stdin');
