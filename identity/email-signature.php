<?php
ini_set("display_errors", 0);
	
foreach($_POST as $key => $val)
  $_POST[$key] = htmlentities(stripslashes($val));

$signature = "<p>";

if(!empty($_POST["name"]))
	$signature .= "<p style='font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; margin-top:1em;'><strong>{$_POST["name"]}</strong><br />";

if(!empty($_POST["title1"]))
	$signature .= $_POST["title1"]."<br />";

if(!empty($_POST["title2"]))
	$signature .= $_POST["title2"]."<br />";

if(!empty($_POST["department"]))
	$signature .= $_POST["department"];

$signature .= "</p><p style='font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; margin-top:1em;'>";

if(!empty($_POST["telephone-area"]) && !empty($_POST["telephone-prefix"]) && !empty($_POST["telephone-postfix"]))
	$signature .= "T {$_POST["telephone-area"]} {$_POST["telephone-prefix"]}-{$_POST["telephone-postfix"]}<br />";
	
	if(!empty($_POST["fax-area"]) && !empty($_POST["fax-prefix"]) && !empty($_POST["fax-postfix"]))
	$signature .= "F {$_POST["fax-area"]} {$_POST["fax-prefix"]}-{$_POST["fax-postfix"]}<br />";
	
	if(!empty($_POST["mobile-area"]) && !empty($_POST["mobile-prefix"]) && !empty($_POST["mobile-postfix"]))
	$signature .= "M {$_POST["mobile-area"]} {$_POST["mobile-prefix"]}-{$_POST["mobile-postfix"]}<br />";

if(!empty($_POST["email"]))
	$signature .= "<a href=\"mailto:".$_POST["email"]."\">".$_POST["email"]."</a><br />";

if(!empty($_POST["web"]))
	$signature .= "<a href=\"http://".$_POST["web"]."\" target=\"_blank\">".$_POST["web"]."</a>";

$signature .= "</p><p style='font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; margin-top:1em;'><strong>ArtCenter College of Design</strong><br />";

$signature .= "1700 Lida St.<br />Pasadena, CA 91103<br />";


$signature .= "<a href=\"http://artcenter.edu\">www.artcenter.edu</a></p>
    <p style='font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:14px; margin-top:1em;'><img src=\"http://www2.artcenter.edu/designoffice/artcenter_dot.png\" /></p>";
?>


<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Guidelines for ArtCenter's new identity" />
<meta name="robots" content="index, follow" />
<meta name="googlebot" content="index, follow" />
<title>Identity Guidelines | ArtCenter Identity | ArtCenter College of Design</title>

<?php include("includes/header.php"); ?>

<script type="text/javascript" src="js/accordion.js"></script>
<style type="text/css">
.main {
	font-family: 'lyonregular';
	font-size: 21px;
	font-style: normal;
	line-height: 27px;
	font-weight: normal;
	margin: auto;

}

input {
	border:solid 1px #ccc;
	padding:4px;
	font-size:14px;
	margin-top:6px;
}
.long-field {
	width:640px;
}
.short-field {
	width:300px;
}
.field-label {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	line-height:21px;
}
.optional {
	color:#ccc;
}
.submit-button {
	color:#fff;
	padding:8px;
	background-color:#666;
}
h1 {
	font-family:Arial, Helvetica, sans-serif;
	font-size:24px;
}
.main h2 {
	font-family:Arial, Helvetica, sans-serif;
	font-size:18px;
}
.main h3 {
  font-family: 'Lyon Display Web';
  font-weight:  500;
  font-style:   normal;
  font-stretch: normal;
}
#signature-html {
	border:solid 1px #000;
	padding:10px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:13px;
	line-height:16px;
	width:628px;
	margin-bottom:60px;
}
</style>
</head>
<body class="guidelines" onLoad="document.body.style.opacity='1'" style="opacity:0; transition: opacity 1s; -webkit-transition: opacity 1s; /* Safari */">

<?php include("includes/logo.php"); ?>
    
<div class="gridContainer clearfix">
  <div id="LayoutDiv1">
  
  <?php include("includes/mobile_logo.php"); ?>
  
  	<div id="pageTitle">Email Signature<br>
  	  Generator<br>
  	</div>  
    <div id="pageCopy">
      <div class="container" style="padding:24px; border-top:solid 1px black; border-bottom:solid 1px black;">
      <div class="main">
      <form action="#" method="post">
<input type="Hidden" name="required" value="name,title,department,telephone,campus">


<table width="100%" border="0" cellspacing="0" cellpadding="4">
  <tr>
    <td colspan="2"><p>An ArtCenter email signature format has been developed to help standardize the appearance of staff and faculty emails. To ensure continuity in our communications the format follows the typographic conventions of the ArtCenter business card.</p>

<p style="padding-bottom:24px;">To generate your email signature, enter your information in the fields below and click &ldquo;Generate Signature.&rdquo; Then follow the directions for the version of Outlook you&rsquo;re using.</p>
<h3 style="padding-bottom:0px;">Step 1: Enter your information</h3></td>
  </tr>
  <tr>
    <td><span class="field-label"><strong>Name</strong></span><br /><input type="text" name="name" class="long-field" value="<?php echo $_POST["name"]?>"></td>
    <td><span class="field-label"><strong>Telephone</strong></span><br /><input type="text" name="telephone-area" value="<?php echo $_POST["telephone-area"]?>" size="2" maxlength="3" >&nbsp;<input type="text" name="telephone-prefix" value="<?php echo $_POST["telephone-prefix"]?>" size="2" maxlength="3" >-<input type="text" name="telephone-postfix" value="<?php echo $_POST["telephone-postfix"]?>" size="3" maxlength="4" ></td>
  </tr>
  <tr>
    <td><span class="field-label"><strong>Title 1</strong></span><br /><input type="text" name="title1" value="<?php echo $_POST["title1"]?>" class="long-field"></td>
    <td><span class="field-label"><strong>Fax</strong> <span class="optional">(Optional)</span></span><br /><input type="text" name="fax-area" value="<?php echo $_POST["fax-area"]?>" size="2" maxlength="3" >&nbsp;<input type="text" name="fax-prefix" value="<?php echo $_POST["fax-prefix"]?>" size="2" maxlength="3" >-<input type="text" name="fax-postfix" value="<?php echo $_POST["fax-postfix"]?>" size="3" maxlength="4" ></td>
  </tr>
  <tr>
    <td><span class="field-label"><strong>Title 2</strong> <span class="optional">(Optional)</span></span><br /><input type="text" name="title2" value="<?php echo $_POST["title2"]?>" class="long-field"></td>
    <td><span class="field-label"><strong>Mobile</strong> <span class="optional">(Optional)</span></span><br /><input type="text" name="mobile-area" value="<?php echo $_POST["mobile-area"]?>" size="2" maxlength="3" >&nbsp;<input type="text" name="mobile-prefix" value="<?php echo $_POST["mobile-prefix"]?>" size="2" maxlength="3" >-<input type="text" name="mobile-postfix" value="<?php echo $_POST["mobile-postfix"]?>" size="3" maxlength="4" ></td>
  </tr>
  <tr>
    <td><span class="field-label"><strong>Department</strong></span><br /><input type="text" name="department" value="<?php echo $_POST["department"]?>" class="long-field"></td>
    <td><span class="field-label"><strong>Email Address</strong> <span class="optional">(Optional)</span></span><br /><input type="email" name="email" value="<?php echo $_POST["email"]?>" class="short-field"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="field-label"><strong>Secondary Web Address</strong> <span class="optional">(Optional)</span></span><br /><input type="Text" name="web" value="<?php echo $_POST["web"]?>" class="short-field"></td>
  </tr>
  
</table>

 

<input type="Submit" value="Generate Signature" class="submit-button" style="margin-top:40px; margin-bottom:40px;" >
</form>


<h3>Step 2: Select and copy the following:</h3>
<div id="signature-html">
  <?php
	echo $signature;
?>
</div>
<h3 style="margin-bottom:0px;">Step 3: Paste into Outlook</h3>
<div style="float:left; width:50%; padding-right:80px; padding-top: 12px;">
<p><strong>Outlook for Macintosh:</strong></p>
<ul>
  <li>Open Outlook, go to Preferences and find Signatures.</li>
  <li>Click the plus sign icon to add a new signature and then paste the signature you copied from this page into the text field. </li>
  <li>Replace the signature name &quot;untitled&quot; with the name of your choice.</li>
  <li>Make your new signature the default by clicking the check box next to the signature name. </li>
  <li>Compose a new email to confirm that the information and formatting are correct.</li>
</ul>
</div>

<div style="float:left; width:50%; padding-right:80px; padding-top: 12px;">
<p><strong>Outlook for Windows:</strong></p>
<ul>
  <li>Open Outlook</li>
  <li>Click File, then Options, Mail, Signature, and New.</li>
  <li>Enter a name for the new signature.</li>
  <li>Click in the text area and paste (Ctr-V) the signature you copied from this page.</li>
  <li>Choose the new signature as your default for new email and replies.</li>
  <li>Click OK to save the signature, and then click OK to close Options.</li>
  <li>Compose a new email to confirm that the information and formatting are correct.</li>
</ul>
</div>
<p style="clear:both;"></p>
      </div>
      

	  </div>
    </div>
</div>
    	
    </div>
  </div>
</div>

<?php include("includes/overlay_menu.php"); ?>

</body>
</html>
