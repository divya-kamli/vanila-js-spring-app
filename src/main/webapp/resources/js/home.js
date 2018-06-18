function getContent(divId)
{
	hideAllDiv();
	var obj=document.getElementById(divId);
	obj.style.display='block';
}
function hideAllDiv()
{
	 var divs = document.getElementsByClassName("divContent");
	 for (i = 0; i < divs.length; i++) {
		 divs[i].style.display = "none"; 
	  }
}
function toggleActive(obj)
{
	var par=obj.parentNode;
	var divs = document.getElementsByClassName("lactive");
	 for (i = 0; i < divs.length; i++) {
		divs[i].classList.remove("lactive");
	  }
	 par.classList.add("lactive");
}

var slideIndex = 1;

function onLoadMod()
{
	showSlides(slideIndex);
	getContent("home");
}

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}
