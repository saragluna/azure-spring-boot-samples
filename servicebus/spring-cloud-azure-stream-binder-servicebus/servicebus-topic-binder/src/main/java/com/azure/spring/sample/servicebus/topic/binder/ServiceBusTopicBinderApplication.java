// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

package com.azure.spring.sample.servicebus.topic.binder;


import com.azure.spring.messaging.checkpoint.Checkpointer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.Message;
import java.util.function.Consumer;
import static com.azure.spring.messaging.AzureHeaders.CHECKPOINTER;

/**
 * @author Warren Zhu
 */
@SpringBootApplication
public class ServiceBusTopicBinderApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceBusTopicBinderApplication.class, args);
    }

    private static final Logger LOGGER = LoggerFactory.getLogger(ServiceBusTopicBinderApplication.class);

    @Bean
    public Consumer<Message<String>> consume() {
        return message -> {
            Checkpointer checkpointer = (Checkpointer) message.getHeaders().get(CHECKPOINTER);
            LOGGER.info("New message received: '{}'", message.getPayload());
            checkpointer.success()
                    .doOnSuccess(s -> LOGGER.info("Message '{}' successfully checkpointed", message.getPayload()))
                    .doOnError(e -> LOGGER.error("Error found", e))
                    .block();
        };
    }
}

