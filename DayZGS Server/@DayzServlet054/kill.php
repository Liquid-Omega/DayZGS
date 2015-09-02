<?php
file_put_contents('saves/'.$_GET['uid'].'.json', file_get_contents('php://input'), LOCK_EX);