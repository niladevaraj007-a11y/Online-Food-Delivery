<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodExpress</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:'Poppins',sans-serif;

    width:100%;
    height:100vh;

    overflow:hidden;

    display:flex;
    justify-content:center;
    align-items:center;

    background:
    linear-gradient(rgba(0,0,0,.65),rgba(0,0,0,.65)),
    url("<%=request.getContextPath()%>/images/hero-food.jpg")
    center center/cover no-repeat;

}

body::before{

    content:"";

    position:absolute;
    inset:0;

    background:
    linear-gradient(135deg,
    rgba(255,107,53,.25),
    rgba(255,145,77,.10));

}

.food{

    position:absolute;

    font-size:40px;

    opacity:.18;

    animation:floatFood 14s linear infinite;

}

.food:nth-child(1){left:8%;top:85%;animation-delay:0s;}
.food:nth-child(2){left:22%;top:95%;animation-delay:2s;}
.food:nth-child(3){left:38%;top:88%;animation-delay:4s;}
.food:nth-child(4){left:55%;top:93%;animation-delay:6s;}
.food:nth-child(5){left:72%;top:90%;animation-delay:8s;}
.food:nth-child(6){left:90%;top:96%;animation-delay:10s;}

@keyframes floatFood{

0%{

transform:translateY(0) rotate(0deg);
opacity:.15;

}

50%{

opacity:.35;

}

100%{

transform:translateY(-120vh) rotate(360deg);
opacity:0;

}

}

.card{

    position:relative;

    z-index:10;

    width:90%;
    max-width:700px;

    padding:60px;

    border-radius:30px;

    text-align:center;

    background:rgba(255,255,255,.12);

    backdrop-filter:blur(18px);

    border:1px solid rgba(255,255,255,.25);

    box-shadow:0 30px 70px rgba(0,0,0,.35);

    animation:cardAppear 1s ease;

}

.logo{

    width:140px;
    height:140px;

    margin:auto;

    border-radius:50%;

    background:linear-gradient(135deg,#ff6b35,#ff914d);

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:70px;

    box-shadow:0 0 40px rgba(255,107,53,.8);

    animation:logoFloat 3s ease-in-out infinite;

}

h1{

    margin-top:30px;

    font-size:54px;

    font-weight:800;

    background:linear-gradient(to right,#ffffff,#ff914d);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;

}

h2{

    margin-top:12px;

    color:#ffffff;

    font-weight:500;

    font-size:22px;

}

#typing{

    margin-top:25px;

    color:#f2f2f2;

    font-size:18px;

    min-height:28px;

}

.progress{

    width:100%;

    height:10px;

    margin-top:40px;

    border-radius:20px;

    overflow:hidden;

    background:rgba(255,255,255,.18);

}

.progress-fill{

    width:0;

    height:100%;

    background:linear-gradient(90deg,#ff6b35,#ff914d);

    animation:progress 3s linear forwards;

}

.loading{

    margin-top:18px;

    letter-spacing:3px;

    color:#fff;

    font-size:15px;

}

.footer{

    margin-top:40px;

    color:rgba(255,255,255,.7);

    font-size:14px;

}

@keyframes progress{

from{width:0;}
to{width:100%;}

}

@keyframes logoFloat{

0%,100%{

transform:translateY(0);

}

50%{

transform:translateY(-12px);

}

}

@keyframes cardAppear{

from{

opacity:0;
transform:translateY(40px);

}

to{

opacity:1;
transform:translateY(0);

}

}

.fadeOut{

animation:fadeOut .7s forwards;

}

@keyframes fadeOut{

to{

opacity:0;
transform:scale(.95);

}

}

@media(max-width:768px){

.card{

padding:40px 25px;

}

.logo{

width:110px;
height:110px;
font-size:55px;

}

h1{

font-size:38px;

}

h2{

font-size:18px;

}

}

</style>

</head>

<body>

<div class="food">🍕</div>
<div class="food">🍔</div>
<div class="food">🍟</div>
<div class="food">🍗</div>
<div class="food">🥤</div>
<div class="food">🍩</div>

<div class="card" id="card">

<div class="logo">
🍔
</div>

<h1>FoodExpress</h1>

<h2>Fresh Food • Fast Delivery • Happy Customers</h2>

<p id="typing"></p>

<div class="progress">

<div class="progress-fill"></div>

</div>

<div class="loading">
Loading Delicious Food...
</div>

<div class="footer">

Powered by FoodExpress © 2026

</div>

</div>

<script>

const messages=[

"Finding the best restaurants near you...",
"Preparing your delicious meals...",
"Applying today's best offers...",
"Almost Ready..."

];

let msg=0;
let char=0;

function type(){

const element=document.getElementById("typing");

if(char<messages[msg].length){

element.innerHTML+=messages[msg].charAt(char);

char++;

setTimeout(type,40);

}else{

setTimeout(()=>{

msg++;

if(msg<messages.length){

element.innerHTML="";
char=0;
type();

}

},500);

}

}

type();

setTimeout(()=>{

document.getElementById("card").classList.add("fadeOut");

},2800);

setTimeout(()=>{

window.location.href="<%=request.getContextPath()%>/jsp/home.jsp";

},3400);

</script>

</body>

</html>