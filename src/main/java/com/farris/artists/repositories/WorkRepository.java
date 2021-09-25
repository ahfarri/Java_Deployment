package com.farris.artists.repositories;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.farris.artists.models.Work;


public interface WorkRepository extends CrudRepository<Work, Long> {
	
	List<Work> findAll(Sort sort);
	
	List<Work> findByNameContaining(String work);

	
}
