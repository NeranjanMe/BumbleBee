package net.dao;

import java.util.List;

import net.entity.Item;

public interface ItemDao {
	public boolean saveItem(Item i) throws ClassNotFoundException;
	public boolean updateItem(Item i) throws ClassNotFoundException;
	public boolean deleteItem(String itemId) throws ClassNotFoundException;
	public List<Item> getAllItems();
	public Item searchItem(String id);
	public String generateItemCode();
}
