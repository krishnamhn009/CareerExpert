<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default1.aspx.cs" Inherits="WebApplication1._Default" %>
   
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/TableStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        var i = 0;
        var image = new Array();
        // LIST OF IMAGES 
        image[0] = "Image/1.jpg";
        image[1] = "Image/2.jpg";
        image[2] = "Image/3.png";
        var k = image.length - 1;

        var caption = new Array();

        // LIST OF CAPTİONS  
        caption[0] = "Gandhi Groups of Institute";
        caption[1] = "Caption for the second image";
        caption[2] = "Caption for the third image";

        function swapImage() {
            var el = document.getElementById("mydiv");
            el.innerHTML = caption[i];
            var img = document.getElementById("slide");
            img.src = image[i];
            if (i < k) { i++; }
            else { i = 0; }
            setTimeout("swapImage()", 3000);
        }

        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            }
            else {
                window.onload = function () {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                } 
            } 
        }
        addLoadEvent(function () {
            swapImage();
        });  
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 
    <table  style="border: 0px solid #00aaff; background-color: #ffffff;">
    <tr></tr>
        <tr>
            <td>
                <img id="slide" alt="my images" height="285" width="100%" src="Image/1.jpg" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font: small-caps bold 15px georgia; color:#259AD1;">
                <div id="mydiv">
                </div>
            </td>
        </tr>
    </table>
    <table cellpadding="0" style="width: 100%;" border="0px  black";>
        
   
       
        <tr>
            <td colspan="2">
                <marquee>This is basic example of marquee</marquee>
            </td>
        </tr>
        <tr>
            <td>
                <div class="CSSTableGenerator">
                    <table>
                        <tr>
                            <td align="justify">
                                <a href="/Faculty.aspx" style="text-decoration:blink;">Faculty Assistance</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    We love to advises, guides, and supports parents and students in home-centered learning,
                                    Parents often need help to begin and keep focused on home education. The TC helps
                                    parents direct their children’s education, while also integrating their own expertise
                                    to mentor and challenge the student to deeper, broader, and higher academic and
                                    personal integrity levels...<a href="#" style="font-style: italic">more</a>
                                </p>
                            </td>
                        </tr>
                      
                    </table>
                </div>
               
            </td>
            <td>
                 <div class="CSSTableGenerator">
                    <table>
                        <tr>
                            <td>
                                <a href="/Faculty.aspx" style="text-decoration:blink;">Career Counselling</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="justify">
                                <p>
                                    We helps you to establish realistic career goals, develop a plan of action, and
                                    stay focused on reaching your goals. Choosing a right career option is the most
                                    vital decision in everyone's life.We breeds positive thinking, increased confidence,
                                    and better results. You’ll get honest, candid, and truthful answers while building
                                    rapport with your Career Coach. Break bad habits, learn better ones, make more money,
                                    reach new levels, or strike the ideal work-life balance.
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
        <td>
           <div class="CSSTableGenerator">
                    <table>
                        <tr>
                            <td>
                               <a href="/Faculty.aspx">Admission Guindence</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="justify">
                                <p>
                                    We helps you to establish realistic career goals, develop a plan of action, and
                                    stay focused on reaching your goals. Choosing a right career option is the most
                                    vital decision in everyone's life.We breeds positive thinking, increased confidence,
                                    and better results. You’ll get honest, candid, and truthful answers while building
                                    rapport with your Career Coach. Break bad habits, learn better ones, make more money,
                                    reach new levels, or strike the ideal work-life balance.
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
          </td>
          <td>
             <div class="CSSTableGenerator">
                    <table>
                        <tr>
                            <td>
                                <a href="/Faculty.aspx">Job Assistence</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="justify">
                                <p>
                                    We helps you to establish realistic career goals, develop a plan of action, and
                                    stay focused on reaching your goals. Choosing a right career option is the most
                                    vital decision in everyone's life.We breeds positive thinking, increased confidence,
                                    and better results. You’ll get honest, candid, and truthful answers while building
                                    rapport with your Career Coach. Break bad habits, learn better ones, make more money,
                                    reach new levels, or strike the ideal work-life balance.
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
          </td>
        </tr>
    </table>

    
   
</asp:Content>
