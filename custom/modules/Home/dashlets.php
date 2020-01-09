<?php 
$defaultDashlets =array (
  'MessageDashlet' => 'Home',
  'MyCallsDashlet' => 'Calls',
  'MyMeetingsDashlet' => 'Meetings',
  'MyOpportunitiesDashlet' => 'Opportunities',
  'MyAccountsDashlet' => 'Accounts',
  'MyLeadsDashlet' => 'Leads',
);
$defaultDashlets = array_reverse($defaultDashlets, true);
unset($defaultDashlets);
$defaultDashlets['MyLeadsDashlet'] = 'Leads';
$defaultDashlets['MyAccountsDashlet'] = 'Accounts';