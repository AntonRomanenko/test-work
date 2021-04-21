<?php 
class ArrayRange
{
    private $arrayNumbers;
    private $arrayString;

    function __construct()
    {
        $this->arrayNumbers = range(1, 26);
        $this->arrayString = range('a', 'z');
    }

    public function arrayInterweave()
    {
        $countArrayNumbers = count($this->arrayNumbers);
        $countArrayString = count($this->arrayString);
        $length = (($countArrayNumbers >= $countArrayString) ? $countArrayNumbers : $countArrayString);

        $fin = [];
        for ($i = 0; $i < $length; $i++) {
            if (!empty($this->arrayNumbers[$i])) {
                $fin[] = $this->arrayNumbers[$i];
            }
            if (!empty($this->arrayString[$i])) {
                $fin[] = $this->arrayString[$i];
            }
        }

        return $fin;
    }

    public function getarrayNumbers() {
        return $this->arrayNumbers;
    }

    public function getArrayString() {
        return $this->arrayString;
    }
}

$class = new ArrayRange();

echo '<pre>';
var_export($class->arrayInterweave());
var_export($class->getarrayNumbers());
var_dump($class->getArrayString());
echo '</pre>';

?>