<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
          <div class="menu_section">
            <br>
            <h3>General</h3>
            <ul class="nav side-menu">
              <li class=""><a><i class="fa fa-home"></i> Assignment <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu" style="display: none;">
                  <li class="pdffiles"><a href="uploadnotes.jsp">Add Assignment</a></li>
                  <li class=""><a href="noteslist.jsp">Assignment List</a></li>
                 </ul>
              </li>
              <li><a><i class="fa fa-edit"></i> Video <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li class="videoData"><a href="uploadvideo.jsp">Add Video</a></li>
                  <li class="VideoList"><a href="video1.jsp">Video List</a></li>
                </ul>
              </li>
              
              
               <li><a><i class="fa fa-edit"></i>Demo Videos <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li class="videoData"><a href="adddemovideo.jsp">Add Video</a></li>
                  <li class="VideoList"><a href="demovideolist.jsp">Video List</a></li>
                </ul>
              </li>
              
              
             <li><a><i class="fa fa-clone"></i>Notification <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li class="notification"><a href="notifications.jsp">Add Notification</a></li>
                  <li class="NotificationList"><a href="notificationlist.jsp">Notification List</a></li>
                  </ul>
                  </li>
                 <li><a><i class="fa fa-edit"></i> Subject & Batch <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li class="videoData"><a href="add_subject_name.jsp">Add Subject</a></li>
                  <li class="VideoList"><a href="add_batch_name.jsp">Add Batch</a></li>
                </ul>
              </li>  
             <li><a><i class="fa fa-clone"></i>Student <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li class="StudentList"><a href="studentlist.jsp">Student List</a></li>
                  </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Quiz <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="../exam_pannel/admin/quize_detail.jsp">Add Quiz</a></li>
                       <li><a href="../exam_pannel/admin/quize_detail_view.jsp">Quiz Detail</a></li>
                        <li><a href="../exam_pannel/admin/student_result.jsp">Student Result</a></li>
                    </ul>
                    </li>
    
                </ul>
          </div>
         </div>