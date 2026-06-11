package com.wedge.backend.domain.freelancer.repository;

import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FreelancerProfileRepository
        extends JpaRepository<FreelancerProfile, Long>,
        JpaSpecificationExecutor<FreelancerProfile> {
}