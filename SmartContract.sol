// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title TodoList
 * @dev A decentralized task management system where users can create and manage their personal todo lists
 */
contract TodoList {
    
    // Task structure definition
    struct Task {
        string description;
        bool completed;
        uint256 timestamp;
    }
    
    // Mapping from user address to their array of tasks
    mapping(address => Task[]) private userTasks;
    
    // Events for tracking task operations
    event TaskCreated(address indexed owner, uint256 indexed taskId, string description);
    event TaskStatusUpdated(address indexed owner, uint256 indexed taskId, bool isCompleted);
    
    /**
     * @dev Creates a new task for the caller
     * @param _description The description of the task to be created
     */
    function addTask(string calldata _description) external {
        require(bytes(_description).length > 0, "Task description cannot be empty");
        
        Task memory newTask = Task({
            description: _description,
            completed: false,
            timestamp: block.timestamp
        });
        
        userTasks[msg.sender].push(newTask);
        
        uint256 taskId = userTasks[msg.sender].length - 1;
        emit TaskCreated(msg.sender, taskId, _description);
    }
    
    /**
     * @dev Toggles the completion status of a task
     * @param _index The index of the task to toggle
     */
    function toggleTask(uint256 _index) external {
        Task[] storage senderTasks = userTasks[msg.sender];
        require(_index < senderTasks.length, "Task index out of bounds");
        
        senderTasks[_index].completed = !senderTasks[_index].completed;
        
        emit TaskStatusUpdated(msg.sender, _index, senderTasks[_index].completed);
    }
    
    /**
     * @dev Returns the total number of tasks for a specific user
     * @param _user The address of the user
     * @return The count of tasks
     */
    function getTaskCount(address _user) external view returns (uint256) {
        return userTasks[_user].length;
    }
    
    /**
     * @dev Retrieves the details of a specific task
     * @param _user The address of the task owner
     * @param _index The index of the task
     * @return description The task description
     * @return completed The completion status
     * @return timestamp The creation timestamp
     */
    function getTask(address _user, uint256 _index) 
        external 
        view 
        returns (
            string memory description, 
            bool completed, 
            uint256 timestamp
        ) 
    {
        require(_index < userTasks[_user].length, "Task index out of bounds");
        
        Task storage task = userTasks[_user][_index];
        return (task.description, task.completed, task.timestamp);
    }
    
    /**
     * @dev Returns all tasks for a specific user
     * @param _user The address of the user
     * @return An array of all tasks belonging to the user
     */
    function getAllTasks(address _user) external view returns (Task[] memory) {
        return userTasks[_user];
    }
}