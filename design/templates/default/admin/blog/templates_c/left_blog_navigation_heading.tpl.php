<?php /* Smarty version 2.6.18, created on 2012-09-05 03:36:29
         compiled from left_blog_navigation_heading.tpl */ ?>
    <ul class="clsModuleHeading">
    	<li <?php if ($this->_tpl_vars['CFG']['site']['is_module_page'] == 'blog'): ?>class="clsActiveModuleLink" <?php else: ?> class="clsInActiveModuleLink"<?php endif; ?>>
    		<a href="<?php echo $this->_tpl_vars['CFG']['site']['url']; ?>
admin/blog/postManage.php"><?php echo $this->_tpl_vars['LANG']['admin_header_blog_management_links']; ?>
</a>
   		 </li>
   </ul>