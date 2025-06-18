<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('./img/intro-carousel/18.jpg');">

 <jsp:include page="header/custheader.jsp"/> 
 
<%


String feedback=request.getParameter("feedback");
String query=request.getParameter("query");
String update=request.getParameter("update");



if(feedback!=null)
{
	out.print("<script>alert('Your Feedback Submittted successfuly')</script>");
}
if(request.getParameter("added")!=null)
{
	out.print("<script>alert('Product Added Success')</script>");
}
if(request.getParameter("payment")!=null)
{
	out.print("<script>alert('Order Placed Success')</script>");
}
else if(query!=null)
{
	out.print("<script>alert('Your query send to Admin successfully')</script>");
}


else if(update!=null)
{
	out.print("<script>alert('Data updated successfully')</script>");
}




response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setHeader("Cache-Control","no-store"); // HTTP 1.1
response.setDateHeader("Expires", 0);

if(session.getAttribute("username")==null){
	   
    response.sendRedirect("custLogin.jsp?Result=");       
}
else{

String username=session.getAttribute("username").toString();
String uid=session.getAttribute("id").toString();
%>


  <main id="main">

    <section id="services">
      <div class="container">
        <div class="section-header">
          <h2>Services</h2>
          <p>
Buy aromatic / fragrant plants : Largest online nursery for aromatic / fragrant plants including ixora mi... | 6000+ Plants n Seeds | All India delivery </p>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="box wow fadeInLeft">
              <div class="icon"><img  src="./img/pl.jpg" height="100" width="100"></img> </div>
            <center><h4 class="title"><a href="">Buy Plants Online</a></h4><br><br><br><br></center>  
              <p class="description"> <h2 style="font-size: 20px;color: Green">Plants by Type:</h2>	 <h2 style="font-size: 12px;color: black">Aquatic Plants / Avenue Trees / Bamboos / Bonsai Plants / Cactus n Succulents / Climbers n Creepers / Flowering Creepers  n like plants</h2>

<h2 style="font-size: 20px;color: Green">Plants by Feature:</h2> <h2 style="font-size: 12px;color: blue">Low Maintenance Plants / Nakshtra Plants / Plants Good for Containers / Plants to Attracts Birds n Butterflies / Drought Tolerant Plants / Aromatic Plants / Ground Cover.</h2>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInRight">
              <div class="icon"><img  src="./img/seed.png" height="100" width="100"></img></div>
             <center><h4 class="title"><a href="">Buy Seeds </a></h4></center> <br><br><br><br>
              <p class="description"><h2 style="font-size: 20px;color: Green">Vegetable Seeds:</h2>	 <h2 style="font-size: 12px;color: blue">All Vegetable Seeds / English Vegetable Seeds / Herb Seeds / Indian Vegetable Seeds / Pot Vegetable Seeds / Fall Vegetable Seeds (20°C to 30°C)</h2>

<h2 style="font-size: 20px;color: Green">Flower Seeds:</h2> <h2 style="font-size: 12px;color: blue">All Flower Seeds / Fall Flower Seeds (20°C to 30°C) / Rainy Flower Seeds (20°C to 30°C) / Summer Flower Seeds (25°C to 30°C) / Winter Flower Seeds (20°C to 25°C) / Year Round Flower Seeds.</h2>

            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInLeft" data-wow-delay="0.2s">
              <div class="icon"><img  src="./img/pot.jpg" height="100" width="100"></img></i></div>
              <h4 class="title"><a href="">Pots Online</a></h4><br><br><br><br>
              <p class="description"><h2 style="font-size: 20px;color: Green">Planters by Type: </h2>	 <h2 style="font-size: 12px;color: blue">Colorful Plastic Pots / Standard Plastic Pots / Fiber Glass Planters / Tyre Planters / Flower Tower / Germination Tray / Metal Planters / Reversible Planters.</h2>

<h2 style="font-size: 20px;color: Green">Planters by Shape::</h2> <h2 style="font-size: 12px;color: blue">Hexagon Pots / Rectangular Pots / Round Pots / Square Pots / Oval Pots.</h2>

            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInRight" data-wow-delay="0.2s">
              <div class="icon"><img  src="./img/pb.jpg" height="100" width="100"></img></i></div>
              <h4 class="title"><a href="">Pebbles Online</a></h4><br><br><br><br>
              <p class="description"><h2 style="font-size: 20px;color: Green">Pebbles:: </h2>	 <h2 style="font-size: 12px;color: blue">All Pebbles/ Big Pebbles/ Medium Pebbles/ Small Pebbles/ Aquarium Pebbles/ Mini Aquarium Pebbles/ Chips Pebbles/ Solid Pebbles/ Onex Simple Pebbles/ Onex Super Pebbles/ Granite / Marble Pebbles.</h2>

<h2 style="font-size: 20px;color: Green">Planters by Shape::</h2> <h2 style="font-size: 12px;color: blue">Hexagon Pots / Rectangular Pots / Round Pots / Square Pots / Oval Pots.</h2>
</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #services -->
  </main>

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/magnific-popup/magnific-popup.min.js"></script>
  <script src="lib/sticky/sticky.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8HeI8o-c1NppZA-92oYlXakhDPYR7XMY"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>


<% 

}

%> 


</body>
</html>