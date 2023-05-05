package com.eeit138.webshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eeit138.webshop.model.Post;


@Repository // Jpa是一個標準規範/標準化/查詢能力/容器級特性的支持
public interface PostRepository extends JpaRepository<Post, Integer> {

//	List<Post> getDesignation(String posttitle);

//	List<Post> findAll(String posttitle);

	

//	Optional<Post> findById(Integer id);
//
//	Post findOne(int id);
//
//	void delete(int id);

//	public Post findFirstByOrderByAddedDesc();

}
