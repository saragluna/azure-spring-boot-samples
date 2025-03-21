// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

package com.azure.spring.sample.jms.queue;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jms.annotation.EnableJms;

@SpringBootApplication
@EnableJms
public class ServiceBusJmsDlqQueueApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceBusJmsDlqQueueApplication.class, args);
    }
}
