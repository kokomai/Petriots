package com.teamp.petriots.pst_profile.dto;

public class Pst_profileDTO
{
   // 프로필 등록번호, 펫시터 번호, 체크인시작시간, 끝시간, 체크아웃시작시간, 끝시간
   private String p_s_p_num, p_s_num, checkin_start, checkin_end, checkout_start, checkout_end;
   // 이력사항, 소개, 유저 이미지, 건물
   private String records, introduce, profile_img, b_type;
   // 금액, 위탁 가능 개체, 건물 유형
   private int price, max_sitable, b_type_num;
   // 각종 서비스 제공 유무
   private int beauty, walk, snack, other_animal, family, kids, garden, pick_up, medication;
   // 펫시터 사진
   private String pst_img1, pst_img2, pst_img3, pst_img4, pst_img5;
   // 펫시팅 횟수 
   private int count;
   
   // 유저 넘버 // 닉네임 / 주소 / 예약요청번호
   private String user_num, nickName, address, r_a_num;

   // 블랙리스트 등록 날짜
   private String isudate;

   // 펫 이름
   private String name;

   // 퀘스트 목록QUEST_NUM, LINK, Q_NAME, CONDITION
   private String quest_num, q_link, q_name, q_condition, q_use;
   // 우편번호, 상세주소
   private String zipcode, addrdetails;
   
  // 위경도 좌표
  private double addrLat, addrLong, distance;
  
  private String checkFavorite;
  
  public String getCheckFavorite()
{
   return checkFavorite;
}

public void setCheckFavorite(String checkFavorite)
{
   this.checkFavorite = checkFavorite;
}

private String pet_img;
   
   public String getPet_img()
{
   return pet_img;
}

public void setPet_img(String pet_img)
{
   this.pet_img = pet_img;
}

public String getZipcode()
{
   return zipcode;
}

public void setZipcode(String zipcode)
{
   this.zipcode = zipcode;
}

public String getAddrdetails()
{
   return addrdetails;
}

public void setAddrdetails(String addrdetails)
{
   this.addrdetails = addrdetails;
}

public double getAddrLat()
{
   return addrLat;
}

public void setAddrLat(double addrLat)
{
   this.addrLat = addrLat;
}

public double getAddrLong()
{
   return addrLong;
}

public void setAddrLong(double addrLong)
{
   this.addrLong = addrLong;
}

// g / s
   public String getQ_use()
   {
      return q_use;
   }
   
   public void setQ_use(String q_use)
   {
      this.q_use = q_use;
   }
   
   public String getQuest_num()
   {
   return quest_num;
   }

   public void setQuest_num(String quest_num)
   {
      this.quest_num = quest_num;
   }
   
   public String getQ_link()
   {
      return q_link;
   }
   
   public void setQ_link(String q_link)
   {
      this.q_link = q_link;
   }
   
   public String getQ_name()
   {
      return q_name;
   }
   
   public void setQ_name(String q_name)
   {
      this.q_name = q_name;
   }
   
   public String getQ_condition()
   {
      return q_condition;
   }
   
   public void setQ_condition(String q_condition)
   {
      this.q_condition = q_condition;
   }
   
   public String getP_s_p_num()
   {
      return p_s_p_num;
   }

   public void setP_s_p_num(String p_s_p_num)
   {
      this.p_s_p_num = p_s_p_num;
   }

   public String getP_s_num()
   {
      return p_s_num;
   }

   public void setP_s_num(String p_s_num)
   {
      this.p_s_num = p_s_num;
   }

   public String getCheckin_start()
   {
      return checkin_start;
   }

   public void setCheckin_start(String checkin_start)
   {
      this.checkin_start = checkin_start;
   }

   public String getCheckin_end()
   {
      return checkin_end;
   }

   public void setCheckin_end(String checkin_end)
   {
      this.checkin_end = checkin_end;
   }

   public String getCheckout_start()
   {
      return checkout_start;
   }

   public void setCheckout_start(String checkout_start)
   {
      this.checkout_start = checkout_start;
   }

   public String getCheckout_end()
   {
      return checkout_end;
   }

   public void setCheckout_end(String checkout_end)
   {
      this.checkout_end = checkout_end;
   }

   public String getRecords()
   {
      return records;
   }

   public void setRecords(String records)
   {
      this.records = records;
   }

   public String getIntroduce()
   {
      return introduce;
   }

   public void setIntroduce(String introduce)
   {
      this.introduce = introduce;
   }

   public int getPrice()
   {
      return price;
   }

   public void setPrice(int price)
   {
      this.price = price;
   }

   public int getMax_sitable()
   {
      return max_sitable;
   }

   public void setMax_sitable(int max_sitable)
   {
      this.max_sitable = max_sitable;
   }

   public int getB_type_num()
   {
      return b_type_num;
   }

   public void setB_type_num(int b_type_num)
   {
      this.b_type_num = b_type_num;
   }

   public int getBeauty()
   {
      return beauty;
   }

   public void setBeauty(int beauty)
   {
      this.beauty = beauty;
   }

   public int getWalk()
   {
      return walk;
   }

   public void setWalk(int walk)
   {
      this.walk = walk;
   }

   public int getSnack()
   {
      return snack;
   }

   public void setSnack(int snack)
   {
      this.snack = snack;
   }

   public int getOther_animal()
   {
      return other_animal;
   }

   public void setOther_animal(int other_animal)
   {
      this.other_animal = other_animal;
   }

   public int getFamily()
   {
      return family;
   }

   public void setFamily(int family)
   {
      this.family = family;
   }

   public int getKids()
   {
      return kids;
   }

   public void setKids(int kids)
   {
      this.kids = kids;
   }

   public int getGarden()
   {
      return garden;
   }

   public void setGarden(int garden)
   {
      this.garden = garden;
   }

   public int getPick_up()
   {
      return pick_up;
   }

   public void setPick_up(int pick_up)
   {
      this.pick_up = pick_up;
   }

   public int getMedication()
   {
      return medication;
   }

   public void setMedication(int medication)
   {
      this.medication = medication;
   }

   public String getPst_img1()
   {
      return pst_img1;
   }

   public void setPst_img1(String pst_img1)
   {
      this.pst_img1 = pst_img1;
   }

   public String getPst_img2()
   {
      return pst_img2;
   }

   public void setPst_img2(String pst_img2)
   {
      this.pst_img2 = pst_img2;
   }

   public String getPst_img3()
   {
      return pst_img3;
   }

   public void setPst_img3(String pst_img3)
   {
      this.pst_img3 = pst_img3;
   }

   public String getPst_img4()
   {
      return pst_img4;
   }

   public void setPst_img4(String pst_img4)
   {
      this.pst_img4 = pst_img4;
   }

   public String getPst_img5()
   {
      return pst_img5;
   }

   public void setPst_img5(String pst_img5)
   {
      this.pst_img5 = pst_img5;
   }

   public int getCount()
   {
      return count;
   }

   public void setCount(int count)
   {
      this.count = count;
   }

   public String getUser_num()
   {
      return user_num;
   }

   public void setUser_num(String user_num)
   {
      this.user_num = user_num;
   }

   public String getNickName()
   {
      return nickName;
   }

   public void setNickName(String nickName)
   {
      this.nickName = nickName;
   }

   public String getAddress()
   {
      return address;
   }

   public void setAddress(String address)
   {
      this.address = address;
   }

   public String getName()
   {
      return name;
   }

   public void setName(String name)
   {
      this.name = name;
   }
   
   
   public String getIsudate()
   {
      return isudate;
   }
   
   public void setIsudate(String isudate)
   {
      this.isudate = isudate;
   }
    
   public String getProfile_img()
   {
      return profile_img;
   }

   public void setProfile_img(String profile_img)
   {
      this.profile_img = profile_img;
   }

   public String getB_type()
   {
      return b_type;
   }

   public void setB_type(String b_type)
   {
      this.b_type = b_type;
   }

public String getR_a_num()
{
   return r_a_num;
}

public void setR_a_num(String r_a_num)
{
   this.r_a_num = r_a_num;
}

public double getDistance()
{
   return distance;
}

public void setDistance(double distance)
{
   this.distance = distance;
}

   
}