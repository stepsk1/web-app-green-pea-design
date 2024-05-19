package com.example.model;

public class Project
{
    private int id;
    private String title;
    private String category;
    private String 	description;
    private double price;
    private String image;

    public Project()
    {
    }

    public Project( String title, String category, String description, double price, String image)
    {
        this.title = title;
        this.category = category;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public Project(int id, String title, String category, String description, double price, String image)
    {
        this.id = id;
        this.title = title;
        this.category = category;
        this.description = description;
        this.price = price;
        this.image = image;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getCategory()
    {
        return category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public double getPrice()
    {
        return price;
    }

    public void setPrice(double price)
    {
        this.price = price;
    }

    public String getImage()
    {
        return image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    @Override
    public String toString()
    {
        return "Project{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}