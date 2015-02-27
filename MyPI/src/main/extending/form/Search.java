package main.extending.form;

abstract public class Search {

	protected static ExtendedStorage storage = new ExtendedStorage("");

	private String basicForm;
	private String nickName;
	private String imgUrl;
	private String url;

	public String getBasicForm() {
		return basicForm;
	}

	public void setBasicForm(String basicForm) {
		this.basicForm = basicForm;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public void searchMaterials(String coreMaterial) {
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	};

}
