package com.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.dao.GoodsDao;
import com.dao.impl.GoodsDaoImpl;
import com.models.Goods;
import com.untils.Contast;

public class GoodsAction {		
	private int id;
	private String name;//
	private String picture;//
	private int price;//
	private String details;//
	
	private int total;//
	private int sales;//
	private int tid;//
	
	public File pic;
	public String pictureContentType;
	public String picFileName;
	public List<Goods> list = new ArrayList<Goods>();
	
	private int pageNum;
	private int allPageNum;
	private int searchNum;
	private List<Goods> goodss;
	
	private Goods goods;
	private GoodsDao goodsdao= new GoodsDaoImpl();

	void savePicture() throws IOException
	{	
		File saved = new File(Contast.myPath,picFileName);
		InputStream ins = null;
		OutputStream ous = null;
		try{
			saved.getParentFile().mkdirs();			
			ins = new FileInputStream(pic);
			ous = new FileOutputStream(saved);
			
			byte[] b = new byte[1024];
			int len = 0;
			while((len = ins.read(b))!=-1)
			{
				ous.write(b, 0, len);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			if(ous!=null) ous.close();
			if(ins!=null) ins.close();
		}
	}
	
	void deletePicture(String name)
	{
		File delete = new File(Contast.myPath,name);
		delete.delete();
	}
	
	public String add() throws IOException{		//
		goods = new Goods();
		//goods.setId(id);
		goods.setName(name);
		Random r = new Random();
		picFileName=r.nextLong()*10000+picFileName;
		savePicture();
		picFileName="/images/"+picFileName;
		picture=picFileName;
		goods.setPicture(picture);
		goods.setPrice(price);
		list = goodsdao.listGoods(allPageNum);
		goods.setDetails(details);
		
		goods.setTotal(total);
		goods.setSales(sales);
		goods.setTid(tid);
		boolean n = goodsdao.addGoods(goods);
//System.out.println("In add()...."+name+"   "+id);
		if(n){
			return "Success";
			}
		  return "Failure";
	}
	
	public String list(){        //
		if(searchNum>0){
			pageNum = searchNum-1;
		}
		goodss = goodsdao.listGoods(pageNum);
//System.out.print("in the list()...."+users.size());
		allPageNum = goodsdao.calculateAllNum();
//System.out.println(goodss.get(0).getPicture());
		return "list";
	}
	
	public String list1(){        //
		
		goodss = goodsdao.selectAll();
		return "list";
	}
	
	public String selectOne(){		//
		goods = goodsdao.selectOneGoods(id);
		name = goods.getName();
		picture = goods.getPicture();
		price = goods.getPrice();
		list = goodsdao.listGoods(allPageNum);
		details = goods.getDetails();
		
		total= goods.getTotal();
		sales = goods.getSales();
		tid = goods.getTid();
		return "modify";
	}
	
	
	public String modify() throws IOException{        //
		goods = new Goods();
//System.out.println("in the modify()..."+name);
		goods.setId(id);
		goods.setName(name);
		Random r = new Random();
		picFileName=r.nextLong()*10000+picFileName;
		savePicture();
		picFileName="/images/"+picFileName;
		picture=picFileName;
System.out.println("in the modify()..."+picture);
		//goods.setPicture(picture);
		goods.setPrice(price);
		goods.setDetails(details);
		goods.setTotal(total);
		goods.setSales(sales);
		goods.setTid(tid);
		boolean n = goodsdao.modifyOneGoods(goods);
		if(n){
			return  "Success";
		}else{
		    return "modify";
		}
	}
	
	
	public String deleteGoods(){	//
		goods = goodsdao.selectOneGoods(id);
		deletePicture(goods.getPicture());
		boolean isDelete = goodsdao.deteleOneGoods(id);
		list = goodsdao.selectAll();
		if(isDelete)
			return "Success";
		else
			return "Failure";
	}
	
	public int getId() {
System.out.println("in the getid()..."+id);
		return id;
	}
	
	public void setId(int id) {
System.out.println("in the setid()..."+id);
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAllPageNum() {
		return allPageNum;
	}
	public void setAllPageNum(int allPageNum) {
		this.allPageNum = allPageNum;
	}
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	public List<Goods> getGoodss() {
		return goodss;
	}
	public void setGoodss(List<Goods> goodss) {
		this.goodss = goodss;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPictureContentType() {
		return pictureContentType;
	}

	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public List<Goods> getList() {
		return list;
	}
	public void setList(List<Goods> list) {
		this.list = list;
	}
	public GoodsDao getGoodsdao() {
		return goodsdao;
	}
	public void setGoodsdao(GoodsDao goodsdao) {
		this.goodsdao = goodsdao;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	
}
