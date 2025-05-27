package com.softwaresapiens.tasks.domain.dtos;

import com.softwaresapiens.tasks.domain.entities.TaskPriority;
import com.softwaresapiens.tasks.domain.entities.TaskStatus;

import java.time.LocalDateTime;
import java.util.UUID;

public record TaskDto(UUID id, String title, String description, LocalDateTime dueDate, TaskStatus status, TaskPriority priority ) {}
