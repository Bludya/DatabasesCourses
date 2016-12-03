package com.softuni.exercises.services;

import com.softuni.exercises.entities.WizardDeposit;
import com.softuni.exercises.repositories.WizardDepositRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bludya on 12/3/16.
 * All rights reserved!
 */

@Service
public class WizardDepositServiceImpl implements WizardDepositService {
    private final WizardDepositRepository wizardDepositRepository;

    @Autowired
    public WizardDepositServiceImpl(WizardDepositRepository wizardDepositRepository) {
        this.wizardDepositRepository = wizardDepositRepository;
    }

    @Override
    public void persist(WizardDeposit wizardDeposit) {
        this.wizardDepositRepository.saveAndFlush(wizardDeposit);
    }
}
