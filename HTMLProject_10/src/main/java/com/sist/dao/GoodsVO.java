package com.sist.dao;
/*
   NO                                        NOT NULL NUMBER
   GOODS_NAME                                NOT NULL VARCHAR2(1000)
   GOODS_SUB                                          VARCHAR2(1000)
   GOODS_PRICE                               NOT NULL VARCHAR2(50)
   GOODS_DISCOUNT                                     NUMBER
   GOODS_FIRST_PRICE                                  VARCHAR2(20)
   GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
   GOODS_POSTER                                       VARCHAR2(260)
   HIT                                                NUMBER
   
   MyBatis / JPA => vo변수명과 컬럼명을 맞춰줘야한다 오라클은 상관없다함!
   맞춰줘야하는이유 : getter/setter 때문에
*/
public class GoodsVO {
   private int no,discount,hit;
   private String name,sub,price,fprice,delivery,poster;
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public int getDiscount() {
      return discount;
   }
   public void setDiscount(int discount) {
      this.discount = discount;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getSub() {
      return sub;
   }
   public void setSub(String sub) {
      this.sub = sub;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public String getFprice() {
      return fprice;
   }
   public void setFprice(String fprice) {
      this.fprice = fprice;
   }
   public String getDelivery() {
      return delivery;
   }
   public void setDelivery(String delivery) {
      this.delivery = delivery;
   }
   public String getPoster() {
      return poster;
   }
   public void setPoster(String poster) {
      this.poster = poster;
   }
   
}