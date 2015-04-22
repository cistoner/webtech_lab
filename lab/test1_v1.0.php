<?php 
/**
 * Desclaimier: this work has been done under public licence by
 * Minhaz under Cistoner Inc. This is first direct implementation of
 * Custom Structured Query and is in a very raw form!
 * CSQ is basically a method to make client server interation smoother 
 * to make data fetching an easier task to do!
 * 
 * 
 * What this piece of code is capable of doing
 * Take in certain form of CSQ and generate corresponding SQL queries
 * WORKS FOR: ADD,EDIT,REMOVE OPEATIONS for one way and two way methods
 * 
 * Disadvantages: 
 * 1.does not work when more than one query is needed in one operation
 * 2.Currently support only Add, Edit and Delete
 * 3.Not a very standard code so it works only for a a specified server
 * 4.No exception method to detect a wrong CSQ
 * 
 */
echo "========================================" .newLine();
include 'ds.php';
function newLine(){return "<br>" .PHP_EOL;}
/**
 * test string
 */
$string = "ADD EMAIL {1,3,4,5} TO GROUP {2,3}";
echo "CSQ = " .$string .newLine();
/**
 * these two array will be used to load up
 * sent collections to arrays
 */
$arr1 = array();
$arr2 = array();

/**
 * regular expression to 
 * identify items in charecter
 */
$regex = "/{(.*?)}/i";

//finding first entity
preg_match($regex, $string, $matches, PREG_OFFSET_CAPTURE);
if(isset($matches[1][0]))
{
	$arr = explode(",",$matches[1][0]);
	$len = count($arr);
	for($i = 0;$i<$len;$i++){$arr1[count($arr1)] = $arr[$i];}
	/**
	 * replace the existing content with 
	 * a space in place of {} content
	 */
	$string = preg_replace('~\s{1,}~', ' ',str_replace($matches[0][0],"",$string));
	
}

preg_match($regex, $string, $matches, PREG_OFFSET_CAPTURE);
if(isset($matches[1][0]))
{
	$arr = explode(",",$matches[1][0]);
	$len = count($arr);
	for($i = 0;$i<$len;$i++){$arr2[count($arr2)] = $arr[$i];}
	$string = preg_replace('~\s{1,}~', ' ',str_replace($matches[0][0],"",$string));

}

/**
 * to remove the last space 
 */
while(substr($string,-1) == ' ')
{
	$string = substr($string, 0 ,count($string) - 2);
}
$arr = explode(" ",$string);

/**
 * giving positions to data
 */
$isDientityModel = false;
$action = $arr[0];
$entity1 = $arr[1];
if(isset($arr[3]))
{
	$entity2 = $arr[3];
	$dir = $arr[2];
	$isDientityModel = true;
}
else if(isset($arr[2]))$entity2 = $arr[2];

//==============================================
echo "========================================" .newLine() ."OUTPUT" .newLine();
echo "[ ACTION ] " .$action ." - " .$actionDetail[$action] .newLine();
if($isDientityModel){
		echo "[ MODEL ] TWO ENTITY MODEL" .newLine();
		echo "[ ENTITY-1 ] " .$entity1 .newLine();
		echo "[ ENTITY-2 ] " .$entity2 .newLine();
		echo "[ DIRECTIONAL ] " .$dir .newLine();
}
else{
	echo "[ MODEL ] ONE ENTITY MODEL" .newLine();
	echo "[ ENTITY-1 ] " .$entity1 .newLine();	
}
echo "========================================" .newLine();
$sql = "";

echo newLine() ."SQL = " .newLine();
echo "========================================" .newLine();
if($isDientityModel)
{
	$sql .= $tableName[$action ."_" .$entity1 ."_" .$entity2];
	for($j = 0; $j < count($arr2);$j++)
	{
		for($i = 0;$i<count($arr1);$i++)
		{
			$out =  str_replace("ielem", $arr1[$i],$sql);
			$out =  str_replace("jelem", $arr2[$j],$out);
			echo $out .newLine();
		}
	}
}
else {
	$sql .= $tableName[$action ."_" .$entity1];
	for($i = 0;$i<count($arr1);$i++)
		{
			$out =  str_replace("ielem", $arr1[$i],$sql);
			echo $out .newLine();
		}
}

?>