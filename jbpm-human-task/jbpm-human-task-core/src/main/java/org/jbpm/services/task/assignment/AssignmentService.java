/*
 * Copyright 2017 Red Hat, Inc. and/or its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.jbpm.services.task.assignment;

import org.kie.api.task.TaskContext;
import org.kie.api.task.model.Task;

public interface AssignmentService {
    void setEnabled(boolean enabled);

    boolean isEnabled();

    void assignTask(Task task, TaskContext context);
    
    void assignTask(Task task, TaskContext context, String excludedUser);
    
    void onTaskDone(Task task, TaskContext context);



}
