<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Signup1.aspx.cs" Inherits="WebApplication1.Signup1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
.control-group.error .fileupload .uneditable-input{color:#b94a48;border-color:#b94a48;}l
.control-group.error .fileupload .fileupload-preview{color:#b94a48;}
.control-group.error .fileupload .thumbnail{border-color:#b94a48;}
.control-group.success .fileupload .uneditable-input{color:#468847;border-color:#468847;}
.control-group.success .fileupload .fileupload-preview{color:#468847;}
.control-group.success .fileupload .thumbnail{border-color:#468847;}
    
    </style>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript">

        function openModal() {
            debugger;
            alert("1");
            $('#regConfirm').modal('show');
        }
       
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
 function checkBlank() {
   
             var name = document.getElementById("ContentPlaceHolder1_txtName").value
             var mail = document.getElementById("ContentPlaceHolder1_txtEmail").value
             var mob = document.getElementById("ContentPlaceHolder1_txtMobNo").value
             var pass = document.getElementById("ContentPlaceHolder1_txtPswd").value
             var repass = document.getElementById("ContentPlaceHolder1_rePswd").value
             if (name == "" || mail == "" || mob == "" || pass == "" || repass="")
                 return false;
             else
                 return ValidateSignUp();                 

         }
         function validateFile() {
            
             alert(document.getElementById("fileType"));
         }

        function ValidateSignUp() {
            var qual = document.getElementById("ContentPlaceHolder1_ddlQual");
            var university = document.getElementById("ContentPlaceHolder1_ddlUniversity");
            var marks = document.getElementById("ContentPlaceHolder1_ddlMarks");
            var city = document.getElementById("ContentPlaceHolder1_ddlCity");
            var company = document.getElementById("ContentPlaceHolder1_ddlCompany");
            var exp = document.getElementById("ContentPlaceHolder1_ddlExp");
            
            var qualValue = qual.options[qual.selectedIndex].value;
            var univValue = university.options[university.selectedIndex].value;
            var marksValue = marks.options[marks.selectedIndex].value;
            var cityValue = city.options[city.selectedIndex].value;
            var cmyValue = company.options[company.selectedIndex].value;
            var expValue = exp.options[exp.selectedIndex].value;

            if (qualValue == 1) {
                alert("Please Select Qualification");
                return false;
            }
            if (univValue == 1) {
                alert("Please Select Institute");
                return false;
            }
            if (marksValue == 1) {
                alert("Please Select Marks");
                return false;
            }
            if (cityValue == 1) {
                alert("Please Select City");
                return false;
            }
            if (cmyValue == 1) {
                alert("Please Select Company");
                return false;
            }
            if (expValue == 1) {
                alert("Please Select Experience");
                return false;
            }
            return true;          

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid  margin-top-30">
        <div class="well row">
            <div class="col-md-6">  
                <div class="panel-group" id="accordion">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Scholarship for
                                    Technical Education </a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>
                                    This is ongoing scheme to provide full financial support for persuing studies beyong
                                    12th class.</p>
                                <p>
                                    A student is allowed to avail the scholarship either under the State Plan Scheme
                                    or Centrally Sponsored Scholarship Scheme, whichever is beneficial to him/her and
                                    should inform the awarding authority through the Head of the Institution by mode
                                    of a declaration.</p>
                                <p>
                                    Many students can't avail this facility due to lack of knowledge.We are here to
                                    help them.Are you one of them??</p>
                                <p>
                                    <h3>
                                        Important Notes</h3>
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Student have to provide Income
                                    certificate along with Caste Certificate during admission or after.</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Student have to take admission
                                    thorugh us to avail this facility.</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Not any charge from the students
                                    ie Everything is Absolutely free!!</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Scholarship Amount will be
                                    awarded to student in their own account.</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>So why are you waiting?Don't
                                    think, you can't study.We are here to help you. Register with us or Request a callback.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel  panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Career Guidance
                                </a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>
                                    We are bringing together dedicated students,professionals with a select group of
                                    career experts. Choosing a right career option is the most vital decision in everyone's
                                    life.We breeds positive thinking, increased confidence, and better results.</p>
                                <p>
                                    <h3>
                                        Still confused about your career????</h3>
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Don't waste your time,Feel
                                    free to contact us..</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel  panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Job Assistance
                                </a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>
                                    All Internal job openings under same platform.We refer candidates profiles in top
                                    MNCs and another organization.</p>
                                <p>
                                    <h3>
                                        How it works?</h3>
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Register with us.</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>we will refer your profile
                                    on behalf of you.
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>profile selected,attend interview
                                    process.
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Get your dream job!!!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <form id="formSignup" runat="server" class="form-horizontal">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="background: #000000;">
                        <h4 class="page-header panel-title text-center ">
                            <strong>Registration</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="row text-center form-group">
                            <%--<a class="btn-lg btn-social btn-linkedin " href="Login1.aspx?login=Social"><i class="fa fa-linkedin fa-3x">--%>
                            <a class="btn-lg btn-social btn-linkedin" href="login?login=Social"><i class="fa fa-linkedin fa-3x">
                            </i>Sign up with LinkedIn</a>

                           <%--  <div class="text-center">                     
                           <a class="btn-lg btn-social btn-linkedin text-center" onclick="lnkTest();" href="#" >
                       <span class="fa fa-linkedin fa-3x"></span>Sign up with LinkedIn</a>                                                                                                                        
                      </div>--%>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="txtName" runat="server">
                                Name:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtName" placeholder="Name"
                                    type="text" required />
                                <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtName"
                                    ValidationExpression="^[a-zA-Z'.\s]{1,30}" Text="Enter a valid name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="txtEmail">
                                Email:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email"
                                    type="email" required />
                                <asp:RegularExpressionValidator ID="rfvEmail2" runat="server" ErrorMessage="Please Enter Valid Email ID"
                                    ValidationGroup="vgSubmit" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="txtMobNo">
                                Contact:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtMobNo" name="MobNo" placeholder="Mobile"
                                    type="text" MaxLength="10" required />
                                <asp:RegularExpressionValidator ID="rfvPhoneNo" runat="server" ErrorMessage="Please Enter Valid Phone No"
                                    ControlToValidate="txtMobNo" CssClass="requiredFieldValidateStyle" ForeColor="Red"
                                    ValidationExpression="\+?\d[\d -]{8,12}\d">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label id="lblPassword" class="control-label col-sm-2" for="txtPswd" runat="server">
                                Password:</label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtPswd" placeholder="password"
                                    type="password" required />
                                <asp:RegularExpressionValidator ID="regPwd" runat="server" ControlToValidate="txtPswd"
                                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"
                                    ForeColor="Red" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label id="Label1" class="control-label col-sm-2" for="rePswd" runat="server">
                                Re-Password:</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="password" runat="server" id="rePswd" placeholder=" re- enter password" required/>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="rePswd"
                                    CssClass="ValidationError" ForeColor="Red" ControlToCompare="txtPswd" ErrorMessage="No Match"
                                    ToolTip="Password must be the same" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label id="lblQual" class="control-label col-sm-2" for="ddlQual" runat="server">
                                Qualification:</label>
                            <div class="col-sm-4">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlQual" CssClass="btn-default btn-sm  dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>
                                 
                                </div>
                            </div>
                            <label id="lblMarks" class="control-label col-sm-2" for="ddlMarks" runat="server">
                                Marks:</label>
                            <div class="col-sm-4">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlMarks" CssClass="btn-default btn-sm  btn-lg dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                          <div class="form-group">                                             
                            <label id="lblUniversity" class="control-label col-sm-2 " for="ddlUniversity"
                                runat="server">
                                Institute:</label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlUniversity" CssClass="btn-default btn-sm   dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class=" form-group">
                            <label id="lblCity" class="control-label col-sm-2" for="ddlCity" runat="server">
                                City:</label>
                            <div class="col-sm-4">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn-default btn-sm  btn-lg dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>                                  
                                </div>
                            </div>
                        </div>
                        <div  id="JobSeeker" runat="server">
                          <div class="form-group">
                            <label id="lblCompany" class="control-label col-sm-2" for="ddlCompany" runat="server">
                                Company:</label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlCompany" CssClass="btn-default btn-sm btn-lg dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>                                  
                                </div>
                            </div>
                            </div>
                            <div class="form-group">
                            <label id="lblExp" class="control-label col-sm-2" for="ddlExp" runat="server">
                                Experience:</label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <asp:DropDownList runat="server" ID="ddlExp" CssClass="btn-default btn-sm  btn-lg dropdown-toggle"
                                        EnableTheming="true">
                                    </asp:DropDownList>                                    
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label id="lblAbout" runat="server" class="control-label col-md-2" for="txtAreaAbout">
                                Describe Yourself:</label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtAreaAbout"
                                    Style="resize: none;" placeholder="Describe yourself..." Rows="4" cols="4" required />
                                <asp:RegularExpressionValidator ID="reqAbout" runat="server" ControlToValidate="txtAreaAbout"
                                    ValidationExpression="^[a-zA-Z0-9.,\s]{1,500}" Text="Enter a valid Text" />
                            </div>
                        </div>
                        <div class="form-group" id="Resume" runat="server">
                            <label id="lblResume" runat="server" class="control-label col-md-2" for="btnFileUpload">
                                Resume:</label>
                            <div class="col-md-10">                                                      
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                    <span class="btn-sm btn-primary btn-file" ><span class="fileupload-new">Select file</span>
                                        <span class="fileupload-exists">Change</span>
                                        <input type="file" runat="server"  id="fileType"/></span> <span class="fileupload-preview"></span><a href="#"
                                            class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                </div>                                                      
                            </div>
                         <%--   <button cssclass="btn-sm btn-sucess" runat="server" id="btnFileUpload" title="Upload"
                                onclientclick="validateFile()" onclick="UploadButton_Click">
                            </button>
                            <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />--%>
                        </div>
                    </div>
                    <div class="panel-footer">
                   
                        <div class="row">
                         <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                        <button id="btnReset" type="reset" class="btn btn-danger" value="Reset" runat="server">
                                            Reset</button>
                                   </div>
                            <%--<div class="col-sm-6 form-group text-center margin-top-10" style="margin-left: 20%;">--%>
                             <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                                <asp:Button class="btn btn-success" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server"
                                    Text="Submit" OnClientClick="checkBlank()"></asp:Button>
                            </div>
                        </div>
                        <div class="text-info text-center">
                            <i class="fa fa-lock"></i><strong>Your information is safe with us!</strong>
                        </div>
                    </div>
                </div>
                </form>  

               <a href="#regConfirm" data-toggle="modal" data-target="#regConfirm"></a>
            </div>
        </div>
        <div class="row">
            <p class="text-info" style="font-family: Arial; margin-left: 1%;">
                By entering my information and clicking "Submit," We are providing express consent
                to be contacted by CareerExpert via email, phone and text, including my wireless
                phone number, regarding job placement, job openings, career services, credential
                building and professional skill-building opportunities using automated technology.
                Standard message and data rates may apply to text messages. You are not required
                to provide consent to receive services from CareerExpert. You will also receive
                free membership into CareerExpert Member Benefits.</p>
        </div>
    </div>
</asp:Content>
