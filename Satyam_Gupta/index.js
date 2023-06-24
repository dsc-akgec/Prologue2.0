let id
      
let slideIndex = 1;
showSlides(slideIndex);
setInterval(plusSlides, 4000,1); 
function plusSlides(n) {

    slideIndex += n;
    console.log(slideIndex);
   
  
  showSlides(slideIndex);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}


function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("slider");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }

if (slideIndex > slides.length) {slideIndex = 1}  
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
    
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  


}

document.getElementById("sidebar").onclick=open;
document.getElementById("hide-sidebar").onclick=close;

function open() {
document.getElementById("mySidebar").style.display = "block";
}

function close() {
document.getElementById("mySidebar").style.display = "none";
}

let c=3;
let d=3;

document.getElementById("a").onclick=dropdown;
function dropdown(){
  if(c%2==1){
    document.getElementById("dropdown-contentt").style.display="block";
    c++;
  }
  else{
    document.getElementById("dropdown-contentt").style.display="none";
    c++;
  }
}

document.getElementById("as").onclick=dropdownn;
function dropdownn(){
  if(d%2==1){
    document.getElementById("dropdown-contenttt").style.display="block";
    d++
  }
  else{
    document.getElementById("dropdown-contenttt").style.display="none";
    d++
  }
}



