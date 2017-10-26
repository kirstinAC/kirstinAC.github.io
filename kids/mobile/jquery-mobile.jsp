<!DOCTYPE html> 
<html> 
	<head> 
	<title>PhotoSwipe</title> 
	
	<link rel="stylesheet" href="/kids/mobile/gallery/lib/jquery.mobile-1.0a4.1/jquery.mobile-1.0a4.1.min.css" />
	<link href="/kids/mobile/gallery/photoswipe.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
		div.gallery-row:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
		div.gallery-item { float: left; width: 33.333333%; }
		div.gallery-item a { display: block; margin: 5px; border: 1px solid #3c3c3c; }
		div.gallery-item img { display: block; width: 100%; height: auto; }
		#Gallery1 .ui-content, #Gallery2 .ui-content { overflow: hidden; }
	</style>
	
	<script type="text/javascript" src="/kids/mobile/gallery/lib/jquery-1.6.1.min.js"></script>
	<script type="text/javascript" src="/kids/mobile/gallery/lib/jquery.mobile-1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
	
	<script type="text/javascript" src="/kids/mobile/gallery/lib/simple-inheritance.min.js"></script>
	<script type="text/javascript" src="/kids/mobile/gallery/lib/jquery.animate-enhanced.min.js"></script>
	
	<script type="text/javascript" src="/kids/mobile/gallery/code-photoswipe-jQuery-1.0.12.min.js"></script>
	
	
	<script type="text/javascript">
		
		/*
			This example shows how to set up PhotoSwipe using jQuery Mobile.
		*/
		
		$(document).ready(function(){
			
			$('div.gallery-page').live('pageshow', function(e){
					
				// Re-initialize with the photos for the current page
				$("div.gallery a", e.target).photoSwipe();
				return true;
				
			})
				
		});
	
	</script>
	
</head> 
<body> 


<div data-role="page" id="Home">

	<div data-role="header">
		<h1>PhotoSwipe</h1>
	</div>
	
	
	<div data-role="content" >	
		
		<p>These examples show PhotoSwipe integrated with jQuery Mobile:</p>		
		
		<ul data-role="listview" data-inset="true">
			<li><a href="#Gallery1">First Gallery</a></li> 
			<li><a href="#Gallery2">Second Gallery</a></li> 
		</ul> 
		
		<p>PhotoSwipe has also been designed to run stand-alone and can be easily integrated into your non jQuery / jQuery mobile websites:</p>
		
		<ul data-role="listview" data-inset="true">
			<li><a href="http://m.codecomputerlove.com/flickr-uploads/default.aspx" target="_blank">Code Computerlove</a></li> 
		</ul> 
		
	</div>

	<div data-role="footer">
		<h4>&copy; 2011 Code Computerlove</h4>
	</div>

</div>


<div data-role="page" id="Gallery1" class="gallery-page">

	<div data-role="header">
		<h1>First Gallery</h1>
	</div>

	<div data-role="content">	
		
		<div class="gallery">
	
			<div class="gallery-row">
		
				<div class="gallery-item"><a href="/kids/images/gallery/01_big.jpg" rel="external"><img src="/kids/images/gallery/01.jpg" alt="Image 01" /></a></div>
				<div class="gallery-item"><a href="/kids/images/gallery/02_big.jpg" rel="external"><img src="/kids/images/gallery/02.jpg" alt="Image 02" /></a></div>
				<div class="gallery-item"><a href="/kids/images/gallery/03_big.jpg" rel="external"><img src="/kids/images/gallery/03.jpg" alt="Image 03" /></a></div>
				
			</div>

		
			<div class="gallery-row">
		
				<div class="gallery-item"><a href="/kids/images/gallery/01_big.jpg"><img src="/kids/images/gallery/01.jpg" alt="Image 01" /></a></div>
				<div class="gallery-item"><a href="/kids/images/gallery/02_big.jpg"><img src="/kids/images/gallery/02.jpg" alt="Image 02" /></a></div>
				<div class="gallery-item"><a href="/kids/images/gallery/03_big.jpg"><img src="/kids/images/gallery/03.jpg" alt="Image 03" /></a></div>
		
			</div>
		
			<div class="gallery-row">
		
				<div class="gallery-item"><a href="images/full/007.jpg" rel="external"><img src="images/thumb/007.jpg" alt="Image 007" /></a></div>
				
				<div class="gallery-item"><a href="images/full/008.jpg" rel="external"><img src="images/thumb/008.jpg" alt="Image 008" /></a></div>
				
				<div class="gallery-item"><a href="images/full/009.jpg" rel="external"><img src="images/thumb/009.jpg" alt="Image 009" /></a></div>

			</div>
		
		
		</div>
		
	</div>
	
	<div data-role="footer">
		<h4>&copy; 2011 Code Computerlove</h4>
	</div>
	
</div>

<div data-role="page" id="Gallery2" class="gallery-page">

	<div data-role="header">
		<h1>Second Gallery</h1>
	</div>

	<div data-role="content">	
		
		<div class="gallery">
	
		
			<div class="gallery-row">
		
				<div class="gallery-item"><a href="images/full/010.jpg" rel="external"><img src="images/thumb/010.jpg" alt="Image 010" /></a></div>
				
				<div class="gallery-item"><a href="images/full/011.jpg" rel="external"><img src="images/thumb/011.jpg" alt="Image 011" /></a></div>
				
				<div class="gallery-item"><a href="images/full/012.jpg" rel="external"><img src="images/thumb/012.jpg" alt="Image 012" /></a></div>
		
			</div>
		
			<div class="gallery-row">
		
				<div class="gallery-item"><a href="images/full/013.jpg" rel="external"><img src="images/thumb/013.jpg" alt="Image 013" /></a></div>
				
				<div class="gallery-item"><a href="images/full/014.jpg" rel="external"><img src="images/thumb/014.jpg" alt="Image 014" /></a></div>
				
				<div class="gallery-item"><a href="images/full/015.jpg" rel="external"><img src="images/thumb/015.jpg" alt="Image 015" /></a></div>
		
			</div>
			
			<div class="gallery-row">
	
				<div class="gallery-item"><a href="images/full/016.jpg" rel="external"><img src="images/thumb/016.jpg" alt="Image 016" /></a></div>
				
				<div class="gallery-item"><a href="images/full/017.jpg" rel="external"><img src="images/thumb/017.jpg" alt="Image 017" /></a></div>
				
				<div class="gallery-item"><a href="images/full/018.jpg" rel="external"><img src="images/thumb/018.jpg" alt="Image 018" /></a></div>
		
			</div>
		
		</div>
		
	</div>

	<div data-role="footer">
		<h4>&copy; 2011 Code Computerlove</h4>
	</div>

</div>


</body>
</html>