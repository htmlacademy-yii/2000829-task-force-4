<?php
require_once 'Task.php';

$task = new Task($current_id, $current_status);

assert($task->getNewStatus('cancelled') == Task::STATUS_CANCEL, 'cancel');
