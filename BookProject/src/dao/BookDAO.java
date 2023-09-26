package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.BookDTO;

public class BookDAO extends JDBConnect {
	List<BookDTO> booklist = new ArrayList<BookDTO>();
}
