package net.dao;

import java.util.List;

import net.entity.Category;

public interface CategoryDao {
	public boolean saveCategory(Category c);
	public boolean updateCategory(Category c);
	public boolean deleteCategory(String id);
	public List<Category> getCategoryDetails();
	public Category searchCategoryByName(String name);
	public String generateCategoryCode();
}
