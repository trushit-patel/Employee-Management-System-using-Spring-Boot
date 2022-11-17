<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Add Employee</title>

  <!-- Custom fonts for this template -->
  <link href="../static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../static/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../static/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
  <link href="../static/admin/js/temp/toastr.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="employee-dashboard">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Portal</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/employee-dashboard">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Employees
      </div>


      <!-- Nav Item -Employees List -->
      <li class="nav-item">
        <a class="nav-link" href="/admin/employee-datatable">
          <i class="fas fa-list"></i>
          <span>Employee List</span></a>
      </li>

      <!-- Nav Item -Add Employees -->
      <li class="nav-item active">
        <a class="nav-link" href="/admin/employee-addEmp">
          <i class="fas fa fa-plus"></i>
          <span>Add Employee</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

                  <!-- Heading -->
                  <div class="sidebar-heading">
                    Departments
                  </div>
            
            
                  <!-- Nav Item -Department List -->
                  <li class="nav-item">
                    <a class="nav-link" href="/admin/employee-department-table">
                      <i class="fas fa-list"></i>
                      <span>Departments List</span></a>
                  </li>
            
                  <!-- Nav Item -Add Department -->
                  <li class="nav-item">
                    <a class="nav-link" href="/admin/employee-department-add">
                      <i class="fas fa fa-plus"></i>
                      <span>Add Department</span></a>
                  </li>
            
            
                  <!-- Divider -->
                  <hr class="sidebar-divider d-none d-md-block">

                  <!-- Heading -->
                  <div class="sidebar-heading">
                    Branches
                  </div>
            
            
                  <!-- Nav Item -Branches List -->
                  <li class="nav-item">
                    <a class="nav-link" href="/admin/employee-branch-table">
                      <i class="fas fa-list"></i>
                      <span>Branches List</span></a>
                  </li>
            
                  <!-- Nav Item -Add Branch -->
                  <li class="nav-item">
                    <a class="nav-link" href="/admin/employee-branch-add">
                      <i class="fas fa fa-plus"></i>
                      <span>Add Branch</span></a>
                  </li>
            
            
                  <!-- Divider -->
                  <hr class="sidebar-divider d-none d-md-block">




      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">



          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class='fas fa-download fa-fw'></i>
              </a>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <form action="logout" method="post">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout">
                  Logout
                </a>
                </form>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Add Employee</h1>
          <br>

          <form:form action="employee" class="was-validated" >
            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label for="validationTooltip01">First name</label>
                <input type="text" class="form-control" name="firstName" placeholder="First name" required>
                <div class="invalid-tooltip">
                  Please enter first-name.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="validationTooltip02">Last name</label>
                <input type="text" class="form-control" name="lastName" placeholder="Last name" required>
                <div class="invalid-tooltip">
                  Please enter last-name.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
     
            </div>
            <div class="form-row">

              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltipUsername">Email</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                  </div>
                  <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="email" placeholder="Email" aria-describedby="validationTooltipUsernamePrepend" required>
                  <div class="invalid-tooltip">
                    Please enter valid email.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>
              </div>

              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltipGender">Gender</label>
                  <select class="custom-select" name="gender" required>
                    <option value="">Choose...</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                    <div class="invalid-tooltip">
                      Please Select Your Gender.
                    </div>
                    <div class="valid-tooltip">
                      Looks good!
                    </div>
                </div>
                
            </div>

            <div class="form-row">
              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltip03">Address</label>
                <input type="text" class="form-control" name="address" placeholder="Address" required>
                <div class="invalid-tooltip">
                  Please provide Valid Address.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-3 mt-4">
                <label for="validationTooltip04">NIC</label>
                <input type="text" class="form-control" name="nic" placeholder="NIC" required>
                <div class="invalid-tooltip">
                  Please provide Valid NIC.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-3 mt-4">
                <label for="validationTooltip05">Mobile Number</label>
                <input type="text" class="form-control" name="mobileNo" placeholder="Mobile Number" required>
                <div class="invalid-tooltip">
                  Please provide Mobile Number.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-6 mb-4 mt-4">
                <label for="validationTooltipDesignation">Designation / Position</label>
                  <select class="custom-select" name="designation" required>
                    <option value="">Choose...</option>
                    <option value ="Manager">Manager</option>
                    <option value="Reception">Reception</option>
                    <option value="Web Manager">Web Developer</option>
                  </select>
                    <div class="invalid-tooltip">
                      Please Select Valid Designation.
                    </div>
                    <div class="valid-tooltip">
                      Looks good!
                    </div>
                </div>

              <div class="col-md-3 mb-4 mt-4">
                <label for="validationTooltip05">Birth Date</label>
                <input type="date" class="form-control" name="birthday" placeholder="Birth Date" required>
                <div class="invalid-tooltip">
                  Please provide Birth Date.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-3 mb-4 mt-4">
                <label for="validationTooltip05">Joined Date</label>
                <input type="date" class="form-control" name="joinedDate" placeholder="Joined Date" required>
                <div class="invalid-tooltip">
                  Please provide Joined Date.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-6 mb-4 mt-4">
                <label for="validationTooltipDesignation">Branch</label>
                  <select class="custom-select" id="branch" name="branch" required>
                    <option value="">Choose...</option>
                    <option value ="Kandy">Ahmedabad</option>
                    <option value="Colombo">Mumbai</option>
                    <option value="Kurunagala">Delhi</option>
                    <option value="Matara">Kolkata</option>
                  </select>
                    <div class="invalid-tooltip">
                      Please Select Valid Branch.
                    </div>
                    <div class="valid-tooltip">
                      Looks good!
                    </div>
                </div>

                <div class="col-md-6 mb-4 mt-4">
                  <label for="validationTooltipDesignation">Department</label>
                    <select class="custom-select" id="normal_emp_add_department" name="department" required>
                      <option value="">Choose...</option>
                      <option value ="Marketing">Marketing</option>
                      <option value="Accounting and Finance">Accounting and Finance</option>
                      <option value="Human Resource Management">Human Resource Management</option>
                      <option value="Research and Development">Research and Development</option>
                      <option value="Research and Development">IT</option>
                    </select>
                      <div class="invalid-tooltip">
                        Please Select Valid Department.
                      </div>
                      <div class="valid-tooltip">
                        Looks good!
                      </div>
                  </div>

            </div>

         
              <div class="form-row">
                <div class="col-md-6 mb-5 mt-4">
                  <label for="validationTooltip03">Current Password</label>
                  <input type="password" class="form-control" name="password" placeholder="Current Password" required>
                  <div class="invalid-tooltip">
                    Please Enter Current Password.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>
             </div>   


            <button class="btn btn-primary mt-4 mb-4" type="submit" id="add_btn">Add Employee</button>
            <button class="btn btn-secondary mt-4 mb-4" type="submit">Cancel</button>
          </form:form>
                

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

  </div>



  <!-- Bootstrap core JavaScript-->
  <script src="../static/admin/vendor/jquery/jquery.min.js"></script>
  <script src="../static/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../static/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../static/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../static/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../static/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../static/admin/js/demo/datatables-demo.js"></script>
  
  <!-- Add Button custom scripts -->
  <script src="../static/admin/js/temp/jquery-3.5.1.min.js"></script>
  <script src="../static/admin/js/temp/toastr.min.js"></script>
  
  <script>
  	$('#add_btn').on('click', function(){
  		toastr.options = {
  			  "closeButton": true,
  			  "debug": false,
  			  "newestOnTop": false,
  			  "progressBar": true,
  			  "positionClass": "toast-top-center",
  			  "preventDuplicates": false,
  			  "onclick": null,
  			  "showDuration": "300",
  			  "hideDuration": "1000",
  			  "timeOut": "5000",
  			  "extendedTimeOut": "1000",
  			  "showEasing": "swing",
  			  "hideEasing": "linear",
  			  "showMethod": "fadeIn",
  			  "hideMethod": "fadeOut"
  			}
  			toastr["success"]("Employee Added Successful", "Successfully Added!")
  	})
  </script>
  
</body>
</html>