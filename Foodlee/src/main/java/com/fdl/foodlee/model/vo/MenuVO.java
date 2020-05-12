package com.fdl.foodlee.model.vo;

public class MenuVO {
	private int menuId;
	private int sellerId;
	private String menuName;
	private String menuType;
	private int menuPrice;
	private String menuPic;
	private String menuInfor;
	private String rawMaterials;

	//
	static int mnId = 0;

	public MenuVO() {}

	public MenuVO(int sellerId, String menuName, String menuType, int menuPrice, String menuPic, String menuInfor,
			String rawMaterials) {
		this(++mnId, sellerId, menuName, menuType, menuPrice, menuPic, menuInfor, rawMaterials);
	}

	public MenuVO(int menuId, int sellerId, String menuName, String menuType, int menuPrice, String menuPic,
			String menuInfor, String rawMaterials) {
		super();
		this.menuId = menuId;
		this.sellerId = sellerId;
		this.menuName = menuName;
		this.menuType = menuType;
		this.menuPrice = menuPrice;
		this.menuPic = menuPic;
		this.menuInfor = menuInfor;
		this.rawMaterials = rawMaterials;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuPic() {
		return menuPic;
	}

	public void setMenuPic(String menuPic) {
		this.menuPic = menuPic;
	}

	public String getMenuInfor() {
		return menuInfor;
	}

	public void setMenuInfor(String menuInfor) {
		this.menuInfor = menuInfor;
	}

	public String getRawMaterials() {
		return rawMaterials;
	}

	public void setRawMaterials(String rawMaterials) {
		this.rawMaterials = rawMaterials;
	}

	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + "sellerId=" + sellerId + ", menuName=" + menuName + ", menuType=" + menuType
				+ ", menuPrice=" + menuPrice + ", menuPic=" + menuPic + ", menuInfor=" + menuInfor + ", rawMaterials="
				+ rawMaterials + "]";
	}

}
