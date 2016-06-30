package com.demo.backstage.doman;

import java.util.List;

public class Tree {
	private Integer id;//绑定节点的标识值。
	private String text;//显示的节点文本。
	private String iconCls;//显示的节点图标CSS类ID。
	private Boolean checked;//该节点是否被选中。
	private List<Tree> children;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public List<Tree> getChildren() {
		return children;
	}
	public void setChildren(List<Tree> children) {
		this.children = children;
	}
	
	
}
