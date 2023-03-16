package showM.Dto;

import java.text.DecimalFormat;


public class Dto {
	private int idx;
	private String picture;
	private String title;
	private String contents;
	private int price;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Dto [idx=" + idx + ", picture=" + picture + ", title=" + title + ", contents=" + contents + ", price="
				+ price + "]";
	}
	
	
	
}
