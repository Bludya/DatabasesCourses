package com.softuni.exercises.repositories;

import com.softuni.exercises.entities.WizardDeposit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by bludya on 12/3/16.
 * All rights reserved!
 */

@Repository
@Transactional
public interface WizardDepositRepository extends JpaRepository<WizardDeposit, Long> {
}
