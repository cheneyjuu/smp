package com.sowosky.smp.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.sowosky.smp.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
