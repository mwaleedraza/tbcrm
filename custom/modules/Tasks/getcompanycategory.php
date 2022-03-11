<<<<<<< HEAD
<?php

$id=$_REQUEST['id'];

$companybean=BeanFactory::getBean('Accounts',$id);


=======
<?php

$id=$_REQUEST['id'];

$companybean=BeanFactory::getBean('Accounts',$id);


>>>>>>> f76da31ca3d45dc2af3729a157f7904548c77879
echo $companybean->account_type;