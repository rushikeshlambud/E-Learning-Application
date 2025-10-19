<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Quize Detail</title>
        <jsp:include page="head.jsp"></jsp:include>

    </head>

    <body style="background: gray;">

        <!-- <button  onclick='document.documentElement.webkitRequestFullscreen();'>Go Fullscreen Mode</button>
<button onclick='document.webkitExitFullscreen();'>Close Fullscreen</button>
 -->
        <jsp:include page="header.jsp"></jsp:include>


        <div class="container" style="margin: 2%;">
            <h2 style="text-align: center;color: white;">Enter Quiz Detail</h2><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="background: white;padding: 30px;">
                    <form action="quiz_detailDB.jsp" action="post">

                        <div class="form-group">
                            <label for="standard">Select Standard</label>
                            <select name="standard" id="standard" class="form-control">
				<option value="0">Select a Std</option>
        			<option value="First Year">First Year</option>
        			<option value="Second Year">Second Year</option>
        			<option value="Third Year">Third Year</option>
</select>
                        </div>

                        <div class="form-group">
                            <label for="subject">Select Subject</label>
                            <select name="subject" id="subject" class="form-control">
<option>Select Subject</option>
</select>
                        </div>

                        <div class="form-group">
                            <label for="batch">Select Batch</label>
                            <select name="batch" id="batch" class="form-control">
<option>Select Batch</option>
</select>
                        </div>


                        <div class="form-group">
                            <input type="text" name="exam_name" id="exam_name" placeholder="Enter Test Name" id="exam_name" class="form-control">
                        </div>

                        <div class="form-group">
                            <input type="number" name="total_question" id="total_question" placeholder="Total Questions" id="total_question" class="form-control">
                        </div>

                        <div class="form-group">
                            <!-- <input type="number" name="right_ques_mark" id="right_ques_mark" placeholder="Enter Mark on Right Answer" id="right_ques_mark" class="form-control"> -->
                            <label for="right_ques_mark">Select Mark on Right Answer</label>
                            <select name="right_ques_mark" id="right_ques_mark" class="form-control">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
                        </div>


                        <div class="form-group">
                            <label>Negative Marking</label>
                            <select class="form-control" id="negative_marking" name="negative_marking">
<option value="No">No</option>
<option value="Yes">Yes</option>
</select>
                        </div>

                        <div class="form-group">
                            <input type="number" name="wrong_ques_mark" id="wrong_ques_mark" placeholder="Enter Mark on Wrong Answer" value="0" id="wrong_ques_mark" class="form-control" style="display: none;">
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    Hours
                                    <select class="form-control" name="hours" id="hours">
<option value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    Minute
                                    <select class="form-control" name="minute" id="minute">
<option value="0">0</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
<option value="60">60</option>

</select>
                                </div>
                            </div>

                        </div>


                        <div class="form-group">
                            <label>Exam Date</label>
                            <input type="date" name="exam_date" id="exam_date" placeholder="Enter Exam date" class="form-control">
                        </div>


                        <input type="submit" id="submit" class="btn btn-info">

                    </form>
                </div>
            </div>
        </div>
        <script src="js/sweetalert.min.js"></script>
        <script type="text/javascript">
            $("#negative_marking").val();
            $("#negative_marking").change(function() {
                var status = $(this).val();
                if (status == "No") {
                    $("#wrong_ques_mark").hide();
                    document.getElementById("wrong_ques_mark").value = "0";
                } else {
                    $("#wrong_ques_mark").show();
                    document.getElementById("wrong_ques_mark").value = "";
                }
            });

            $("#submit").click(function() {
                var standard = $("#standard").val();
                var subject = $("#subject").val();
                var batch = $("#batch").val();
                var exam_name = $("#exam_name").val();
                var total_question = $("#total_question").val();
                var right_ques_mark = $("#right_ques_mark").val();
                var wrong_ques_mark = $("#wrong_ques_mark").val();
                var exam_date = $("#exam_date").val();

                var hours = $("#hours").val();
                var minute = $("#minute").val();
                // console.log(minute);

                if (standard == "Select Standard") {

                    swal("Select Standard")
                        .then(() => {});
                    return false;
                } else if (subject == "Select Subject") {
                    swal("Select Subject")
                        .then(() => {});

                    return false;
                } else if (batch == "Select Batch") {
                    swal("Select Batch")
                        .then(() => {});

                    return false;
                } else if (exam_name == "") {
                    swal("Enter Test Name")
                        .then(() => {});

                    return false;
                } else if (total_question == "") {
                    swal("Enter Total Question Number")
                        .then(() => {});

                    return false;
                } else if (right_ques_mark == "") {
                    swal("Enter Mark Answer on right Answer")
                        .then(() => {});

                    return false;
                } else if (wrong_ques_mark == "") {
                    swal("Enter Mark on Wrong Answer")
                        .then(() => {});

                    return false;
                } else if (exam_date == "") {
                    swal("Select Exam Date")
                        .then(() => {});
                    return false;
                } else if (Number(hours) == 0 && Number(minute) == 0) {
                    swal("Select Correct Time")
                        .then(() => {});
                    return false;

                } else if (total_question != "") {
                    if (Number(total_question) % 5 != 0) {
                        swal("Question Number should be multiple of 5")
                            .then(() => {});

                        return false;
                    }
                } else {
                    return true;
                }
            });


            $('#standard').change(function() {

                if ($(this).val() != 0) {
                    $.ajax({
                        url: 'fetch_subject.jsp',
                        data: 'std=' + $(this).val(),
                        type: 'post',
                        success: function(r) {

                            $('#subject').html(r);
                        }
                    });
                }
            });

            $('#subject').change(function() {

                if ($(this).val() != 0) {
                    $.ajax({
                        url: 'fetch_batch.jsp',
                        data: 'subject_id=' + $(this).val(),
                        type: 'post',
                        success: function(r) {
                            $('#batch').html(r);
                        }
                    });
                }
            });
        </script>

    </body>

    </html>