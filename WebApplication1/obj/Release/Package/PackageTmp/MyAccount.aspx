<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="WebApplication1.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
      .clearfix{*zoom:1;}.clearfix:before,.clearfix:after{display:table;content:"";line-height:0;}
.clearfix:after{clear:both;}
.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0;}
.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}
.btn-file{overflow:hidden;position:relative;vertical-align:middle;}.btn-file>input{position:absolute;top:0;right:0;margin:0;opacity:0;filter:alpha(opacity=0);transform:translate(-300px, 0) scale(4);font-size:23px;direction:ltr;cursor:pointer;}
.fileupload{margin-bottom:9px;}.fileupload .uneditable-input{display:inline-block;margin-bottom:0px;vertical-align:middle;cursor:text;}
.fileupload .thumbnail{overflow:hidden;display:inline-block;margin-bottom:5px;vertical-align:middle;text-align:center;}.fileupload .thumbnail>img{display:inline-block;vertical-align:middle;max-height:100%;}
.fileupload .btn{vertical-align:middle;}
.fileupload-exists .fileupload-new,.fileupload-new .fileupload-exists{display:none;}
.fileupload-inline .fileupload-controls{display:inline;}
.fileupload-new .input-append .btn-file{-webkit-border-radius:0 3px 3px 0;-moz-border-radius:0 3px 3px 0;border-radius:0 3px 3px 0;}
.thumbnail-borderless .thumbnail{border:none;padding:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;}
.fileupload-new.thumbnail-borderless .thumbnail{border:1px solid #ddd;}
.control-group.warning .fileupload .uneditable-input{color:#a47e3c;border-color:#a47e3c;}
.control-group.warning .fileupload .fileupload-preview{color:#a47e3c;}
.control-group.warning .fileupload .thumbnail{border-color:#a47e3c;}
.control-group.error .fileupload .uneditable-input{color:#b94a48;border-color:#b94a48;}
.control-group.error .fileupload .fileupload-preview{color:#b94a48;}
.control-group.error .fileupload .thumbnail{border-color:#b94a48;}
.control-group.success .fileupload .uneditable-input{color:#468847;border-color:#468847;}
.control-group.success .fileupload .fileupload-preview{color:#468847;}
.control-group.success .fileupload .thumbnail{border-color:#468847;}
    
    </style>
    <script  src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript">
        //        =========================================================
        !function (e) {
            var t = function (t, n) {
                this.$element = e(t), this.type = this.$element.data("uploadtype")
         || (this.$element.find(".thumbnail").length > 0 ? "image" : "file"), this.$input = this.$element.find(":file");
                if (this.$input.length === 0) return; this.name = this.$input.attr("name") || n.name,
         this.$hidden = this.$element.find('input[type=hidden][name="' + this.name + '"]'),
         this.$hidden.length === 0 && (this.$hidden = e('<input type="hidden" />'), this.$element.prepend(this.$hidden)),
         this.$preview = this.$element.find(".fileupload-preview");
                var r = this.$preview.css("height");
                this.$preview.css("display") != "inline" && r != "0px" && r != "none" && this.$preview.css("line-height", r),
         this.original = { exists: this.$element.hasClass("fileupload-exists"), preview:
         this.$preview.html(), hiddenVal: this.$hidden.val()
         },
         this.$remove = this.$element.find('[data-dismiss="fileupload"]'),
         this.$element.find('[data-trigger="fileupload"]').on("click.fileupload", e.proxy(this.trigger, this)), this.listen()
            };
            t.prototype = { listen: function () {
                this.$input.on("change.fileupload", e.proxy(this.change, this)),
         e(this.$input[0].form).on("reset.fileupload", e.proxy(this.reset, this)),
         this.$remove && this.$remove.on("click.fileupload", e.proxy(this.clear, this))
            }, 
         change: function (e, t) { if (t === "clear") return; var n = e.target.files !== undefined ? e.target.files[0] : e.target.value ? { name: e.target.value.replace(/^.+\\/, "")} : null; if (!n) { this.clear(); return } this.$hidden.val(""), this.$hidden.attr("name", ""), this.$input.attr("name", this.name); if (this.type === "image" && this.$preview.length > 0 && (typeof n.type != "undefined" ? n.type.match("image.*") : n.name.match(/\.(gif|png|jpe?g)$/i)) && typeof FileReader != "undefined") { var r = new FileReader, i = this.$preview, s = this.$element; r.onload = function (e) { i.html('<img src="' + e.target.result + '" ' + (i.css("max-height") != "none" ? 'style="max-height: ' + i.css("max-height") + ';"' : "") + " />"), s.addClass("fileupload-exists").removeClass("fileupload-new") }, r.readAsDataURL(n) } else this.$preview.text(n.name), this.$element.addClass("fileupload-exists").removeClass("fileupload-new") }, clear: function (e) { this.$hidden.val(""), this.$hidden.attr("name", this.name), this.$input.attr("name", ""); if (navigator.userAgent.match(/msie/i)) { var t = this.$input.clone(!0); this.$input.after(t), this.$input.remove(), this.$input = t } else this.$input.val(""); this.$preview.html(""), this.$element.addClass("fileupload-new").removeClass("fileupload-exists"), e && (this.$input.trigger("change", ["clear"]), e.preventDefault()) }, reset: function (e) { this.clear(), this.$hidden.val(this.original.hiddenVal), this.$preview.html(this.original.preview), this.original.exists ? this.$element.addClass("fileupload-exists").removeClass("fileupload-new") : this.$element.addClass("fileupload-new").removeClass("fileupload-exists") }, trigger: function (e) { this.$input.trigger("click"), e.preventDefault() } }, e.fn.fileupload = function (n) { return this.each(function () { var r = e(this), i = r.data("fileupload"); i || r.data("fileupload", i = new t(this, n)), typeof n == "string" && i[n]() }) }, e.fn.fileupload.Constructor = t, e(document).on("click.fileupload.data-api", '[data-provides="fileupload"]', function (t) { var n = e(this); if (n.data("fileupload")) return; n.fileupload(n.data()); var r = e(t.target).closest('[data-dismiss="fileupload"],[data-trigger="fileupload"]'); r.length > 0 && (r.trigger("click.fileupload"), t.preventDefault()) }) } (window.jQuery)
        //==============================================================
 </script>
<div class="container margin-top-30">
    <form id="form1" runat="server">
    <div class="row">
     <h2 class="text-center">Uniting Job Seeker & Employer at Same Platform</h2>
    </div>

  


    
    <%-----------------------------------------------------------------------------%>
    <ul class="nav nav-tabs margin-top-15 page-header">
        <li id="lbProfile" class="active" ><a data-toggle="tab" href="#menu0"><i class="fa fa-user fa-2x colortheme" style="margin-right:.1em;"></i>Profile</a></li>
        <li id="lblLatestJob"><a href="referral-jobs"><i class="fa fa-paper-plane-o fa-2x colortheme" style="margin-right:.1em;"></i>Latest Jobs</a></li>
        <li id="lblJobs" ><a data-toggle="tab" href="#menu1" ><i class="fa fa-suitcase fa-2x colortheme" style="margin-right:.1em;"></i>Applied Jobs
        <span class="badge btn-lg btn-primary "><asp:Label id="jobAppliedCount" runat="server"/></span>
        </a></li>

        <li id="lblRefer" ><a data-toggle="tab" href="#menu2"><i class="fa fa-users fa-2x colortheme" style="margin-right:.1em;"></i>Refer and Earn Referrals</a></li>
        <li runat="server" id="adminPanel" visible="false"><a href="dev"><i class="fa fa-user-secret fa-2x colortheme" style="margin-right:.1em;" ></i>Admin</a></li>         
    </ul>
    <div class="tab-content">
      <%--===============Profile Start========================================--%>
        <div id="menu0"  class="tab-pane fade in active">       
        <%--=======================================================--%>
       
            <div class="panel panel-default">
                                <div class="panel-body page-header">

                                 <div class="progress">
  <div id="progressBar" runat="server" class="progress-bar" role="progressbar" aria-valuenow="70"
  aria-valuemin="0" aria-valuemax="100" style="width:70%">
    <label runat="server" id="lblProgress"></label>
  </div>
</div>

                                <h3 class="text-center"><strong>Increase Chances of Getting Hired by 20x Times....</strong></h3>
                                <p>
                                    <i class="fa fa-check-square-o" style="color: Green"></i>Complete Your profile with updated resume.</p>
                                <p>
                                
                                    <i class="fa fa-check-square-o" style="color: Green"></i>we will refer your profile
                                    on behalf of you.
                                </p>
                                <p>
                                    <i class="fa fa-check-square-o" style="color: Green"></i>profile selected,attend interview
                                    process.
                                </p>
                                <p>
                                    <i class="fa fa-check-square-o" style="color: Green"></i>Get your dream job!!!</p>
                                 </div>
              <div class="panel-body h5" style=" color: #004466;" runat="server" id="showProfile">
                    <div class="form-group control-label col-sm-6 ">
                      <i class="fa fa-user-secret fa-2x colortheme" style="margin-right:.1em;"></i>                     
                      <label id="lName"  runat="server">
                      </label>
                   </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-envelope-o fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lEmail"  runat="server">
                        </label>
                        </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-tablet fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lMobile"  runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                     <i class="fa fa-check-circle fa-2x colortheme"  style="margin-right:.1em;"></i>
                      <label id="lMarks"  runat="server">
                      </label>
                  </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-university fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lInstitute" runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                       <i class="fa fa-street-view fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lCity"  runat="server">
                        </label>
                    </div>
                    <%--<div class="form-group control-label col-sm-6">
                        <i class="fa fa-map-marker" style="margin-right:.1em;"></i>
                        <label id="lLocation"  runat="server">
                        </label>
                    </div>--%>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-building fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lCompany"  runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-star-half-o fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lExp"  runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                     <i class="fa fa-graduation-cap fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lQualification" runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-file-text-o fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lAbout"  runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-file-archive-o fa-2x colortheme" style="margin-right:.1em;"></i>
                        <label id="lUploadResume"  runat="server">
                        </label>
                    </div>
                    <div class="row text-center">
                    <asp:Button class="btn btn-lg btn-primary" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"></asp:Button>                      
                    </div> 
                   <%-- <div class="row text-center"> 
                    <i class="fa fa-lock"></i><strong>Your information is safe with us!!!</strong>  
                    </div> --%>                   
              </div>
              <div class="panel-body form-horizontal" id="editProfie" runat="server">
                    <div class="form-group">
                        <label for="txtName" class="col-sm-2 control-label">
                            Name</label>
                        <div class="col-sm-8">
                           <asp:TextBox ID="txtName" CssClass="form-control" ReadOnly="true" runat="server" ></asp:TextBox>
                        </div>
                    </div>                                                       
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="txtEmail">
                            Email:</label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email"
                                type="email" ReadOnly="true" />                          
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="txtMobNo">
                            Contact:</label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtMobNo" name="MobNo" placeholder="Mobile"
                                type="text" MaxLength="10" />
                            <asp:RegularExpressionValidator ID="rfvPhoneNo" runat="server" ErrorMessage="Please Enter Valid Phone No"
                                ControlToValidate="txtMobNo" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                ValidationExpression="\+?\d[\d -]{8,12}\d">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label id="lblPassword" class="col-sm-2 control-label" for="txtPswd" runat="server"
                            visible="false">
                            Password:</label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPswd" placeholder="password" Visible="false"
                                type="password" required />
                            <asp:RegularExpressionValidator ID="regPwd" runat="server" ControlToValidate="txtPswd"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"
                                ForeColor="Red" />
                        </div>
                    </div>
                    <div class="form-group" runat="server" visible="false">
                        <label id="lblRePass" class="col-sm-2 control-label" for="rePswd" runat="server">
                            Re-Password:</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="password" runat="server" id="rePswd" placeholder=" re- enter password" />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="rePswd"
                                CssClass="ValidationError" ForeColor="Red" ControlToCompare="txtPswd" ErrorMessage="No Match"
                                ToolTip="Password must be the same" />
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label id="lblQual" class="col-sm-2 control-label" for="ddlQual" runat="server">
                            Qualification:</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlQual" CssClass="btn-default btn-sm   dropdown-toggle"
                                    EnableTheming="true">                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                        </div>
                    <div class="form-group">
                        <label id="lblUniversity" class="col-sm-2 control-label" for="ddlUniversity" runat="server">
                            Institute</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlUniversity" CssClass="btn-default btn-sm  dropdown-toggle"
                                    EnableTheming="true">                                   
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label id="lblMarks" class="col-sm-2 control-label" for="ddlMarks" runat="server">
                            Marks:</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlMarks" CssClass="btn-default btn-sm   dropdown-toggle"
                                    EnableTheming="true">                                   
                                </asp:DropDownList>
                            </div>
                        </div>
                        </div>
                    <div class="form-group">
                        <label id="lblCity" class="col-sm-2 control-label" for="ddlCity" runat="server">
                            City:</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn-default btn-sm  btn-lg dropdown-toggle"
                                    EnableTheming="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label for="txtName" class="col-sm-2 control-label">
                            Address</label>
                        <div class="col-sm-8">
                           <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" ></asp:TextBox>
                        </div>
                    </div>--%>  
                    <div id="JobSeeker" runat="server">
                      <div class="form-group">
                        <label id="lblCompany" class="col-sm-2 control-label" for="ddlCompany" runat="server">
                            Company:</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlCompany" CssClass="btn-default btn-sm  dropdown-toggle"
                                    EnableTheming="true">                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                     </div>
                        <div class="form-group">
                        <label id="lblExp" class="col-sm-2 control-label" for="ddlExp" runat="server">
                            Experience:</label>
                        <div class="col-sm-8">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlExp" CssClass="btn-default btn-sm  btn-lg dropdown-toggle"
                                    EnableTheming="true">                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div class="form-group">
                        <label id="lblAbout" runat="server" class="col-sm-2 control-label" for="txtAreaAbout">
                            Describe Yourself:</label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtAreaAbout"
                                Style="resize: none;" placeholder="Describe yourself..." Rows="4" cols="4"  />
                        </div>
                    </div>                   
                    <div class="form-group" id="Resume" runat="server">
                            <label id="lblResume" runat="server" class="col-sm-2 control-label" for="btnFileUpload">
                                Resume:</label>
                            <div class="col-sm-8">                                                      
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                    <span class="btn-sm btn-primary btn-file" ><span class="fileupload-new">Select file</span>
                                        <span class="fileupload-exists">Change</span>
                                        <input type="file" runat="server"  id="fileType"/></span> <span runat="server" class="fileupload-preview"></span><a href="#"
                                            class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                </div>                                                      
                            </div>                       
                        </div>

                    <div class="form-group" >
                            <label id="lblUploadedResume" runat="server" class="col-sm-2 control-label" for="btnFileUpload">
                                Last Uploaded Resume:</label>
                            <div class="col-sm-8">                                                      
                                <asp:Button runat="server" id="resumeUpLoaded" onclick="resumeUpLoaded_Click" ></asp:Button>                                                     
                            </div>                        
                        </div>
                    <asp:Button class="btn btn-sm btn-primary" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"></asp:Button>
                    <asp:Button class="btn btn-sm btn-success" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"></asp:Button>
                </div>
            </div>
            <div class="text-info text-center">
                        <i class="fa fa-lock"></i><strong>Your information is safe with us!</strong>
            </div>
               
        </div>
        <%--================Profile End=======================================--%>
              <%--================Job start=======================================--%>
        <div id="menu1" class="tab-pane fade ">          
            <div class="panel panel-default">               
                <div class="panel-body" runat="server" id="applidJobs">                 
                                             
                     <div id="jobAppliedWarning" class="alert alert-warning" runat="server" visible="false">
                        <strong>Oops!!!!</strong> you didn't apply for any job.
                     </div>
                     <%-- <a href="/OnlineJobs.aspx">Latest Jobs</a>--%>
                  
                     <div class="row">                  
                    <%-- <div class="col-md-3">
                      <a href="referral-jobs">Latest Jobs</a>
                      </div>--%>

                       <div id="noUserPlanTaken" class="col-md-9" runat="server" visible="false">
                          <div  class="alert alert-warning">
                        <strong>Oops!!!!</strong> Please Buy A Plan which suits you!!.
                       </div>
                       </div>

                     <div id="userPlanTaken" class="col-md-9" runat="server" visible="false" >
                        <!--User Plan-->
                        <div class="form-group control-label col-sm-6 ">
                      <i class="fa fa-shopping-basket fa-2x colortheme" aria-hidden="true"  style="margin-right:.1em;"></i>                     
                      <label id="lPlanName"  runat="server">
                      </label>
                   </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-chain-broken fa-2x colortheme" aria-hidden="true" style="margin-right:.1em;"></i>
                        <label id="lPlanExpireDate"  runat="server">
                        </label>
                        </div>
                    <div class="form-group control-label col-sm-6">
                        <i class="fa fa-universal-access  fa-2x colortheme" aria-hidden="true" style="margin-right:.1em;"></i>
                        <label id="lReferralsLeft"  runat="server">
                        </label>
                    </div>
                    <div class="form-group control-label col-sm-6">
                     <i class="fa fa-paper-plane-o fa-2x colortheme" aria-hidden="true"  style="margin-right:.1em;"></i>
                      <label id="lJobsAppliedCount"  runat="server">
                      </label>
                  </div>                  
                        <!--User Plan-->
                        </div>
                      
                      </div>
                      <div class="row">
                     <asp:Repeater ID="Repeater1" runat="server">                    
                    <ItemTemplate>
                        <div class="panel panel-primary">
                            <div class="panel-heading panel-heading-career" >
                                <p class="page-header panel-title">
                                    <a class="text-info" title="Click to see details" data-toggle="collapse" data-parent="#accordion" href="#<%# DataBinder.Eval(Container.DataItem, "JobId")%>">
                                     
                                        <%# DataBinder.Eval(Container.DataItem, "JobTitle")%></a>
                                    (
                                    <%# DataBinder.Eval(Container.DataItem, "JobExperience")%>
                                    Years)
                                    <div class="text-left">
                                        
                                        <%# DataBinder.Eval(Container.DataItem, "Company")%> |
                                        <%# DataBinder.Eval(Container.DataItem, "Location")%>
                                        </div>
                                </p>
                            </div>
                            <div id="<%# DataBinder.Eval(Container.DataItem, "JobId")%>" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p class="page-header panel-title">
                                    <%# DataBinder.Eval(Container.DataItem, "JobDesc") %>                                  
                                    </p>                                
                            </div>
                            </div>
                        </div>
                    </ItemTemplate>                                 
                </asp:Repeater> 
                      </div>
                </div>            
        </div>
        </div>
              <%--================Job End=======================================--%>
                    <%--================Refer Start=======================================--%>
        <div id="menu2" class="tab-pane fade">                                                                                     
       <div class="panel panel-default">
                <div class="panel-body">
                 <p>
            <i class="fa fa-check fa-fw" style="color: Green"></i>Are you a Employer??Looking for right candidates...Share your requirements with us. <a href="#modalJobs" data-toggle="modal" data-target="#modalJobs">
                                        Become an Interviewer</a></p>       
        <p>
            <i class="fa fa-check fa-fw" style="color: Green"></i>Once Job Seeker request interact with you regarding opening in your Organization,their details will available here.</p>       
        <p>
            <i class="fa fa-check fa-fw" style="color: Green"></i>Once you have responded to Job Seeker and willing to  refer the same,you will earn 1 job referral for each Job Seeker.</p>
        <p>
            <i class="fa fa-check fa-fw" style="color: Green"></i> Get more referral request by adding jobs...</p>
             
               <%-------------------Jobs Modal start----------------------------%>
                <div class="modal fade margin-top-50" id="modalJobs">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header mod-header">
                    <button type="button" class="close mod-close" data-dismiss="modal" aria-hidden="true">
                        ×</button>
                    <h4 class="modal-title text-center">
                        Add Jobs</h4>
                </div>
                <form id="loginForm" method="post" action="my-dashboard">
                <div class="modal-body mod-body">                      
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-th"></i></span>
                            <input class="form-control" id="txtNewUerJobTitle" placeholder="Job Title" type="text" runat="server"
                                 />                        
                        </div>                     
                    </div>
                    <div class="form-group ">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></i></span>
                            <input class="form-control" id="txtNewUserJobLoc" placeholder="Job Location" type="text"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-building"></i></span>
                            <input class="form-control" id="txtNewUserJobCompany" placeholder="Company" 
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-tasks"></i></span>
                            <input class="form-control" id="txtNewUserJobDesc" placeholder="Job Description" 
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-star-half-o"></i></span>
                            <input class="form-control" id="txtNewUserJobExp" placeholder="Job Experience Required" 
                                runat="server" />
                        </div>
                    </div>                    
                </div>
                <div class="modal-footer">
                    <a href="#" data-dismiss="modal" class="btn btn-danger">Close</a>
                    <input type="submit" value="Add" class="btn btn-success" runat="server" />
                </div>
                </form>
            </div>
        </div>        
    </div>  
                  <%-------------------Jobs Modal End----------------------------%>
          <%--  <div class="col-sm-offset-4 col-sm-4">
           <div id="OfficeMailId" class="form-group text-center" runat="server">
               <div class="input-group" id="OfcMailText" runat="server">
                   <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                   <asp:TextBox class="form-control col-sm-4" ID="txtOfficeEmail" placeholder="Your Official Mail " type="email"
                       runat="server" required />
                 
               </div>
               <asp:RegularExpressionValidator ID="rfvEmail2" runat="server" ErrorMessage="Please Enter Valid Email ID"
                   ValidationGroup="vgSubmit" ControlToValidate="txtOfficeEmail" CssClass="requiredFieldValidateStyle"
                   ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
               </asp:RegularExpressionValidator>
               <div id="OTPText" class="input-group" runat="server" visible="false">
                   <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                   <asp:TextBox class="form-control col-sm-4" ID="txtOTP" placeholder="your OTP please "
                       type="text" runat="server" required />
               </div>
               <div id="OTPError" class="alert alert-danger" runat="server" visible="false">
                   <button type="button" class="close" data-dismiss="alert">
                       ×</button>
                   <strong>Please enter valid OTP</strong>
               </div>

               <asp:Button ID="btnValOTP" CssClass="btn btn-sm btn-success" Text="Validate OTP"
                   runat="server" OnClick="btnValOTP_ValidateOTP" Visible="false"/>
               <asp:Button ID="btnValidateMail" CssClass="btn btn-sm btn-success" Text="Send OTP"
                   runat="server" OnClick="btnValidateMail_ValidateMail" Visible="false"/>
               
               <div id="OTPNotice" class="alert alert-success" runat="server" visible="false">
                   <button type="button" class="close" data-dismiss="alert">
                       ×</button>
                   <strong>Thank you!!!Your Official Email is secure with us.</strong>
               </div>

           </div>
           </div>
            </div>
            <div class="panel-footer" id="PostJob" runat="server" visible="false">
                <h2 class="btn btn-sm">
                    <a data-toggle="collapse" data-parent="#accordion" href="#AddJob">Post A Job</a>
                </h2>
            </div>--%>
      </div>

                <%--===============Posted Job Start====================--%>
                 <div class="panel-body" runat="server" id="postedJobs">
                     <asp:Repeater ID="Repeater2" runat="server">                    
                    <ItemTemplate>
                        <div class="panel panel-primary">
                            <div class="panel-heading panel-heading-career" >
                                <p class="page-header panel-title">
                                    <a class="text-info" title="Click to see details" data-toggle="collapse" data-parent="#accordion" href="#<%# DataBinder.Eval(Container.DataItem, "JobId")%>">
                                     
                                        <%# DataBinder.Eval(Container.DataItem, "JobTitle")%></a>
                                    (
                                    <%# DataBinder.Eval(Container.DataItem, "JobExperience")%>
                                    Years)
                                    <div class="text-left">
                                        
                                        <%# DataBinder.Eval(Container.DataItem, "Company")%> |
                                        <%# DataBinder.Eval(Container.DataItem, "Location")%>
                                        </div>
                                </p>
                            </div>
                            <div id="<%# DataBinder.Eval(Container.DataItem, "JobId")%>" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p class="page-header panel-title">
                                    <%# DataBinder.Eval(Container.DataItem, "JobDesc") %>                                  
                                    </p>                                
                            </div>
                            </div>
                        </div>
                    </ItemTemplate>                                 
                </asp:Repeater>
                </div>    
                <%--===============Posted Job End==============================--%>
           </div>
        </div>
          <%--================Refer End=======================================--%>
                       
    </div>              
    <div id="AddUserJobSuccess" class="alert alert-success" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">
                ×</button>
            <strong>Your Job Post has reached us.It will posted after Review.We will contact you shortly</strong>
        </div>
    <%---------------------------------------------------------------------------------%>
    <div id="AddJobSuccess" class="alert alert-success" runat="server" visible="false">
            <button type="button" class="close" data-dismiss="alert">
                ×</button>
            <strong>Your Job Post has reached us.It will posted after Review.We will contact you shortly</strong>
        </div>
    <div id="Employer" class="row" runat="server" visible="false">
      <div class="panel panel-default">
        <%--  <div class="panel-head page-header text-center">
              <h2 class="btn btn-sm"><a data-toggle="collapse" data-parent="#accordion" href="#AddJob">Post A Job</a> </h2>
                
          </div>--%>
          <div id="AddJob" class="panel-collapse collapse">
    <h2 class="text-center">Job Details</h2>
      <div class="panel-body page-header">
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobId"
              placeholder="Job Id .. 98745..." type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control" ID="txtNewJobTitle"
              placeholder="Job Title ... Fresher/Programmer/Designer..." type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobLoc"
              placeholder="Job Location ... Pune/Banglore/Kolkata..." type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobCompany"
              placeholder="Company ... Cognizant/IBM/TCS..." type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobDesc"
              placeholder="Job Description ...Job Profile..." type="text" required Columns="4" Rows="4" TextMode="MultiLine" />
          <asp:TextBox runat="server" CssClass="form-control" ID="txtNewJobExp" placeholder="Job Experience Required"
              type="text" required />
          <div class="panel-footer text-center">
          <button type="reset" runat="server" class="btn btn-sm btn-primary" id="btnClear" style="margin-right:10px;">
              Clear</button>
          <asp:Button runat="server" CssClass="btn btn-sm  btn-success" Text="Add" ID="btnAddJob"
               />
             </div>
      </div>
  </div>
  </div> 
  </div>
  </form>
</div>
</asp:Content>
