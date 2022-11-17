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

  <title>View Employee</title>

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
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
      <li class="nav-item active">
        <a class="nav-link" href="/admin/employee-datatable">
          <i class="fas fa-list"></i>
          <span>Employee List</span></a>
      </li>

      <!-- Nav Item -Add Employees -->
      <li class="nav-item">
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


            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    <security:authorize access="isAuthenticated()">
					    <security:authentication property="name" />
					</security:authorize>                
                </span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
 
                <form action="logout" method="post">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/logout">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
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
          <h1 class="h3 mb-2 text-gray-800" id="employee_update_text">View Employee</h1>
          <br>

          <form class="was-validated" action="employee" method="POST">
            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label for="validationTooltip01">First name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="${employee.firstName}" readonly="readonly" required>
                <div class="invalid-tooltip">
                  Please Enter First-Name.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="validationTooltip02">Last name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="${employee.lastName}" readonly="readonly" required>
                <div class="invalid-tooltip">
                  Please Enter Last-Name.
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
                    <span class="input-group-text" id="inlineFormCustomSelect">@</span>
                  </div>
                  <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" value="${employee.email}" id="email" name="email" aria-describedby="validationTooltipUsernamePrepend" readonly="readonly" required>
                  <div class="invalid-tooltip">
                    Please Select Valid email.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>
              </div>

              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltipGender">Gender</label>
                  <select class="custom-select" id="gender" name="gender" disabled="disabled" required>
                  	<option value="${employee.gender}" selected>${employee.gender}</option>
                    <option value ="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                    <div class="invalid-tooltip">
                      Please Select Gender.
                    </div>
                    <div class="valid-tooltip">
                      Looks good!
                    </div>
                </div>

            </div>

            <div class="form-row">
              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltip03">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${employee.address}" readonly="readonly" required>
                <div class="invalid-tooltip">
                  Please provide Valid Address.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-3 mt-4">
                <label for="validationTooltip04">NIC</label>
                <input type="text" class="form-control" id="nic" value="${employee.nic}" name="nic" readonly="readonly" required>
                <div class="invalid-tooltip">
                  Please provide Valid NIC.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-3 mt-4">
                <label for="validationTooltip05">Mobile Number</label>
                <input type="text" class="form-control" name="mobileNo" id="mobileNo" value="${employee.mobileNo}" readonly="readonly"  required>
                <div class="invalid-tooltip">
                  Please provide Mobile Number.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-6 mb-4 mt-4">
                <label for="validationTooltipDesignation">Designation / Position</label>
                  <select class="custom-select" id="designation" name="designation"  disabled="disabled" required>
                    <option value="${employee.designation}" selected>${employee.designation}</option>
                    <option value ="Manager">Manager</option>
                    <option value="Reception">Reception</option>
                    <option value="Web Manager">Web Manager</option>
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
                <input type="text" class="form-control" id="birthday" name="birthday" value="${employee.birthday}" readonly="readonly"  required>
                <div class="invalid-tooltip">
                  Please provide Birth Date.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-3 mb-4 mt-4">
                <label for="validationTooltip05">Joined Date</label>
                <input type="text" class="form-control" id="joinedDate" name="joinedDate" value="${employee.joinedDate}" readonly="readonly">
                <div class="invalid-tooltip">
                  Please provide Joined Date.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>

              <div class="col-md-6 mb-4 mt-4">
                <label for="validationTooltipDesignation">Branch</label>
                  <select class="custom-select" id="branch" name="branch"  disabled="disabled">
                    <option value="${employee.branch}" selected>${employee.branch}</option>
                    <option value ="Kandy">Kandy</option>
                    <option value="Colombo">Colombo</option>
                    <option value="Kurunagala">Kurunagala</option>
                    <option value="Matara">Matara</option>
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
                    <select class="custom-select" id=department name=department  disabled="disabled">
                      <option value="${employee.department}" selected>${employee.department}</option>
                      <option value ="Marketing">Marketing</option>
                      <option value="Accounting and Finance">Accounting and Finance</option>
                      <option value="Human Resource Management">Human Resource Management</option>
                      <option value="Research and Development">Research and Development</option>
                    </select>
                      <div class="invalid-tooltip">
                        Please Select Valid Department.
                      </div>
                      <div class="valid-tooltip">
                        Looks good!
                      </div>
                  </div>

            </div>

            <div>
              <div class="form-row">
                <div class="col-md-6 mb-3 mt-4">
                  <label for="validationTooltip03">Current Password</label>
                  <input type="text" class="form-control" id="password" name="password" value="${employee.password}" readonly="readonly">
                  <div class="invalid-tooltip">
                    Please Enter Current Password.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>

                <div class="col-md-3 mb-3 mt-4">
                  <label for="validationTooltip04">New Password</label>
                  <input type="password" class="form-control" id="normal_emp_new_password" name="normal_emp_new_password" readonly="readonly">
                  <div class="invalid-tooltip">
                    Please Enter New Passsword.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>

                <div class="col-md-3 mb-3 mt-4">
                  <label for="validationTooltip05">Confirm New Password</label>
                  <input type="password" class="form-control" id="normal_emp_confirm_new_password" name="normal_emp_confirm_new_password" readonly="readonly">
                  <div class="invalid-tooltip">
                    Please Confirm New Password.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>
                </div>
            </div>

                       
            <button class="btn btn-secondary mt-4 mb-6" type="submit" id="employee_cancel_edit" hidden="hidden">Save</button>
            <button class="btn btn-primary mt-4 mb-6" type="button" id="employee_view_btn_text" onclick="editEmployee()">Update</button>
            
          </form>
                

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">�</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
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

  <script src="../static/admin/js/employees_view.js"></script>
  
  <!-- Update Button custom scripts -->
  <script src="../static/admin/js/temp/jquery-3.5.1.min.js"></script>
  <script src="../static/admin/js/temp/toastr.min.js"></script>
  
  <script>
  	$('#employee_cancel_edit').on('click', function(){
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