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

  <title>Employee Profile</title>

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
    <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="employee-dashboard">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Employee Portal</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
       Salary
      </div>

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-dollar-sign"></i>
          <span>Salary</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
       Account
      </div>

      <li class="nav-item active">
        <a class="nav-link" href="/employee/employee-profile">
          <i class="fas fa-fw fa-user"></i>
          <span>Profile</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
        Contact
      </div>

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-address-card"></i>
          <span>About</span></a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa fa-paper-plane"></i>
          <span>Contact Us</span></a>
      </li>

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

            <!-- Main page content-->
            <div class="container mt-4">
                <!-- Page Heading -->
                      <h1 class="h3 mb-2 text-gray-800">Update Profile</h1>

                      <hr class="mt-0 mb-4" />

                      <div class="row">
                          <div class="col-xl-4">
                              <!-- Profile picture card-->
                              <div class="card">
                                  <div class="card-header">Profile Picture</div>
                                  <div class="card-body text-center">
                                      <!-- Profile picture image-->
                                      <img class="img-account-profile rounded-circle mb-2" src="https://source.unsplash.com/QAB-WJcbgJk/300x300" alt />
                                      <!-- Profile picture help block-->
                                      <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                      <!-- Profile picture upload button-->

                                     <!--<button class="btn btn-primary" type="button">Upload new image</button>-->

                                     <div style="height:0px;overflow:hidden">
                                          <input type="file"  id="employeeProfileImageUpload" name="fileInput" />
                                     </div>

                                     <button class="btn btn-primary" type="button" onclick="uploadEmployeeProfileImage();">Upload new Image</button>

                                  </div>
                              </div>
                          </div>
                          <div class="col-xl-8">
                              <!-- Account details card-->
                              <div class="card mb-4">
                                  <div class="card-header">Account Details</div>
                                  <div class="card-body">
                                    <form class="was-validated">
                                      <div class="form-row">
                                        <div class="col-md-6 mb-3">
                                          <label for="validationTooltip01">First name</label>
                                          <input type="text" class="form-control" id="normal_emp_profile_fname" placeholder="First name" readonly="readonly" required>
                                          <div class="invalid-tooltip">
                                            Please Enter First-Name.
                                          </div>
                                          <div class="valid-tooltip">
                                            Looks good!
                                          </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                          <label for="validationTooltip02">Last name</label>
                                          <input type="text" class="form-control" id="normal_emp_profile_lname" placeholder="Last name" readonly="readonly" required>
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
                                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" id="normal_emp_profile_email" placeholder="Email" aria-describedby="validationTooltipUsernamePrepend" readonly="readonly" required>
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
                                            <select class="custom-select" id="normal_emp_profile_gender" disabled="disabled" required>
                                              <option value="">Choose...</option>
                                              <option value ="1">Male</option>
                                              <option value="2">Female</option>
                                              <option value="3">Other</option>
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
                                        <div class="col-md-6 mb-5 mt-4">
                                          <label for="validationTooltip03">Address</label>
                                          <input type="text" class="form-control" id="normal_emp_profile_address" placeholder="Address" readonly="readonly" required>
                                          <div class="invalid-tooltip">
                                            Please provide Valid Address.
                                          </div>
                                          <div class="valid-tooltip">
                                            Looks good!
                                          </div>
                                        </div>
                                        <div class="col-md-3 mb-5 mt-4">
                                          <label for="validationTooltip04">NIC</label>
                                          <input type="text" class="form-control" id="normal_emp_profile_nic" placeholder="NIC" readonly="readonly" required>
                                          <div class="invalid-tooltip">
                                            Please provide Valid NIC.
                                          </div>
                                          <div class="valid-tooltip">
                                            Looks good!
                                          </div>
                                        </div>
                                        <div class="col-md-3 mb-5 mt-4">
                                          <label for="validationTooltip05">Mobile Number</label>
                                          <input type="text" class="form-control" id="normal_emp_profile_mobileNo" placeholder="Mobile Number" readonly="readonly" required>
                                          <div class="invalid-tooltip">
                                            Please provide Mobile Number.
                                          </div>
                                          <div class="valid-tooltip">
                                            Looks good!
                                          </div>
                                        </div>
                          
                                        <div class="col-md-6 mb-4 mt-4">
                                          <label for="validationTooltipDesignation">Designation / Position</label>
                                            <select class="custom-select" id="normal_emp_profile_designation" disabled="disabled" required>
                                              <option value="">Choose...</option>
                                              <option value ="1">Manager</option>
                                              <option value="2">Reception</option>
                                              <option value="3">Web Manager</option>
                                            </select>
                                              <div class="invalid-tooltip">
                                                Please Select Valid Designation.
                                              </div>
                                              <div class="valid-tooltip">
                                                Looks good!
                                              </div>
                                          </div>
                          
                                        <div class="col-md-6 mb-4 mt-4">
                                          <label for="validationTooltip05">Birth Date</label>
                                          <input type="date" class="form-control" id="normal_emp_profile_birthDate" placeholder="Birth Date" readonly="readonly" required>
                                          <div class="invalid-tooltip">
                                            Please provide Birth Date.
                                          </div>
                                          <div class="valid-tooltip">
                                            Looks good!
                                          </div>
                                        </div>
                          
                                        <div class="col-md-6 mb-2 mt-4">
                                          <label for="validationTooltipDesignation">Branch</label>
                                            <select class="custom-select" id="normal_emp_profile_branch" disabled="disabled" required>
                                              <option value="">Choose...</option>
                                              <option value ="1">Kandy</option>
                                              <option value="2">Colombo</option>
                                              <option value="3">Kurunagala</option>
                                              <option value="3">Matara</option>
                                            </select>
                                              <div class="invalid-tooltip">
                                                Please Select Valid Branch.
                                              </div>
                                              <div class="valid-tooltip">
                                                Looks good!
                                              </div>
                                          </div>
                          
                                          <div class="col-md-6 mb-2 mt-4">
                                            <label for="validationTooltipDesignation">Department</label>
                                              <select class="custom-select" id="normal_emp_profile_department" disabled="disabled" required>
                                                <option value="">Choose...</option>
                                                <option value ="1">Marketing</option>
                                                <option value="2">Accounting and Finance</option>
                                                <option value="3">Human Resource Management</option>
                                                <option value="3">Research and Development</option>
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
                                          <div class="col-md-12 mb-3 mt-4">
                                            <label for="validationTooltip03">Current Password</label>
                                            <input type="password" class="form-control" id="normal_emp_profile_current_password" placeholder="Current Password"  readonly="readonly" required>
                                            <div class="invalid-tooltip">
                                              Please Enter Current Password.
                                            </div>
                                            <div class="valid-tooltip">
                                              Looks good!
                                            </div>
                                          </div>
                                        </div>
                                          
                                          <div class="form-row">
                                          <div class="col-md-6 mb-4 mt-4">
                                            <label for="validationTooltip04">New Password</label>
                                            <input type="password" class="form-control" id="normal_emp_profile_new_password" placeholder="New Password" readonly="readonly" required>
                                            <div class="invalid-tooltip">
                                              Please Enter New Passsword.
                                            </div>
                                            <div class="valid-tooltip">
                                              Looks good!
                                            </div>
                                          </div>
                          
                                          <div class="col-md-6 mb-4 mt-4">
                                            <label for="validationTooltip05">Confirm New Password</label>
                                            <input type="password" class="form-control" id="normal_emp_profile_confirm_new_password" placeholder="Confirm New Password" readonly="readonly" required>
                                            <div class="invalid-tooltip">
                                              Please Confirm New Password.
                                            </div>
                                            <div class="valid-tooltip">
                                              Looks good!
                                            </div>
                                          </div>
                                          </div>
                                        
                                      </div>

                                          <button class="btn btn-primary mt-4 mb-6" type="submit" id="employee_updateProfileData_btn_text" onclick="updateProfileDetailsEmployee()">Update</button>
                                          <button class="btn btn-secondary mt-4 mb-6" type="submit" id="employee_profile_cancel_edit" hidden>Cancel</button>

                                      </form>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>

     

            </div>
            </div>


        </div>        

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" crossorigin="anonymous"></script>

        <script src="../static/admin/js/admin_profile_image_btn.js"></script>

    </body>
</html>