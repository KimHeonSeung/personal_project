package khs.model;

import java.util.*;
import java.text.*;

public class ArticleList {
	
	private int article_id;
	
	private int board_id;
	
	
	
	
	public ArticleList() {}
	
	public ArticleList(int board_id, String board_name) {
		super();
		this.board_id = board_id;
		this.board_name = board_name;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	
	
	
}
	
