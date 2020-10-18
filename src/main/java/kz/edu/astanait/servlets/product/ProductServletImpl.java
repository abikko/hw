package kz.edu.astanait.servlets.product;

import javax.servlet.http.HttpServletRequest;

public interface ProductServletImpl {
    public void getList();

    public void onButtonClick(HttpServletRequest request);

}
