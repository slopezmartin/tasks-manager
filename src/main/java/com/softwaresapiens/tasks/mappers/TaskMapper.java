package com.softwaresapiens.tasks.mappers;

import com.softwaresapiens.tasks.domain.dtos.TaskDto;
import com.softwaresapiens.tasks.domain.entities.Task;

public interface TaskMapper {

    Task fromDto(TaskDto taskDto);
    TaskDto toDto(Task task);

}
