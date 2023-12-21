<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="drugfilter.model.User"%>
<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>IMPASL Drug | SEARCH DRUG</title>
    <!--    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" media='all'/>-->
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/google.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" media='all'/>
    <link href="html/src/print.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/dropzone.min.css"/>
    <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>-->
    <!--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <!--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css"/>
    
   
   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
    <style>
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }

        .mincontent {
            max-width: max-content !important;
        }

        .form-controls {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            margin-top: 5px;
        }

        .form-controlt {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            margin-top: 5px;
        }

       /*  h6{
        cursor: pointer;
        }
         */
       .purpleData{
        cursor: pointer;
        }
         
        #bannerimage {
			  width: 100%;
		/* 	
			  background-image: url( https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGZueqaMDZ85faKyUr55Z7pgQW7MXQuIhyvQ&usqp=CAU);
		 */	  height: 460px;
			  background-color: white;
			  background-position: center;
			
			
}

    </style>

</head>

<%

User user = (User)session.getAttribute("name");
String loginName = " ";

if(user == null){
	
	out.println("Please Login");
	loginName = "Nouser";
	response.sendRedirect("index.jsp");
	
}


%>



<script>


	</script>


<body class="text-left">
<div class="app-admin-wrap layout-sidebar-large">
    <!--    <div class="main-header">-->
    <!--        <div class="logo">-->
    <!--            <img src="dist-assets/images/logo.png" alt="">-->
    <!--        </div>-->
    <!--        <div class="menu-toggle">-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--        </div>-->

    <!--        <div>-->
    <!--            <h2>Search</h2>-->
    <!--            &lt;!&ndash;                <i class="search-icon text-muted i-Magnifi-Glass1"></i>&ndash;&gt;-->
    <!--        </div>-->
    <!--        &lt;!&ndash;        </div>&ndash;&gt;-->
    <!--        <div style="margin: auto"></div>-->
    <!--        <div class="header-part-right">-->
    <!--            &lt;!&ndash; Full screen toggle &ndash;&gt;-->
    <!--            <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>-->
    <!--            &lt;!&ndash; Grid menu Dropdown &ndash;&gt;-->


    <!--        </div>-->
    <!--    </div>-->

    <!-- =============== Left side End ================-->
    
    
<!--     
    <nav class="navbar navbar-expand-lg navbar-light ">

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>   <center><h2>Drug Index</h2></center>
  
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
    </ul>

        <a  class="text-muted" href="controller/LoginController.jsp?action=logout"><button type="button" class="btn btn-outline my-2 my-sm-0"  style=" border: 2px solid black;">Logout</button></a>
  </div>
</nav>
     -->
    
    
    <div class="mt-3 sidenav-open d-flex flex-column">
    <div>
    <center><h1>Drug Index</h1></center>
    
    <div class="mt-3 text-right" style="margin-top: -45px !important; padding:20px"><a  class="text-muted" href="controller/LoginController.jsp?action=logout">
                        <u>Log Out</u></a></div>
    </div>
    </div>
        <!-- ============ Body content start ============= -->
        <div class="main-content">

            <div class="row">


                <div class="col-md-4 col-sm-4 input-group center-block form-group ml-auto mr-auto">
                    <input class="form-control ml-5 mr-5 center-block" id="drugTxt" type="text" 
                           placeholder="Drug name (Chemical/Brand name)"/>

                </div>

            </div>
      
            
             
            
            
            <div id="inputs" style="display:none" class=" ml-5 mr-5">

                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="anatoTxt"
                       type="text"
                       placeholder="Enter Anatomical Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="clinicalTxt"
                       type="text"
                       placeholder="Enter Clinical Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="therapeutcTxt"
                       type="text"
                       placeholder="Enter Therapeutic Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="phrmoTxt"
                       type="text"
                       placeholder="Enter Pharmo Class"/>

            </div>
            <div class="row">


                <div class=" col-md-12 text-center">
                    <div class="text-center">
                        <button class="btn btn-primary ripple m-1" type="button">Search</button>

                        <br>
                        <a class="btn text-primary" id="adbtn" onclick="advanceView()">Advance Search >></a>

                    </div>
                </div>

                <!--                <div class="pl-5 pr-5 w-auto">-->
                <div class="bg-primary ml-auto mr-auto " style="overflow:auto;width: 550px;height: 230px; display:none" id="resultSet">
                    <h5 class="text-white text-center m-2" id="gName">No Records Found</h5>


                    <div class="ml-4" id="atc">
                    </div>

                </div>

                <!--                </div>-->
                <div  id="bannerimage" style="display:block">
                 <center>
              
                   <div  class="card p-1" style=" border: 1px solid ; width: 95%;">
                   
                      <center>
                        <div class="card m-4 border-secondary border-1"
                             style=" background: rgb(255,255,255,0.8)">
                            <div class="card-body" >
                                <h5 class="card-title">The drug index is the</h5>
                                <p class="card-text"  align="justify">sole publication available in Sri Lanka where all the registered drugs in Sri Lanka are listed. The last Sri Lanka Drug Index was published in 2010.  It was not updated so far due to many reasons. While National Medicine Regulatory Authority of Ministry of Health maintains a database of all the registered drugs in the public domain it does not allow any detailed valuable search functionality for the users.  IMPA has identified this problem and has designed and developed a IMPA Drug Index which has clinically useful search functions. A list of these functions which is present in the Drug Index of IMPA (DIMPA) is shown below :</p>
                            </div>
                        </div>
                      </center>
                      
                      <center>
                        <div class="card m-1 border-secondary border-1"
                             style="width: 55%; height: 29%;background: rgb(251,229,214) ;display: inline-block">
                            <div class="card-body">
                                <h5 class="card-title">OVERALL FUNCTIONALITY :</h5>
                                <ol  align="justify">
                                <li>
                                    You can get a list of all the generics in SRI LANKA at a given moment
                                 </li>
                                  <li>
                                   You can get a list of all the brands available in SRI LANKA at a given moment
                                 </li>
                                  <li>
                                  For each GENERIC you can get the available BRANDS
                                 </li>
                                  <li>
                                   For each BRAND you can get the GENERIC
                                 </li>
                                  <li>
                                 For each GENERIC you can get the CHEMICAL, PHARMO CLASS, THERAPEUTIC CLASS, 
                                 CLINICAL CLASS, ANATOMICAL CLASS
                                 </li>
                                  <li>
                                 For each ATC class you can get the respective GENERICS and THE BRANDS
                                 </li>
                                 <li>
                                   For each BRAND you can get the alternatives indicated by using the PHARMO, 
                                    THERAPEUTIC or CLINICAL CLASSES
                                 </li>
                                  <li>
                                    Alerts sent for the registered users about the expiry of registration
                                 </li>
                                  <li>
                                    Alerts sent for the registered users about the withdrawals from the market
                                 </li>
                                  <li>
                                    Auto updating of the index is integrated
                                 </li>
                                 </ol>
                            </div>
                        </div>
                      
                        <div class="card m-1 border-secondary border-1"
                             style=" height: 20rem; background: rgb(226,240,217); display: inline-block">
                            <div class="card-body">
                                <h5 class="card-title">CLINICAL UTILITY EXAMPLES :</h5>
                                <p class="card-text" align="justify">
                                What are the available ANTIFUNGALS FOR TOPICAL USE,<br>
                                What are the available VIRAL VACCINES,<br>
                                What are the available ANTIFUNGALS FOR TOPICAL USE,<br>
                               What are the available DRUGS FOR CONSTIPATION,<br>
                                What are the available VACCINES,<br>
                                What are the available TOPICAL PRODUCTS FOR JOINT AND MUSCULAR PAIN,<br>
                                What are the available DRUGS FOR CONSTIPATION,<br>
                                    </p>
                            </div>
                            <br> <br> <br> <br> 
                        </div>
                     </center>
                     
                    <center>
                        <div class="card m-4 border-secondary border-1"
                             style=" background: rgb(255,255,255,0.8)">
                            <div class="card-body" >
                             <p class="card-text" align="justify">
                             Also as the current SLDI2010 is hopelessly out of date IMPA took the initiative to design and develop 
                             and electronic version the Sri Lanka Drug Index which is auto-updatable so that it will never go out of date. 
                             This version will hereinafter referred to as DIMPA or Drug Index of IMPA. 
                             <br>
                             The expected user population of this comprises : doctors, paramedica, pharmacists, pharmacy assistants, 
                             nurses and most important of all the patients. We plan to conduct several webinars to create awareness 
                             of this index in time to come.
                             </p>
                            </div>
                        </div>
                       </center>
                   
                </div>
                
              </center>
           </div>
           

                <div class="col-md-12 mb-4" style="display:none" id="resultTable">
                    <div class="card text-left">
                        <div class="card-body">
                            <h4 class="card-title mb-3">DRUG INFORMATION BY GENERIC</h4>
                            <span class=" mb-3">TOTAL NO OF RECORDS RETRIEVED : <span id="count">0</span></span>

                            <div class="table-responsive">
                                <table class="display table table-striped table-bordered" id="deafult_ordering_table_aa"
                                       style="width:100%">

                                    <thead>
                                    <tr>
                                        <th>BRAND</th>
                                        <th>FORMULATION</th>
                                        <th>STRENGTH</th>
                                        <th>IMPORTER</th>
                                        <th>MANUFACTURER</th>
                                    </tr>
                                    </thead>
                                    <tbody id="drugTbl">

                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div><!-- end of main-content -->


            <div class="flex-grow-1"></div>

        </div>

    </div>
</div>


<!-- ============ Search UI End ============= -->
<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="dist-assets/js/scripts/customizer.script.min.js"></script>

<script>
    var myTable;
    $(document).ready(function () {

        testme();

    });
    var jsonData = [{
        "log_time": "2015-12-27 09:42:21",
        "user_name": "Me",
        "class_name": "login",
        "class_function": "authentication",
        "action_title": "User login",
        "action_description": "I am logged in"
    }, {
        "log_time": "2015-12-27 09:42:21",
        "user_name": "me",
        "class_name": "dashboard",
        "class_function": "index",
        "action_title": "Admin dashboard",
        "action_description": "I am logged in"
    }];

    var isDone = false;

    function advanceView() {


        if (!isDone) {
            isDone = true;
            $('#inputs').show()

            $('#adbtn').text("Hide Advance Search >>")
        } else {
            isDone = false;
            $('#inputs').hide()
            $('#adbtn').text("Advance Search >>")
        }


    }

    function testme() {


        myTable = $('#deafult_ordering_table_aa').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "responsive": true,
            "bDestroy": true,
            "columnDefs": [{
                "targets": [1],
                "visible": true
            }],
            "data": [],
            "columns": [{
                "title": "BRAND",
                "data": "BRAND"
            }, {
                "title": "FORMULATION",
                "data": "FORMULATION"
            }, {
                "title": "STRENGTH",
                "data": "STRENGTH"
            }, {
                "title": "IMPORTER",
                "data": "IMPORTER"
            }, {
                "title": "MANUFACTURER",
                "data": "MANUFACTURER"
            }]
        });


    }


    $('#drugTxt').on("keyup", function () {
        // dataTable.clear()

        var drug = $('#drugTxt').val();
        if (drug.length >= 4 || drug.length == 0) {

            loadGenericDrug(drug)
        }


        // testme();

        //     .draw();

        // $.ajax('controller/Controller.jsp?action=drug&name=' + $('#drugTxt').val(),
        //     {
        //         type: "GET",
        //         async: true,
        //         success: function (data) {
        //
        //             $('#gName').text('GENERIC NAME : ' + data.genericName)
        //
        //             $('#drugTbl').empty();
        //             $('#atc').empty();
        //
        //
        //
        //             $.each(data.atc, function (i, x) {
        //                 console.log(x);
        //                 i++;
        //                 $('#atc').append('<h6 class="text-white m-0">' + i + '. PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
        //                     '<br>')
        //
        //             });
        //
        //             $.each(data.isd, function (i, x) {
        //                 i++
        //                 $('#drugTbl').append(' <tr>' +
        //                     '<td>' + i + '</td>\n' +
        //                     '<td>' + x.BRAND + '</td>\n' +
        //                     '<td>' + x.FORMULATION + '</td>\n' +
        //                     '<td>' + x.STRENGTH + '</td>\n' +
        //                     '<td>' + x.IMPORTER + '</td>\n' +
        //                     '<td>' + x.MANUFACTURER + '</td>\n' +
        //                     '</tr>');
        //             });
        //
        //
        //             // complex header
        //             dataTable = $("#deafult_ordering_table_aa").DataTable({
        //                 responsive: true,
        //                 "bDestroy": true,
        //                 "columnDefs": [{
        //                     "targets": [3],
        //                     "visible": true
        //                 }]
        //             });
        //
        //
        //
        //
        //
        //         },
        //         error: function () {
        //         }
        //     });
    })

    $('#anatoTxt').on("keyup", function () {
        // dataTable.clear()

        var anaClass = $('#anatoTxt').val();

        if(anaClass == 'all') {
            loadAllByType('anatClass')
        }else{
            loadAnaClass(anaClass);
        }

    })

    $('#clinicalTxt').on("keyup", function () {
        // dataTable.clear()
     var clinClass =  $('#clinicalTxt').val();
        if (clinClass == 'all') {
            loadAllByType('clinicClass')
        }else{
            loadClinClass(clinClass);
        }
    })

    $('#therapeutcTxt').on("keyup", function () {
        // dataTable.clear()

        var theClass = $('#therapeutcTxt').val();
      //  console.log(theClass)
        if (theClass == 'all') {

            loadAllByType('therapClass');

        } else {
            loadTheData(theClass);
        }


    })

    $('#phrmoTxt').on("keyup", function () {
        // dataTable.clear()
        var phrClass = $('#phrmoTxt').val();

        if(phrClass == 'all'){

            loadAllByType('pharmoClass')

        }else {
            loadPhrClass(phrClass);

        }

    })


    function loadGenericDrug(drug){
        $.ajax({
            url: 'controller/Controller.jsp?action=drug&name=' + drug,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
               
                myTable.clear();
                console.log(logs.isd.length)
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                   console.log(value)
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                if (logs.genericName == '') {
                    $('#gName').text('No Records Found');
                } else {
                    $('#gName').text('GENERIC NAME : ' + logs.genericName);

                }

                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'"><span style=" width:160px;float:left"> PHARMO CLASS </span>:<b><span class="purpleData" data-name= "'+x.PHARMO_CLASS+' "onclick= "loadPhrClass(this.dataset.name)" style="color:#E6E6FA;">  ' + capitalize_Words(x.PHARMO_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" ><span style=" width:160px; float:left">THERAPEUTIC CLASS </span>:<b>  <span  class="purpleData" data-name= "'+x.THERAPEUTIC_CLASS+' "onclick=" loadTheData(this.dataset.name)" style="color:#E6E6FA;">'  +  capitalize_Words(x.THERAPEUTIC_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" ><span style=" width:160px; float:left">CLINICAL CLASS </span> : <b><span  class="purpleData" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)" style="color:#E6E6FA;">' +capitalize_Words(x.CLINICAL_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'"><span style="width:160px; float:left">ANATOMICAL CLASS  </span>:<b><span  class="purpleData" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)" style="color:#E6E6FA;"> ' + capitalize_Words(x.ANATOMICAL_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0"><span style="width:160px; float:left">CUTIONARY LABLE  </span>: <b><span  class="purpleData" style="color:#fff200;"> ' + capitalize_Words(x.CUTIONARY_LABLE) + '</h6>\n' +
                        '<br>')



                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function loadAnaClass(anaClass){
        $.ajax({
            url: 'controller/Controller.jsp?action=ana&name=' + anaClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
          
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);



                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                    		
                        '<h6 class="text-white m-0">' + i + '.<span style=" width:200px ;"> GENERIC </span>:<b> <span  class="purpleData" data-name="'+x.GENERIC+'"onclick="loadGenericDrug(this.dataset.name)" style="color:#E6E6FA; ">' + capitalize_Words(x.GENERIC) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" ><span style=" width:160px;float:left"> PHARMO CLASS</span>:<b> <span class="purpleData" data-name= "'+x.PHARMO_CLASS+' "onclick="loadPhrClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.PHARMO_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'"><span style=" width:160px; float:left">THERAPEUTIC CLASS </span>:<b> <span  class="purpleData" data-name= "'+x.THERAPEUTIC_CLASS+' "onclick="loadTheData(this.dataset.name)" style="color:#E6E6FA;">' +  capitalize_Words(x.THERAPEUTIC_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" ><span style=" width:160px; float:left">CLINICAL CLASS  </span>:<b> <span  class="purpleData" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.CLINICAL_CLASS)+ '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" ><span style="width:160px; float:left">ANATOMICAL CLASS  </span>: <b><span  class="purpleData" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.ANATOMICAL_CLASS) + '</span></b></h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" ><span style="width:160px; float:left">CUTIONARY LABLE  </span>: <b><span  class="purpleData" style="color:#fff200;">' + capitalize_Words(x.CUTIONARY_LABLE) + '</span></b></h6>\n' +
                        '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });


    }

    function loadClinClass(cliClass){
        $.ajax({
            url: 'controller/Controller.jsp?action=cli&name=' + cliClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
            
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);


                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                    	     '<h6 class="text-white m-0">' + i + '.<span style=" width:200px ;"> GENERIC </span>:<b> <span  class="purpleData" data-name="'+x.GENERIC+'" onclick="loadGenericDrug(this.dataset.name)" style="color:#E6E6FA; ">' + capitalize_Words(x.GENERIC) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" ><span style=" width:160px;float:left"> PHARMO CLASS</span>:<b> <span class="purpleData" data-name= "'+x.PHARMO_CLASS+' " onclick="loadPhrClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.PHARMO_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'"><span style=" width:160px; float:left">THERAPEUTIC CLASS </span>:<b> <span  class="purpleData" data-name= "'+x.THERAPEUTIC_CLASS+' " onclick="loadTheData(this.dataset.name)" style="color:#E6E6FA;">' +  capitalize_Words(x.THERAPEUTIC_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" ><span style=" width:160px; float:left">CLINICAL CLASS  </span>:<b> <span  class="purpleData" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.CLINICAL_CLASS)+ '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" ><span style="width:160px; float:left">ANATOMICAL CLASS  </span>: <b><span  class="purpleData" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.ANATOMICAL_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" ><span style="width:160px; float:left">CUTIONARY LABLE  </span>: <b><span  class="purpleData" style="color:#fff200;">' + capitalize_Words(x.CUTIONARY_LABLE) + '</span></b></h6>\n' +
                             '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function loadPhrClass(phrClass) {
        $.ajax({
            url: 'controller/Controller.jsp?action=phr&name=' + phrClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
          
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);


                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                    		   '<h6 class="text-white m-0">' + i + '.<span style=" width:200px ;"> GENERIC </span>:<b> <span  class="purpleData" data-name="'+x.GENERIC+'" onclick=" loadGenericDrug(this.dataset.name)" style="color:#E6E6FA; ">' + capitalize_Words(x.GENERIC) + '</span></b></h6>\n' +
                               '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" ><span style=" width:160px;float:left"> PHARMO CLASS</span>:<b> <span class="purpleData" data-name= "'+x.PHARMO_CLASS+' " onclick="loadPhrClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.PHARMO_CLASS) + '</span></b></h6>\n' +
                               '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'"><span style=" width:160px; float:left">THERAPEUTIC CLASS </span>:<b> <span  class="purpleData" data-name= "'+x.THERAPEUTIC_CLASS+' " onclick= "loadTheData(this.dataset.name)" style="color:#E6E6FA;">' +  capitalize_Words(x.THERAPEUTIC_CLASS) + '</span></b></h6>\n' +
                               '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" ><span style=" width:160px; float:left">CLINICAL CLASS  </span>:<b> <span  class="purpleData" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.CLINICAL_CLASS)+ '</span></b></h6>\n' +
                               '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" ><span style="width:160px; float:left">ANATOMICAL CLASS  </span>: <b><span  class="purpleData" data-name="'+x.ANATOMICAL_CLASS+'" onclick= "loadAnaClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.ANATOMICAL_CLASS) + '</span></b></h6>\n' +
                               '<h6 class="text-white ml-3 mt-0 mb-0" ><span style="width:160px; float:left">CUTIONARY LABLE  </span>: <b><span  class="purpleData" style="color:#fff200;">' + capitalize_Words(x.CUTIONARY_LABLE) + '</span></b></h6>\n' +
                               '<br>')

                });
                ;
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });


    }

    function loadTheData(theClass) {
        $.ajax({
            url: 'controller/Controller.jsp?action=the&name=' + theClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
             
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                // if (logs.genericName == '') {
                //     $('#gName').text('No Records Found');
                // } else {
                    $('#gName').text('Total Records : ' + logs.atc.length);

                // }

                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                    		 '<h6 class="text-white m-0">' + i + '.<span style=" width:200px ;"> GENERIC </span>:<b> <span  class="purpleData" data-name="'+x.GENERIC+'" onclick=" loadGenericDrug(this.dataset.name)" style="color:#E6E6FA; ">' + capitalize_Words(x.GENERIC) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" ><span style=" width:160px;float:left"> PHARMO CLASS</span>:<b> <span class="purpleData" data-name= "'+x.PHARMO_CLASS+' " onclick= "loadPhrClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.PHARMO_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'"><span style=" width:160px; float:left">THERAPEUTIC CLASS </span>:<b> <span  class="purpleData" data-name= "'+x.THERAPEUTIC_CLASS+' " onclick= "loadTheData(this.dataset.name)" style="color:#E6E6FA;">' +  capitalize_Words(x.THERAPEUTIC_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" ><span style=" width:160px; float:left">CLINICAL CLASS  </span>:<b> <span  class="purpleData" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.CLINICAL_CLASS)+ '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" ><span style="width:160px; float:left">ANATOMICAL CLASS  </span>: <b><span  class="purpleData" data-name="'+x.ANATOMICAL_CLASS+'" onclick= "loadAnaClass(this.dataset.name)" style="color:#E6E6FA;">' + capitalize_Words(x.ANATOMICAL_CLASS) + '</span></b></h6>\n' +
                             '<h6 class="text-white ml-3 mt-0 mb-0" ><span style="width:160px; float:left">CUTIONARY LABLE  </span>: <b><span  class="purpleData" style="color:#fff200;">' + capitalize_Words(x.CUTIONARY_LABLE) + '</span></b></h6>\n' +
                             '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }



   function loadAllByType(colName){

        $.ajax({
            url: 'controller/Controller.jsp?action=the&name=all&col='+colName,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
               // console.log(logs.dataAll)


                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');

                $('#atc').empty();

                // $('#count').text(logs.isd.length);
                // if (logs.genericName == '') {
                //     $('#gName').text('No Records Found');
                // } else {
                    $('#gName').text('Total Records : ' + logs.dataAll.length);
                //
                // }

                if(colName=='pharmoClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadPhrClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='therapClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadTheData(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='clinicClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadClinClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='anatClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadAnaClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }

            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function hello(s) {
        //console.log(s)
    }
    
    function showResult(){
    	
    	//console.log("show");
    	
    	var inputBox = document.getElementById('drugTxt');
    	
    	inputBox.onkeyup = function(){
    	/*     document.getElementById('printchatbox').innerHTML = inputBox.value; */
    	    var x = document.getElementById("resultSet");
      	  if (x.style.display === "none") {
      	    x.style.display = "block";
      	  } else {
      	    x.style.display = "none";
      	  }
      	  
      	var y = document.getElementById("resultTable");
  	  if (y.style.display === "none") {
    	    y.style.display = "block";
    	  } else {
    	    y.style.display = "none";
    	  }
    	}
    
    	 /* var x = document.getElementById("resultSet");
    	  if (x.style.display === "none") {
    	    x.style.display = "block";
    	  } else {
    	    x.style.display = "none";
    	  }
    	  
    	  var y = document.getElementById("resultTable");
    	  if (y.style.display === "none") {
      	    y.style.display = "block";
      	  } else {
      	    y.style.display = "none";
      	  } */
    }
    
    var inputBox = document.getElementById('drugTxt');
	
	inputBox.onkeyup = function(){
	/*     document.getElementById('printchatbox').innerHTML = inputBox.value; */
	    var x = document.getElementById("resultSet");
	 	var y = document.getElementById("resultTable");
		var banner = document.getElementById("bannerimage");
		var drug = inputBox.value;
		
		if (drug.length < 4) {
			 banner.style.display = "block";
			 x.style.display = "none";
			 y.style.display = "noe";
	     } 
		
		 if (drug.length >= 4) {
			 banner.style.display = "none";
			 x.style.display = "block";
			 y.style.display = "block";
	     } 

	/* 	
		 if (banner.style.display === "block") {
			 banner.style.display = "none";
		  	  } else {
		  		banner.style.display = "block";
		  	  }
		  	  
	 
  	  if (x.style.display === "none") {
  	    x.style.display = "block";
  	  } else {
  	    x.style.display = "none";
  	  }
  	  
  	var y = document.getElementById("resultTable");
	  if (y.style.display === "none") {
	    y.style.display = "block";
	  } else {
	    y.style.display = "none";
	  } */
	}
	
	function capitalize_Words(str)
	{
	 return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
	}
	
</script>
</body>

</html>
