package com.softwaresapiens.tasks.mappers;

import com.softwaresapiens.tasks.domain.dtos.TaskListDto;
import com.softwaresapiens.tasks.domain.entities.TaskList;

public interface TaskListMapper {
    TaskList fromDto(TaskListDto dto);
    TaskListDto toDto(TaskList taskList);
}
