package com.softuni.exercises;

import com.softuni.exercises.entities.WizardDeposit;
import com.softuni.exercises.services.WizardDepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Calendar;

@Component
public class Bash implements CommandLineRunner {
    private final WizardDepositService wizardDepositoryService;

    @Autowired
    public Bash(WizardDepositService wizardDepositoryService) {
        this.wizardDepositoryService = wizardDepositoryService;
    }

    @Override
    public void run(String... strings) throws Exception {
        WizardDeposit dumbledore = new WizardDeposit();
        dumbledore.setFirstName("Albus");
        dumbledore.setLastName("Dumbledore");
        dumbledore.setAge(150);
        dumbledore.setMagicWandCreator("Antoich peverell");
        dumbledore.setMagicWandSize(15);
        Calendar calendar = Calendar.getInstance();
        calendar.set(2016, 10, 20);
        dumbledore.setDepositStartDate(calendar.getTime());
        calendar.set(2020, 10, 20);
        dumbledore.setDepositExpirationDate(calendar.getTime());
        dumbledore.setDepositAmount(2000.24);
        dumbledore.setDepositCharge(0.2);
        dumbledore.setDepositExpired(false);

        this.wizardDepositoryService.persist(dumbledore);
    }
}
