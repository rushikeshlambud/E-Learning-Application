<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp"></jsp:include>
<style>
.about-v
{
    height:300px;
    width: 60%;
}

.blink
{
    animation: blink1 0.7s linear infinite;
}
.blink:hover
{
    background-color: rgb(22, 22, 22);
    animation: none;
}
@media(max-width:900px)
{
.about-v
{
    height:300px;
    width: 95%;
}
.text-medium
{
    margin-top:20px;
}

}
@keyframes blink1
{
    from{background-color: rgb(39, 240, 39);}
    to{background-color: rgb(22, 22, 22)}
}
</style>
</head>
<body>
 <div class="body-inner">
<jsp:include page="header1.jsp"></jsp:include>
<jsp:include page="slider.jsp"></jsp:include>
<!-- Page Content -->
        <section id="page-content">
            <div class="container">
                <div class="row">
                    <div class="content col-lg-12 mx-auto">

                        <div class="text-center">
                            <h2 class="text-medium">Arise Academy</h2>
                            <p class="lead "><b>Physics / Chemistry Online Classes</b></p>
                            <iframe class="about-v" src="https://www.youtube.com/embed/eysq3nBW19U" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            <!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/eysq3nBW19U" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                            <!-- <iframe style="height:100%; height: 250px;"  src="https://www.youtube.com/embed/hbWqYNzxLyw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

                        </div>
                </div>
            </div>
        </section>

        <section id="page-content">
            <div class="container">
                <div class="row">
                    <div class="content col-lg-6 mx-auto">

                        <div class="text-center">
                            <h3 class="text-medium">How to Register ? </h3>
                            <iframe style="height:100%; height: 250px;"  src="https://www.youtube.com/embed/hbWqYNzxLyw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                </div>
                <div class="content col-lg-6 mx-auto">

                    <div class="text-center ">
                        <h2 class="text-medium ">Register Now</h2>
                        <p class="lead m-b-40">For More Information Connect with us</p>

                        <button type="button" class="btn btn-dark btn-lg blink"><a href="register.jsp">Register Now</a></button>
                        
                    </div>
            </div>
                
            </div>
            </div>
        </section>
        <!-- end: Page Content -->
                        <div class="line"></div>

         <div class="heading-text heading-section text-center">
            <h1></h1>
                    <h2>Our Team</h2>
                    
                </div>
                

            
                
                
                 <!-- Content -->
        <section id="page-content">
            <div class="container">
                <!-- post content -->


                    <!-- Post item YouTube-->
                   <div class="row team-members m-b-40">
                   <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/20201116_204919.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>Amrit Anurag
</h3>
                               
                                <p>B.Tech in Mechanical Engineering , Automotive Design Engineering,(IIT Roorkee)<br>Ex Faculty:- Shahu College,Latur.</p>
                             <p><b>Physics Faculty</b></p>
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/20201116_204255.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>Raviprakash Jaiswal</h3>
                                <p>M.sc Chemistry BHU(Banaras Hindu University)<br>Exp 7 years<br> Ex Faculty Shahu College,Latur</p>
							<p><b>Chemistry Faculty</b></p>
                                
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                     
                    
                    <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/20201116_204625.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>D.K Mishra </h3>
                                <p>M.sc BHU (Banaras Hindu University)<br>Exp 7 years<br> Ex-Faculty :- Aakash, FIITJEE, Resonance  </p>
                                <p><b>Chemistry Faculty</b></p>
                              
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/20201116_212458.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>R.K Mishra
</h3>
                               
                                <p>M.Sc Chemistry Lucknow University Exp-15 Yrs <br>Ex-Faculty :- CP KOTA, DSCL, Latur</p>
                             <p><b>Academic Operation Head </b></p>
                            
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                

                </div>
                    <!-- end: Post item YouTube-->

        </section>
        <!-- end: Content -->

        <!-- Text Boxes -->
        <section class="no-padding equalize" data-equalize-item=".text-box">
       <div class="row col-no-margin">


                <!--Box 1-->
                <div class="col-lg-3" style="background-color: #2F2F2F;">
                    <div class="text-box">
                        <a href="#"> <i class="fa fa-book"></i>
                            <h3>Course Material</h3>
                            <p>For Of Our Courses We Provide Students With Our Own Literature, Designed On The CBSE Curriculum Of Study.The Entire Syllabus Is Divided Into Tutorials For Each Chapter.
.</p>
                        </a>
                    </div>
                </div>
                <!--End: Box 1-->
                <!--Box 2-->
                <div class="col-lg-3" style="background-color: #383838;">
                    <div class="text-box">
                        <a href="#"> <i class="fa fa-sync"></i>
                            <h3> Student Performance And Evaluation System</h3>
                            <p>Evaluating Student Performance For Every Test And Their Individual Strengths And Weakness Ranking Them For A Healthy Competition With The Best Mentor,Is A Key Feature Of Our Program</p>
                        </a>
                    </div>
                </div>
                <!--End: Box 2-->
                <!--Box 3-->
                <div class="col-lg-3" style="background-color: #313131;">
                    <div class="text-box">
                        <a href="#"> <i class="fa fa-user-friends"></i>
                            <h3>Our Strength</h3>
                            <p>Arise Has The Best In Their Field. We  provide best quality and best faculty.There Knowledge And Expertise To Deliver Successful And Practical Resolution To Your Studies. We are commited for student well wish.</p>
                        </a>
                    </div>
                </div>
                <!--End: Box 3-->
                <!--Box 4-->
                <div class="col-lg-3" style="background-color: #383838;">
                    <div class="text-box">
                        <a href="#"> <i class="fa fa-edit"></i>
                            <h3>Instant Test Analysis</h3>
                            <p>It Is Commonly Said,That A Student Is Often Unable To Perform Well In A Test But They Are Well When They Re-attempt The Same Problem In A Comfortable Environment At Arise, We Do Our Best To Help Students To Do Their Best Work And Conquer Their Test Phobia.</p>
                        </a>
                    </div>
                </div>
                <!--End: Box 4-->
            </div>
        </section>
        <!-- end: Text Boxes --

 <!--end: Inspiro Slider -->
     
<!--          <div class="heading-text heading-section text-center"> -->
<!--                     <h2>An Innovative & Integrated Approach</h2> -->
                    
<!--                 </div> -->

                


        <!-- ABOUT AGENT -->
        <section id="section3">
            <div class="container">
<!--                 <div class="row"> -->
<!--                     <div class="col-lg-5"> -->
<!--                         <img alt="real-estate" src="homepages/real-estate/Images/agent.jpg" class="img-fluid m-b-10"> -->
<!--                     </div> -->
<!--                     <div class="col-lg-7"> -->
<!--                         <h2 class="text-medium">Ajay Pratap Singh</h2> -->
<!--                         <h4 class="text-small">(Chief Mentor & Academic Director)</h4> -->
<!--                         <p>At the very outset, I would like to extend my sincere thanks and regards to the residents of Maharashtra for -->
<!-- trusng and making Arise Academy as the most preferred coaching instuon of engineering and medical -->
<!-- entrance exams. -->
<!-- With the present scenario of globalizaon, the needs of engineering & technology require mandatorily -->
<!-- to be professional from the internaonally recognized instuon. AIIMS are the best examples for it. -->
<!-- Naturally admissions to these instuons becomes highly compeve and accordingly for its preparaon. -->
<!-- We, at Arise Academy, commied to each of its students to achieve success by providing knowledge and skill -->
<!-- through pioneering efforts and usage of appropriate methodology.</p> -->
<!--                         <div class="clear"></div> -->
<!--                         <a class="read-more" href="#">See More ...</a> -->

<!--                     </div> -->
<!--                 </div> -->

            </div>
        </section>
        <!-- end: ABOUT AGENT -->


         <section>
            <div class="container">
                <div class="heading-text heading-section text-center">
                    <h2>Our Director Body</h2>
                    
                </div>

                <div class="row team-members">
                    
                    <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/20201116_210407.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>Mr. Ajit Shivajirao Patil Kavekar</h3>
                                <p>Managing Director</p>
                                <p>Arise Academy</p>
                                <p></p>
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                  
                 <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/10.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>Ranjeetsinh Shivajirao Patil Kavekar
</h3>
                               
                                <p>Chairman</p>
                                <p>Arise Academy</p>
<!--                                 <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    
                    
                    <div class="col-lg-3 mx-auto">
                        <div class="team-member">
                            <div class="team-image">
                                <img src="Images/team/11.jpg" alt="Arise Academy" >
                            </div>
                            <div class="team-desc">
                                <h3>Sambhajirao Kishanrao Patil Rawangavkar</h3>
                                <p>Director</p>
                                <p>Arise Academy</p>
                                <p></p>
                                
                            </div>
<!--                               <div class="align-center"> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#"> -->
<!--                                         <i class="fab fa-facebook-f"></i> -->
<!--                                         <span>Facebook</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100"> -->
<!--                                         <i class="fab fa-twitter"></i> -->
<!--                                         <span>Twitter</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118"> -->
<!--                                         <i class="fab fa-instagram"></i> -->
<!--                                         <span>Instagram</span> -->
<!--                                     </a> -->
<!--                                     <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80"> -->
<!--                                         <i class="far fa-envelope"></i> -->
<!--                                         <span>Mail</span> -->
<!--                                     </a> -->
<!--                                 </div> -->
                        </div>
                    </div>

                </div>



            </div>
            

        </section>
 <div class="line"></div>

        <section>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="heading-text heading-section">
                    <h2>About Arise Academy</h2>
                    
                </div>
            </div>
            <div class="col-lg-9">
                <div class="row">
                <div class="col-lg-6">Faculty Is One Of The Strongest Pillars For A Educational Institute.At Arise We Have A Team Of Dedicated And Experienced Faculties.Our Faculties Play A Vital Role In Designing The Curriculum And Study Material With Constant Research.Change In Pattern Of Medical Entrance Examination Will Not Affect The Success Of Our Students As We Are Geared Up To Take The Challenges Ahead.
<br> <br> The Essence Of A Institution Is Build On A Competent And Effective Administrative Team.To Co-Ordination And Utilization Of The Resources For The Fulfillment Of Our Objectives Of Quality Education,We Have A Well Experienced Team Of Administrators.Their Role Is To Create And Ensure The Smooth Working Of The System They Are There To Support Other Departments And To Enable Them To Provide Good Learing Environment For Our Students.They Ensure The Budding Of Qualities Like Discipline,Punctuality And Commitment Which Are The Stepping Stones Towards Success.</div>

<div class="col-lg-6">Arise Arranges Separate Air-cooled Hostels For Girls & Boys With Boarding And Lodging Facilities,Which Ensures Privacy And Homely Atmosphere,.Hostel Facilities Are Provided With The Comforts At An Affordable Cost And To Make A Comfortable Stay.The Students Of All Disciplines Live Together In The Hostel Which Help In Developing Healthy And Cordial Relation Among Them. <br> <br>The Massive Infrastructure Of Arise Has Special Emphasis On Providing And Atmosphere Conducive For Learning.All The Classrooms Are Equipped With Ac And Educational Audio-Visual Equipments</div>

</div></div>

        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>