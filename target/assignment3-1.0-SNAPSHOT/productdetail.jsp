<%@ page import="kz.edu.astanait.http.DatabaseHolder" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.sql.*" %>
<%@ page import="kz.edu.astanait.servlets.product.ProductModel" %>
<%@ page import="java.util.ArrayList" %><%--
    Copyright(c) 2020.
    Zhetes Abylaykhan, zhetesoft@gmail.com
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<ProductModel> list = new ArrayList<ProductModel>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
        try (Connection conn = DriverManager.getConnection(DatabaseHolder.URL,
                DatabaseHolder.USERNAME, DatabaseHolder.PASSWORD)) {

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM ProductModels");
            while (resultSet.next()) {
                String firstName = resultSet.getNString(1);
                String lastName = resultSet.getNString(2);
                String username = resultSet.getNString(3);
                String password = resultSet.getNString(4);
                String address = resultSet.getNString(5);
                String contact = resultSet.getNString(6);
                ProductModel productModel = new ProductModel();
                productModel.setFirstName(firstName);
                productModel.setLastName(lastName);
                productModel.setUsername(username);
                productModel.setPassword(password);
                productModel.setAddress(address);
                productModel.setContact(contact);

                list.add(productModel);
            }
        }
    } catch (Exception ex) {
        System.out.println(ex);
    }

    for (ProductModel model : list){
        response.getWriter().println(
                "FName:" + model.getFirstName() +
                        "LName:" + model.getLastName()+
                        "UName:" + model.getUsername()+
                        "Password:" + model.getPassword()+
                        "Address:" + model.getAddress()+
                        "Contact:" + model.getContact()
        );
    }
%>
</body>
</html>
