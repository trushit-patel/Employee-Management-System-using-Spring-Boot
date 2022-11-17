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

  <title>Admin Portal</title>

  <!-- Custom fonts for this template -->
  <link href="../static/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../static/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../static/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                  <li class="nav-item active">
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

          <!-- Sidebar Toggle (Topbar) -->
          <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
          </form>

          <!-- Topbar Search -->


          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">

              </div>
            </li>

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
          <h1 class="h3 mb-2 text-gray-800">Add Branch</h1>
          <br>

          <form class="was-validated" action="branch" method="POST">
            <div class="form-row">
              <div class="col-md-6 mb-3">
                <label for="validationTooltip01">Branch Name</label>
                <input type="text" class="form-control" id="employee_branch_add_name" name="branchName" placeholder="Branch Name" required>
                <div class="invalid-tooltip">
                  Please Enter Branch Name.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="validationTooltip02">Branch Phone No</label>
                <input type="text" class="form-control" id="employee_branch_add_phoneNo" name="bphoneNo" placeholder="Branch Phone No" required>
                <div class="invalid-tooltip">
                  Please Enter Branch Phone No.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
     
            </div>
            <div class="form-row">

              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltipUsername">Branch Email</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                  </div>
                  <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" id="employee_branch_add_email" name="branchEmail"  placeholder="Branch Email" aria-describedby="validationTooltipUsernamePrepend" required>
                  <div class="invalid-tooltip">
                    Please Enter Branch Email.
                  </div>
                  <div class="valid-tooltip">
                    Looks good!
                  </div>
                </div>
              </div>

              <div class="col-md-6 mb-3 mt-4">
                <label for="validationTooltipBranch">Branch Location</label>
                  <select class="custom-select" id="employee_branch_add_location" name="branchLocation" required>
                    <option value="">Choose...</option>
                    <option value ="Kandy">Ahmedabad</option>
                    <option value="Colombo">Mumbai</option>
                    <option value="Kurunagala">Delhi</option>
                    <option value="Matara">Kolkata</option>
                  </select>
                  </select>
                    <div class="invalid-tooltip">
                      Please Select Branch.
                    </div>
                    <div class="valid-tooltip">
                      Looks good!
                    </div>
                </div>
            </div>

            <div class="form-row">
              <div class="col-md-6 mb-5 mt-4">
                <label for="validationTooltip03">Branch Address</label>
                <input type="text" class="form-control" id="employee_branch_add_address" name="branchAddress" placeholder="Branch Address" required>
                <div class="invalid-tooltip">
                  Please provide a valid Address.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-5 mt-4">
                <label for="validationTooltip04">POST Code</label>
                <input type="text" class="form-control" id="employee_branch_add_postCode" name="branchPCode" placeholder="Post Code" required>
                <div class="invalid-tooltip">
                  Please provide a valid Post Code.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>
              </div>
              <div class="col-md-3 mb-5 mt-4">
                <label for="validationTooltip05">Fax No</label>
                <input type="text" class="form-control" id="employee_branch_faxNo" name="baranchFaxNo" placeholder="Fax No"  required>
                <div class="invalid-tooltip">
                  Please provide a valid Fax No.
                </div>
                <div class="valid-tooltip">
                  Looks good!
                </div>

              </div>
            </div>
            <button class="btn btn-primary mt-4 mb-4" type="submit">Add Branch</button>
            <button class="btn btn-secondary mt-4 mb-4" type="submit">Cancel</button>
          </form>
                

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>



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

</body>
</html>