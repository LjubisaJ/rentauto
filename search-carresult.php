<?php 
session_start();
include('includes/config.php');
error_reporting(0);
?>

<!DOCTYPE HTML>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>Pretraga automobila</title>
<!--Bootstrap -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
<!--Custome Style -->
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
<!--OWL Carousel slider-->
<link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
<!--slick-slider -->
<link href="assets/css/slick.css" rel="stylesheet">
<!--bootstrap-slider -->
<link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
<!--FontAwesome Font Style -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet">


        
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="assets/images/favicon-icon/favicon.ico">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>
<body>


<!--Header--> 
<?php include('includes/header.php');?>
<!-- /Header --> 

<!--Page Header-->
<section class="page-header listing_page">
  
</section>
<!-- /Page Header--> 

<!--Listing-->
<section class="listing-page">
  <div class="container">
    <div class="row">
      <div class="col-md-9 col-md-push-3">
        <div class="result-sorting-wrapper">
          <div class="sorting-count">
<?php 
//Query for Listing count

$brand=$_POST['brand']; //ID 
$fueltype=$_POST['fueltype']; //Naziv
$first_param = false;
$second_param = false;


$sql = "SELECT id from tblvehicles where ";

if($brand != "Izaberi model" && $brand != null){
    $sql .= "tblvehicles.VehiclesBrand=:brand ";
    $first_param = true;
    
}

if($fueltype != "Izaberi vrstu goriva" && $fueltype != null){
    if($first_param){
        $sql .= "and ";
    }
    $sql .= "tblvehicles.FuelType=:fueltype ";
    $second_param = true;
}
$query = null;

if($first_param && !$second_param){
    $query = $dbh -> prepare($sql);
    $query -> bindParam(':brand',$brand, PDO::PARAM_STR);
}
else if($second_param && !$first_param){
    $query = $dbh -> prepare($sql);
    $query -> bindParam(':fueltype',$fueltype, PDO::PARAM_STR);
}
else if(!$first_param && !$second_param){
    if(!empty($search)){
        
        $query = $dbh->prepare("SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblbrands.BrandName LIKE ?");
        $query -> bindValue(1, "%$search%");
    }
    else {
        $sql = "SELECT id from tblvehicles where tblvehicles.VehiclesBrand=:brand and tblvehicles.FuelType=:fueltype ";
        $query = $dbh -> prepare($sql);
        $query -> bindParam(':brand',$brand, PDO::PARAM_STR);
        $query -> bindParam(':fueltype',$fueltype, PDO::PARAM_STR);
    }
}
else{
    $query = $dbh -> prepare($sql);
    $query -> bindParam(':brand',$brand, PDO::PARAM_STR);
    $query -> bindParam(':fueltype',$fueltype, PDO::PARAM_STR);
}




$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=$query->rowCount();
?>
<p><span><?php echo htmlentities($cnt);?> pronadjenih vozila</span></p>
</div>
</div>

<?php 
/*
$sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.VehiclesBrand=:brand and tblvehicles.FuelType=:fueltype";
$query = $dbh -> prepare($sql);
$query -> bindParam(':brand',$brand, PDO::PARAM_STR);
$query -> bindParam(':fueltype',$fueltype, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;*/
   
   foreach($results as $object){
       $query = $dbh->prepare("SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.id = :id");
       $query->bindParam(":id", $object->id);
       $query->execute();
       $car_result = $query->fetchAll(PDO::FETCH_OBJ);
       foreach($car_result as $result){  ?>
            <div class="product-listing-m gray-bg">
              <div class="product-listing-img"><img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1);?>" class="img-responsive" alt="Image" />
              </div>
              <div class="product-listing-content">
                <h5><a href="vehical-details.php?vhid=<?php echo htmlentities($result->id);?>"><?php echo htmlentities($result->BrandName);?> , <?php echo htmlentities($result->VehiclesTitle);?></a></h5>
                <p class="list-price"><?php echo htmlentities($result->PricePerDay);?> po danu</p>
                <ul>
                  <li><i class="fa fa-user" aria-hidden="true"></i><?php echo htmlentities($result->SeatingCapacity);?> sedista</li>
                  <li><i class="fa fa-calendar" aria-hidden="true"></i><?php echo htmlentities($result->ModelYear);?> Godina proizvodnje</li>
                  <li><i class="fa fa-car" aria-hidden="true"></i><?php echo htmlentities($result->FuelType);?></li>
                </ul>
                <a href="vehical-details.php?vhid=<?php echo htmlentities($result->id);?>" class="btn">Detalji <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
              </div>
            </div>
          <?php }
      } 
   
      ?>
         </div>
      
      <!--Side-Bar-->
      <aside class="col-md-3 col-md-pull-9">
        <div class="sidebar_widget">
          <div class="widget_heading">
            <h5><i class="fa fa-filter" aria-hidden="true"></i>Pronadji auto po zelji </h5>
          </div>
          <div class="sidebar_filter">
            <form  action='search-carresult.php' method="post">
              <div class="form-group select">
                <select class="form-control" name='brand'>
                  <option>Izaberi model</option>

                  <?php $sql = "SELECT * from  tblbrands ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{       ?>  
<option value="<?php echo htmlentities($result->id);?>" <?php if($brand == $result->id) echo 'selected';?>><?php echo htmlentities($result->BrandName);?></option>
<?php }} ?>
                 
                </select>
              </div>
              <div class="form-group select">
                <select class="form-control" name='fueltype'>
                  <option>Izaberi vrstu goriva</option>
<option value="Benzin" <?php if($fueltype == "Benzin") echo 'selected'; ?>>Benzin</option>
<option value="Dizel" <?php if($fueltype == "Dizel") echo 'selected'; ?>>Dizel</option>
<option value="Plin" <?php if($fueltype == "Plin") echo 'selected'; ?>>Plin</option>
                </select>
              </div>
             
              <div class="form-group">
                <button type="submit" class="btn btn-block">
                	<i class="fa fa-search" aria-hidden="true"></i>
                	Pretrazi automobil
                </button>
              </div>
            </form>
          </div>
        </div>

      </aside>
      <!--/Side-Bar--> 
    </div>
  </div>
</section>
<!-- /Listing--> 

<!--Footer -->
<?php include('includes/footer.php');?>
<!-- /Footer--> 

<!--Back to top-->
<div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
<!--/Back to top--> 

<!--Login-Form -->
<?php include('includes/login.php');?>
<!--/Login-Form --> 

<!--Register-Form -->
<?php include('includes/registration.php');?>

<!--/Register-Form --> 

<!--Forgot-password-Form -->
<?php include('includes/forgotpassword.php');?>

<!-- Scripts --> 
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script> 
<script src="assets/js/interface.js"></script> 

<!--bootstrap-slider-JS--> 
<script src="assets/js/bootstrap-slider.min.js"></script> 
<!--Slider-JS--> 
<script src="assets/js/slick.min.js"></script> 
<script src="assets/js/owl.carousel.min.js"></script>

</body>
</html>
