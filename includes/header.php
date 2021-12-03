
<header>
  <div class="default-header">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-2">
          <div class="logo"> <img src="assets/images/logo.png" alt="image"/></div>
        </div>
        <div class="col-sm-9 col-md-10">
          <div class="header_info">
            
          
   <?php   if(strlen($_SESSION['login'])==0)
	{	
?>
 <div class="login_btn"> <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Prijavljivanje / Registracija</a> </div>
<?php }
else{ 

echo '<img src="admin/img/avatar.png" alt="icon" />';
 } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i> 
<?php 
$search = '';

if(isset($_POST['search'])){
    $search = trim($_POST['search']);
}

$email=$_SESSION['login'];
$sql ="SELECT FullName FROM tblusers WHERE EmailId=:email ";
$query= $dbh -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
	{

	 echo htmlentities($result->FullName); }}?><i class="fa fa-angle-down" aria-hidden="true"></i></a>
              <ul class="dropdown-menu">
           <?php if($_SESSION['login']){?>
            <li><a href="profile.php">Profil</a></li>
              <li><a href="update-password.php">Promeni lozinku</a></li>
            <li><a href="my-booking.php">Moje rezervacije</a></li>
            <li><a href="logout.php">Odjava</a></li>
            <?php } else { ?>
            <li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Profil</a></li>
              <li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Promeni lozinku</a></li>
            <li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Moje rezervacije</a></li>
            <li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Odjava</a></li>
            <?php } ?>
          </ul>
            </li>
          </ul>
        </div>
        <div class="header_search">
          <div id="search_toggle"><i class="fa fa-search" aria-hidden="true"></i></div>
          <form action="search-carresult.php" method="post" id="header-search-form">
            <input type="text" placeholder="Pretrazi automobil" class="form-control" name='search' value='<?php echo $search; ?>'/>
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
          </form>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.php">Pocetna</a></li>
          <li><a href="car-listing.php">Ponuda automobila</a>
          <li><a href="contact-us.php">Kontakt</a></li>
          <li><a href="admin/">Admin Prijava</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end --> 
  
</header>