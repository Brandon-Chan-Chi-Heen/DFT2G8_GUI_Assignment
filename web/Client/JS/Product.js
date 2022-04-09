var subtract = document.querySelector(".subtract-container");
var add = document.querySelector(".addition-container");
var qty = document.getElementById("qty");
var test = document.getElementById("test");
var btn = document.getElementById("addToCart-btn");
var h=1;

subtract.onclick=function(){
    if(h != 0){
        h-=1;
        document.getElementById("result").innerHTML = h;
    }
}

add.onclick=function(){
    if(h <= 49){
        h+=1; 
        document.getElementById("result").innerHTML = h;
    }
}

btn.onclick=function(){
    qty.value = h;
    qty.setAttribute('value', h);

    alert("Add To Cart: " + qty.value);
}
