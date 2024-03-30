/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class review {

    private int reviewId;
    private int productId;
    private int CusId;
    private String comment;
    private int star;
    private String time_rv;
    private String nameProduct;
    private String nameCustomer;

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public review() {
    }

    public review(int reviewId, int productId, int CusId, String comment, int star, String time_rv) {
        this.reviewId = reviewId;
        this.productId = productId;
        this.CusId = CusId;
        this.comment = comment;
        this.star = star;
        this.time_rv = time_rv;
    }

    public String getTime_rv() {
        return time_rv;
    }

    public void setTime_rv(String time_rv) {
        this.time_rv = time_rv;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCusId() {
        return CusId;
    }

    public void setCusId(int CusId) {
        this.CusId = CusId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

}
