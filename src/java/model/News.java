/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nobod
 */
public class News {
    private int newsId;
    private String title;
    private String description;
    private int newsGroupId;
    private String heading;
    private String image;
    private int createdby;
    private String createdOn;
    private int modifiedBy;
    private String modifiedOn;
    private String firstName;
    private String lastName;
    private int newGroupId;
    private String newGroupname;
    

    public News() {
    }

    public News(int newsId, String title, String description, int newsGroupId, String heading, String image, int createdby, String createdOn, int modifiedBy, String modifiedOn, String firstName, String lastName, int newGroupId, String newGroupname) {
        this.newsId = newsId;
        this.title = title;
        this.description = description;
        this.newsGroupId = newsGroupId;
        this.heading = heading;
        this.image = image;
        this.createdby = createdby;
        this.createdOn = createdOn;
        this.modifiedBy = modifiedBy;
        this.modifiedOn = modifiedOn;
        this.firstName = firstName;
        this.lastName = lastName;
        this.newGroupId = newGroupId;
        this.newGroupname = newGroupname;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNewsGroupId() {
        return newsGroupId;
    }

    public void setNewsGroupId(int newsGroupId) {
        this.newsGroupId = newsGroupId;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCreatedby() {
        return createdby;
    }

    public void setCreatedby(int createdby) {
        this.createdby = createdby;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }

    public int getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getModifiedOn() {
        return modifiedOn;
    }

    public void setModifiedOn(String modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getNewGroupId() {
        return newGroupId;
    }

    public void setNewGroupId(int newGroupId) {
        this.newGroupId = newGroupId;
    }

    public String getNewGroupname() {
        return newGroupname;
    }

    public void setNewGroupname(String newGroupname) {
        this.newGroupname = newGroupname;
    }

    
    
}
