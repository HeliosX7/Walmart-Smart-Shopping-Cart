package com.horizon.hr_cart.hrcart.hr_cart;

public class Item {
    Integer units;
    Integer price;
    Float weight;
    String itemname;

    public Item(){}

    public Item(Integer units, Integer price, Float weight, String itemname) {
        this.units = units;
        this.price = price;
        this.weight = weight;
        this.itemname = itemname;
    }

    public Integer getUnits() {
        return units;
    }

    public Integer getPrice() {
        return price;
    }

    public Float getWeight() {
        return weight;
    }

    public String getItemname() {
        return itemname;
    }
}
