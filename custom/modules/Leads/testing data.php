<?php
// $connect = mysqli_connect("localhost", "root", "", "suitecrm");
// $number = count($_POST["name"]);
// if($number > 0)
// {
//      for($i=0; $i<$number; $i++)
//      {
//           if(trim($_POST["name"][$i] != ''))
//           {
//                $sql = "INSERT INTO custom_name(name) VALUES('".mysqli_real_escape_string($connect, $_POST["name"][$i])."')";
//                mysqli_query($connect, $sql);
//           }
//      }
//      echo "Data Inserted";
// }
// else
// {
//      echo "Please Enter Name";
// }
$sql = "SELECT id,name FROM aos_products";
$result = $GLOBALS['db']->query($sql);

while($row = $GLOBALS['db']->fetchByAssoc($result) )
{
    //Use $row['id'] to grab the id fields value
    $id = $row['name'];
    echo<br>
    echo $id;

}
---------------------------------------------------------
<?php
if (!defined('sugarEntry')|| !sugarEntry){
  die('Not A Valid Entry Point');
}
class Save
{
  public function SaveAll(&$bean, $event, $arguments)
  {
    foreach ($_REQUEST['name'] as $key => $value) {
        $sql = "SELECT id,name FROM aos_products";
        $result = $GLOBALS['db']->query($sql);
        while($row = $GLOBALS['db']->fetchByAssoc($result) )
        {
            $name = $row['name'];
            $id=$row['id'];
            if ($name==$value)
            {
              $module='tc_leads_products';
              $bean1 = BeanFactory::newBean($module);
              $bean1->lead_id=$bean->id;
              $bean1->aos_product_id=$id;
              $bean1->save();
            }
        }
    }
  }
}
?>

// if (!defined('sugarEntry')|| !sugarEntry){
//   die('Not A Valid Entry Point');
// }
// $GLOBALS['db'];
// $number = count($_POST["name"]);
// if($number > 0)
// {
//      for($i=0; $i<$number; $i++)
//      {
//           if(trim($_POST["name"][$i] != ''))
//           {
//
//               $sql = "INSERT INTO aos_products(aos_product_id) VALUES('".$_POST["name"][$i]."')";
//               $result = $GLOBALS['db']-> query($sql);
//               echo $result;
//            }
//      }
//  }
// else {
//  echo "error";
//
// }


?>
