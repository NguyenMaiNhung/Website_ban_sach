package sort;

import java.util.Comparator;

import model.Book;

public class sort implements Comparator<Book>{
	@Override
	public int compare(Book a, Book b) {
		int tmp = a.getId() - b.getId();
		return tmp;
	}
}
