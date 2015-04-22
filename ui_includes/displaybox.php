<?php 
/**
 * This page contain the UI section of box below breadcrumbs 
 * Can be added when needed will be applied to every page
 * class in the <i> tag gives the icon to the menu item
 * <a> gives the onclick link
 * (c) Cistoner Inc.
 */
?>
<div class="sortable row-fluid">
	<a data-rel="tooltip" title="<?php echo $subscribersCount; ?> subscribers" class="well span3 top-block" href="#">
		<span class="icon32 icon-red icon-user"></span>
		<div>Total Subscribers</div>
		<div><?php echo $subscribersCount; ?></div>
	</a>
	<a data-rel="tooltip" title="<?php echo $sentMailCount; ?> mails sent till date" class="well span3 top-block" href="#">
		<span class="icon32 icon-color icon-cart"></span>
		<div>Mails Sent</div>
		<div><?php echo $sentMailCount; ?></div>
		<span class="notification yellow"><?php echo $sentMailCount; ?><!-- mails sent in last attempt --></span>
	</a>
	<a data-rel="tooltip" title="4 new pro members." class="well span3 top-block" href="#">
		<span class="icon32 icon-color icon-star-on"></span>
		<div>Scheduled mails</div>
		<div>228</div>
		<span class="notification green">4</span>
	</a>
	<a data-rel="tooltip" title="12 new messages." class="well span3 top-block" href="#">
		<span class="icon32 icon-color icon-envelope-closed"></span>
		<div>Queries</div>
		<div>25</div>
		<span class="notification red">12</span>
	</a>
</div>