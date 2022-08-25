<?php
require_once 'classes/Task.php';

$task = new Task(1, null, 'new');

assert($task->getNewStatus(Task::ACTION_CANCEL) === Task::STATUS_CANCEL, 'cancel');
