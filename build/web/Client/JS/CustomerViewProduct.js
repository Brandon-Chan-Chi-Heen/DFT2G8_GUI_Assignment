/* Slideshow */
var dot = document.getElementsByClassName("dot");
var slideShow = document.getElementsByClassName("slideShow");
var i=0;

dot[0].onclick=function(){
    for(i=0;i<dot.length;i++){
        dot[i].classList.remove("active");
        slideShow[i].style.cssText=`
            visibility:hidden;
            opacity:0;
        `;
    }
    slideShow[0].style.cssText=`
        visibility:visible;
        opacity:1;
    `;
    this.classList.add("active");
}

dot[1].onclick=function(){
    for(i=0;i<dot.length;i++){
        dot[i].classList.remove("active");
        slideShow[i].style.cssText=`
            visibility:hidden;
            opacity:0;
        `;
    }
    slideShow[1].style.cssText=`
        visibility:visible;
        opacity:1;
    `;
    this.classList.add("active");
}

dot[2].onclick=function(){
    for(i=0;i<dot.length;i++){
        dot[i].classList.remove("active");
        slideShow[i].style.cssText=`
            visibility:hidden;
            opacity:0;
        `;
    }
    slideShow[2].style.cssText=`
        visibility:visible;
        opacity:1;
    `;
    this.classList.add("active");
}

dot[3].onclick=function(){
    for(i=0;i<dot.length;i++){
        dot[i].classList.remove("active");
        slideShow[i].style.cssText=`
            visibility:hidden;
            opacity:0;
        `;
    }
    slideShow[3].style.cssText=`
        visibility:visible;
        opacity:1;
    `;
    this.classList.add("active");
}

/* Top Gaming Products */
const products = document.querySelectorAll(".product-col3");
const prev = document.querySelector(".prev");
const next = document.querySelector(".next");
let j=0;
let x=0;
let z=0;
let y=0;
let t=0;

next.onclick = function(){
        t=j;
        if(j != products.length){
            for(j=t ; j < products.length;j++){
                products[j].classList.remove("active");
            }
            t=(t+3)%products.length;
            y=3+t;
            console.log(t)
            for(j=t; j < y;j++){
                products[j].classList.add("active");
            }
            j=t;
        }
        console.log(j);
}

prev.onclick = function(){
    if(j!=0){
        x=j;
        z=x;
        for(j=x ; j < products.length;j++){
            products[j].classList.remove("active");
        }
        x=(x-3+products.length)%products.length;
        for(j=x ; j < z;j++){
            products[j].classList.add("active");
        }
        j=x;
        console.log(j);
    }
}

