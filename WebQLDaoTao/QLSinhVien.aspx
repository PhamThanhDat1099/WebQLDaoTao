<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/Paging.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h5 class="alert alert-success">Trang quản lí sinh viên </h5>
    <hr />
        <button type="button" class="btn btn-info btn-lg" style="margin-bottom: 5px;" data-toggle="modal" data-target="#modalOpenAddButton">Thêm mới</button>
        <!-- Modal -->
       
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
        <asp:GridView DataKeyNames="MaSV" ID="gv_SinhVien" CssClass="table table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" runat="server"
            OnRowEditing="gv_SinhVien_RowEditing" OnRowCancelingEdit="gv_SinhVien_RowCancelingEdit" OnRowDeleting="gv_SinhVien_RowDeleting"
            OnRowUpdating="gv_SinhVien_RowUpdating" OnPageIndexChanging="gv_SinhVien_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="MaSV" SortExpression="MaSV" />
                <asp:BoundField DataField="HoSV" HeaderText="HoSV" SortExpression="HoSV" />
                <asp:BoundField DataField="TenSV" HeaderText="TenSV" SortExpression="TenSV" />
                <asp:CheckBoxField DataField="GioiTinh" HeaderText="GioiTinh" SortExpression="GioiTinh" />
                <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" DataFormatString="{0: dd/MM/yyyy}" />
                <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
                <asp:BoundField DataField="DiaChi" HeaderText="DiaChi" SortExpression="DiaChi" />
                <asp:BoundField DataField="MaKH" HeaderText="MaKH" SortExpression="MaKH" />    
                <%--<asp:TemplateField HeaderText="Khoa">
                    <EditItemTemplate>
                        <asp:DropDownList ID="makh" runat="server" DataSourceID="ods_Khoa" DataTextField="TenKH" DataValueField="MaKH"
                            SelectedValue='<%# Bind("MaKH") %>'>
                        </asp:DropDownList>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# Eval("Makh") %>
                    </ItemTemplate>
                </asp:TemplateField>--%>

                <asp:TemplateField HeaderText="Chọn tác vụ" ItemStyle-Wrap="false">
                    <ItemStyle Wrap="false"/>
                    <ItemTemplate>
                        <asp:Button ID="btnSua" runat="server" Text="Sửa" CommandName="Edit"/>
                        <asp:LinkButton ID="btnXoa" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sinh viên này')"
                        runat="server" CommandName="Delete">
                            <i></i>Xóa
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CommandName="Update"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Hủy" CommandName="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#0066cc" ForeColor="#ffffff" />
            <PagerStyle HorizontalAlign="Center" CssClass="pager-style" />
        </asp:GridView>
    </asp:Panel>
     <div class="modal fade" id="modalOpenAddButton" role="dialog">
            <div class="modal-dialog">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">THÊM SINH VIÊN</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-md-2">Mã sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Họ sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtHoSv" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <label class="control-label col-md-2">Tên sinh viên</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Giới tính</label>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rdNam" runat="server" Text="Nam" CssClass="radio-inline" Checked="true"
                                        GroupName="GT" />
                                    <asp:RadioButton ID="rdNu" runat="server" Text="Nữ" CssClass="radio-inline" GroupName="GT" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Ngày sinh</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNgaysinh" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                                </div>
                                <label class="control-label col-md-2">Nơi sinh</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Địa chỉ</label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Chọn khoa</label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlMaKhoa" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2"></label>
                                <div class="col-md-4">
                                    <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" CssClass="btn btn-success" />
                                </div>
                            </div>
                        </div>
                        <div>
                        </div>
                        <asp:ValidationSummary ID="vsKq" runat="server" ForeColor="#FF3300" Font-Size="Medium" />
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>
