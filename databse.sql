-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2014 at 11:59 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `supergeeks`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0'),
(2, 'Freeform_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '4.1.8'),
(3, 'Nsm_morphine_theme_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '2.0.4'),
(4, 'Matrix_multi_upload_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.1.1');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(27, 'Matrix_multi_upload_mcp', 'upload', 1),
(5, 'Email', 'send_email', 0),
(6, 'Search', 'do_search', 0),
(7, 'Channel', 'submit_entry', 0),
(8, 'Channel', 'filemanager_endpoint', 0),
(9, 'Channel', 'smiley_pop', 0),
(10, 'Channel', 'combo_loader', 0),
(11, 'Member', 'registration_form', 0),
(12, 'Member', 'register_member', 0),
(13, 'Member', 'activate_member', 0),
(14, 'Member', 'member_login', 0),
(15, 'Member', 'member_logout', 0),
(16, 'Member', 'send_reset_token', 0),
(17, 'Member', 'process_reset_password', 0),
(18, 'Member', 'send_member_email', 0),
(19, 'Member', 'update_un_pw', 0),
(20, 'Member', 'member_search', 0),
(21, 'Member', 'member_delete', 0),
(22, 'Rte', 'get_js', 0),
(23, 'Mailinglist', 'insert_new_email', 0),
(24, 'Mailinglist', 'authorize_email', 0),
(25, 'Mailinglist', 'unsubscribe', 0),
(26, 'Freeform', 'save_form', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'pages', 'Pages', 'http://www.supergeeks.com.ng/', '', 'en', 11, 0, 1406145780, 0, '', 1, 'open', 1, 2, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, '', 'y', '', 'n', 10, '', '', 4),
(3, 1, 'home_banners', 'Home Banners', 'http://www.supergeeks.com.ng/', '', 'en', 1, 0, 1406147040, 0, '', 1, 'open', 2, 3, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, '', 'y', '', 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`) VALUES
(1, 1, 1, '<div class="main row">\n<h1 class="page-header">Contact</h1>\n\n<div class="row">\n<div class="medium-6 column">\n<h4 class="sub-head">You can swing by our office at any time&nbsp;for diagnostics, repairs, fixing, consultation or just for a chat&nbsp;from</h4>\n\n<h4 class="sub-head">Mondays - Saturdays;&nbsp;<span style="line-height: 1.2em;">8am - 5pm.</span></h4>\n\n<p>1 Victoria Ariobike Street (Along Admiralty Way), by Ebeano Supermarket, Lekki Phase 1, Lagos.</p>\n</div>\n\n<div class="medium-6 column">\n<h5 class="sub-head">For pickups, drop-offs &amp; general enquiries, call us on</h5>\n\n<h4 class="sub-head">0815 092 GEEK (4335)</h4>\n\n<h4 class="sub-head">0815 097 GEEK (5335)</h4>\n\n<h4 class="sub-head">0815 096 GEEK (4335)</h4>\n\n<h4 class="sub-head">0815 066 GEEK (4335)</h4>\n</div>\n</div>\n\n<div class="row">\n<div class="map-canvas" id="map_canvas">&nbsp;</div>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(8, 1, 1, '<div class="main row">\n<h1 class="page-header">About</h1>\n\n<h4 class="sub-head">SuperGeeks Nigeria SuperGeeks is an after sales device repair and service chain, and the leading providers of after sales technical support to customers within the Lagos metropolis, with focus on customer service.</h4>\n\n<div class="row">\n<div class="medium-8 column"><img alt="SuperGeeks Customer story" src="/assets/img/Supergeeks-about-display-1.jpg" /></div>\n\n<div class="medium-4 column">\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>In the beginning, we longed for an environment, where technical support, repairs and maintenance of consumer electronics were simple, hassle and stress free, and most importantly, done with expertise and attention to detail, but it just wasn&rsquo;t existing at the time.</p>\n</div>\n</div>\n\n<div class="row">\n<div class="medium-6 large-7 column">\n<p>We set out to create a solution that was not only simple, hassle and stress free, but comes with a great customer experience.</p>\n\n<p>We know our client use their devices and electronics for work and leisure, and place so much importance on the effectiveness and efficiency of those devices. We focus on providing after sales and technical support to our clients to maintain their devices working at 100%.</p>\n\n<p>Our principle hinges on quality service delivery and customer satisfaction. Our strength lies in our expertise and know-how in fixing, servicing and maintaining a wide range of customer electronics.</p>\n</div>\n\n<div class="medium-6 large-5 column end"><img alt="SuperGeeks Customer Story 2" src="/assets/img/Supergeeks-about-display-2.jpg" /></div>\n\n<div class="medium-12 column">\n<p>Our people are called Geeks; Super ones actually, because of their expertise and know-how and they always take proper care of their own (Your devices). Making your devices and the IT infrastructures you love so much working at 100% is what we always aim for. This is the oath we&rsquo;ve taken and it&rsquo;s what we live by.</p>\n</div>\n\n<div class="medium-12"><img alt="SuperGeeks Customer Story 3" src="/assets/img/Supergeeks-about-display-3.jpg" /></div>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(3, 1, 1, '<div class="main row">\n<h1 class="page-header">Tech Support</h1>\n\n<div>\n<h4 class="sub-head">Have some issues with your devices, or just got that spanking new equipment and don&rsquo;t know how to set it up? Need your computers and devices to always function at optimum capacity or suddenly, your device&nbsp;chose not to work at the point you needed it most?</h4>\n\n<p><strong>SuperGeeks tech support is available 24/7 to help you with that issue and provide support for you, so you can get to full&nbsp;gear in no time.</strong> We are here to help ensure that your devices, computer, Mac, or tablet is always performing like the day you bought it.</p>\n\n<p>Some areas we can help include:</p>\n</div>\n\n<div class="row dPanels collapse">\n<div class="medium-6 column">\n<div class="dPanel">\n<h4 class="dPanel_title">Diagnostics and Troubleshooting</h4>\n\n<div class="dPanel_icon"><img alt="SuperGeeks Diagnosis and Troubleshooting" src="/assets/img/supergeeks-diagnosis-troubleshooting.svg" width="120" /></div>\n\n<p>They say the best way to deal with problems is before they get serious. To&nbsp;ensure your devices and infrastructure are running at optimum levels, we help maintain your devices and equipment.</p>\n\n<p>We run diagnostics and troubleshooting on your electronic device, computer and delicate household appliances as they come up; to prevent a total crash or halt of your devices. We carry out routine checks, make upgrades and find answers to innate problems as they are discovered.</p>\n</div>\n\n<div class="dPanel">\n<h4 class="dPanel_title">Scheduled Health Checks</h4>\n\n<div class="dPanel_icon"><img alt="SuperGeeks Health Checks" src="/assets/img/supergeeks-health-checks.svg" width="120" /></div>\n\n<p>Given growing reliance on computer and information systems to run nearly every home and company operation, the functionality and efficiency of infrastructure is critical&nbsp;and yours is not an exception.</p>\n\n<p>We provide scheduled health checks to make sure your infrastructure is working at an optimum level.</p>\n</div>\n\n<div class="dPanel">\n<h4 class="dPanel_title">Services &amp; Supply Consultation</h4>\n\n<div class="dPanel_icon"><img alt="SuperGeeks Services and Supply Consultation" src="/assets/img/supergeeks-consultation.svg" width="120" /></div>\n\n<p>In our present world of countless brands with almost deafening promises and juicy baits, tech procurement and expert opinion are key to the long-term efficiency of your infrastructure; if not that, you want to make a good bargain when buying. We provide expert advice to help you make those key buying decisions like a geek and even do the procurement for you&nbsp;if it gets to that.</p>\n</div>\n</div>\n\n<div class="medium-6 column">\n<div class="dPanel">\n<h4 class="dPanel_title">Device Installation and Configuration</h4>\n\n<div class="dPanel_icon"><img alt="SuperGeeks Diagnosis and Troubleshooting" src="/assets/img/supergeeks-device-installation.svg" width="120" /></div>\n\n<p>Sure, we know the&nbsp;computer is your&nbsp;unifying device in all spheres. Whether you want to set-up, secure or repair your computer, we&rsquo;ve got the know-how, tools and dedication to get the job done.</p>\n\n<ul>\n <li>Computer Setup</li>\n <li>Computer Tune-up</li>\n <li>Data Backup and Transfer</li>\n <li>Data Recovery</li>\n  <li>Email Setup</li>\n  <li>Hardware Install</li>\n <li>Memory Install</li>\n <li>Operating System Install</li>\n <li>Printer Setup or Troubleshoot</li>\n  <li>Software Install and Setup</li>\n <li>Technology Consultation</li>\n  <li>Training</li>\n <li>Virus Spyware Removal</li>\n  <li>Wireless Networking</li>\n</ul>\n</div>\n\n<div class="dPanel">\n<h4 class="dPanel_title">Emergency Response</h4>\n\n<div class="dPanel_icon"><img alt="SuperGeeks Diagnosis and Troubleshooting" src="/assets/img/supergeeks-emergency-response.svg" width="120" /></div>\n\n<p>Sometimes things (and we mean bad computer things) happen so fast and unexpectedly, that you need prompt and effective response for your IT support needs. SuperGeeks&nbsp;provides emergency support services to clients within the Lagos metropolis. We can come to your office or home if that&#39;s where the work needs us.</p>\n</div>\n</div>\n</div>\n\n<div class="row extra-info">\n<h3>What you get from SuperGeeks Tech Support</h3>\n\n<ul>\n <li><strong>Professional Services - </strong>We take care of your devices, and respect your privacy and security measures. We do only what we&rsquo;re meant to do and don&rsquo;t go snooping around.</li>\n <li><strong>We Take Proper Care of your device - </strong> Treating devices with care is something we pride in. We pamper and take care of your devices as we would treat ours, meaning your device will always remain in the best possible shape. Yes! It might even look cleaner than the time you brought in.</li>\n <li><strong>Genuine Expertise &ndash;</strong> We have a vast knowledge of the things we do. Meaning that you can be rest assured that any advice we give will most likely be the best you could possibly get. Yes, we can brag about that. But in cases where we can&rsquo;t solve your device issues, we will definitely refer you to the right expert sources.</li>\n  <li><strong>Quick Response Time</strong> - Supergeeks is&nbsp;always quick to restore your devices to its initial working state, because we know that your devices are important to you.</li>\n</ul>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(4, 1, 1, '<div class="main row">\n<h1 class="page-header">Fix and Repairs</h1>\n\n<div>\n<h4 class="sub-head">Got a broken screen, your tablet wouldn&rsquo;t come on? Your beloved washing machine seems to be staring at your clothes? We sure can fix it.</h4>\n\n<p><strong>SuperGeeks is a state of the art fix-and-repair shop for gadgets and consumer electronics.</strong> We employ our expertise and use industry standards and manufacturer-recommended parts to see that your devices are back in shape at super quick time with the best quality you can find anywhere.</p>\n</div>\n\n<div class="row product-icons">\n<div class="small-6 medium-3 column"><img alt="" src="/assets/img/phone-tablets.svg" />\n<p>Mobile Phones and Tablets</p>\n</div>\n\n<div class="small-6 medium-3 column"><img alt="" src="/assets/img/laptops.svg" />\n<p>Laptops, Dekstops and Workstations</p>\n</div>\n\n<div class="small-6 medium-3 column"><img alt="" src="/assets/img/audio-visual.svg" />\n<p>Audio Visual Electronics</p>\n</div>\n\n<div class="small-6 medium-3 column"><img alt="" src="/assets/img/home-electronics.svg" />\n<p>Home Appliances</p>\n</div>\n</div>\n\n<div class="row">\n<div class="medium-6 column">\n<h3>Why get your device repaired by SuperGeeks?</h3>\n\n<ul class="lists">\n <li>At SuperGeeks, we pride ourselves in being a certified repair service centre. Unlike road-side repair services, our work is top quality and meets the industry standard.</li>\n <li>We offer free, no-obligation quotes for repairs and servicing.</li>\n <li>We guarantee all our repairs to be free of defects</li>\n <li>All our repairs are tested to manufacturer standards.</li>\n  <li>We use genuine and manufacturer-approved replacement parts.</li>\n</ul>\n</div>\n\n<div class="medium-6 column brands">\n<h3>Brands we fix</h3>\n\n<p><img alt="Apple" src="/assets/img/apple.jpg" width="80" /> <img alt="Blackberry" src="/assets/img/blackberry.jpg" width="80" /> <img alt="HP" src="/assets/img/hp.jpg" width="80" /> <img alt="Dell" src="/assets/img/dell.jpg" width="80" /> <img alt="Samsung" src="/assets/img/samsung.jpg" width="80" /> <img alt="Panasonic" src="/assets/img/panasonic.jpg" width="80" /> <img alt="HTC" src="/assets/img/htc.jpg" width="80" /> <img alt="Motorola" src="/assets/img/motorola.jpg" width="80" /> <img alt="Nokia" src="/assets/img/nokia.jpg" width="80" /> <img alt="Sony" src="/assets/img/sony.jpg" width="80" /> <img alt="Microsoft" src="/assets/img/microsoft.jpg" width="80" /> <img alt="LG Life is good" src="/assets/img/lg.jpg" width="80" /></p>\n</div>\n</div>\n\n<div class="row">\n<div class="medium-6 column">\n<h3>What kind of mobile phone repairs do we carry out?</h3>\n\n<p>We can fix most mobile phone faults and problems, including:</p>\n\n<ul class="lists">\n  <li>Warranty defects.</li>\n  <li><strong>Screen replacement,</strong> e.g. if your screen or digitizer was smashed/stopped responding.</li>\n  <li><strong>Water damage,</strong> e.g. if you&rsquo;ve dropped or had&nbsp;liquid splashed on your phone, however most water damage is beyond repair.</li>\n <li><strong>Broken casings,</strong> e.g. if you&rsquo;ve dropped your phone.</li>\n  <li><strong>Non-working handsets,</strong> e.g. battery or charging/power issues.</li>\n  <li><strong>Software fixes,</strong> e.g. upgrades and factory reset.</li>\n  <li><strong>Hardware repairs,</strong> e.g. speaker/microphone repairs and keypad problems.</li>\n</ul>\n\n<p>We&rsquo;ll do everything we can to get your mobile phone back into your hands as quickly as possible.</p>\n</div>\n\n<div class="medium-6 column">\n<h3>How can you get a quote and repair?</h3>\n\n<p>The Fastest way to get your device fixed is to make a reservation at our office. Our repair centre have sophisticated onsite repair facilities. As long as we have all the parts required for your repair in stock, we aim to get your device back to you in the shortest time.</p>\n\n<p>If your hardware is fine, yet,&nbsp;there is still a problem with your device, we can help you fix the software issues in no time.</p>\n</div>\n</div>\n\n<div class="row extra-info">\n<h3>Why get your device repaired by SuperGeeks?</h3>\n\n<ul>\n  <li><strong>At SuperGeeks, we pride ourselves on being a certified repair service.</strong> Unlike high street repair services, our work is top quality and meets the industry standard.</li>\n <li><strong>We offer free, no-obligation quotes</strong> for repairs and servicing</li>\n <li><strong>We guarantee all our repairs to be free of defects</strong></li>\n  <li><strong>All our repairs are tested to manufacturer standards.</strong></li>\n <li><strong>We use genuine and manufacturer-approved replacement parts.</strong></li>\n</ul>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(9, 1, 1, '<div class="main row">\n<h1 class="page-header">Safety &amp; Security</h1>\n\n<h4 class="sub-head">Protecting your valuables with everything we&rsquo;ve got. We take pride in respecting the valuables and information of our clients. You can be rest assured that your data is safe with us. We:</h4>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">1</span></div>\n\n<div class="small-10 column">\n<h3>Respect Your Privacy</h3>\n\n<p>When you work with us, you can be rest assured that we&rsquo;re looking out for your best interest 100%. We are committed to handling your information responsibly, as we comply with all applicable federal and state privacy laws, as well as our own stringent standards.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">2</span></div>\n\n<div class="small-10 column">\n<h3>Secure Your Personal Information</h3>\n\n<p>We take your personal information very seriously and do our best to safeguard it. When we ask you for your personal information, we will tell you why we need it and exactly what we will do with it.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">3</span></div>\n\n<div class="small-10 column">\n<h3>Earn Your Trust</h3>\n\n<p>Every interaction with a customer&nbsp;is a building block to a strong relationship. From our pledge, it is our goal to foster a respectful and long lasting commitment. If there are ever any questions or concerns, please don&rsquo;t hesitate to call us on 0815 092 GEEK (4335).</p>\n</div>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(7, 1, 1, '<div class="main row">\n<h1 class="page-header">Why Choose Us</h1>\n\n<h4 class="sub-head">We do know technology. From any make of PCs &amp; MACs to Cameras, Mobile Phones, Consumer Electronics and White Goods, we can fix it. We&rsquo;re here all the time to help you get your devices working at optimum capacity.</h4>\n\n<p>&nbsp;</p>\n\n<h4>The SuperGeeks Code of Conduct</h4>\n\n<div class="SG-mascot"><img alt="SuperGeeks Mascot - SuperGeeks Code of Conduct" src="/assets/img/Supergeeks-mascot-on-blue.png" width="250" /></div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">1</span></div>\n\n<div class="small-10 column">\n<p><strong>We will always stand behind our work.</strong> We&rsquo;re committed to providing the best possible service. We can bet our house on that. If you&rsquo;re not totally satisfied, we&rsquo;ll do our best to correct the problem at no extra cost.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">2</span></div>\n\n<div class="small-10 column">\n<p><strong>We&rsquo;ll treat your device as if it were ours.</strong> We love technology and solemnly pledge to pamper and give your device the nice treatment every single time.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">3</span></div>\n\n<div class="small-10 column">\n<p><strong>3. Provide our service at competitive price. </strong> Geeks, super ones at that have their prices, but we promise to be reasonable and fair. If at any time you are not satisfied, we&rsquo;re determined to make it right.</p>\n</div>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(10, 1, 1, '<div class="main row">\n<h1 class="page-header">Privacy Policy</h1>\n\n<h4>OUR PRIVACY COMMITMENT TO OUR CUSTOMERS</h4>\n\n<ul class="lists">\n <li><strong>NOTICE</strong> When we ask for your personal information, we will tell you why we need it and what we will do with it.</li>\n  <li><strong>CHOICE</strong> When we contact you for marketing purposes, we will let you know how to remove your name from future marketing efforts.</li>\n  <li><strong>SECURITY</strong> We will use reasonable security measures to protect the personal information we receive from you.</li>\n  <li><strong>SHARING</strong> When we share your information with other companies to help us provide our services to you, we will require them to comply with all applicable legal requirements regarding the privacy of your information.</li>\n</ul>\n\n<h3>Supergeeks Privacy Policy</h3>\n\n<h3>&nbsp;</h3>\n\n<p>The following Privacy Policy describes the information and privacy practices for SuperGeeks, SuperGeeks.com.ng (the &quot;SuperGeeks Web site&quot;) and all other locations, occasions or events where your personal information is collected by, or on behalf of, SuperGeeks. When you provide us your personal information, you consent to the information practices described in this policy.</p>\n\n<h3>Information Collected By Supergeeks</h3>\n\n<p>As part of your interaction with SuperGeeks, we may collect personal information such as:</p>\n\n<ul class="lists">\n  <li>Contact information, including name, mailing address, phone number and e-mail address</li>\n  <li>Purchase information, billing and/or shipping information</li>\n</ul>\n\n<p>We may also collect demographic information, including age, personal interests and product preferences. While taking advantage of services available from us, we may ask that you provide personal information. For example, we may request and/or collect personal information when you:</p>\n\n<ul class="lists">\n <li>Schedule an appointment for services</li>\n <li>Bring in your product for service</li>\n  <li>Purchase products or services</li>\n  <li>Set up an account online</li>\n <li>Schedule a delivery or an installation</li>\n <li>Participate in a sweepstakes, promotion or survey</li>\n  <li>Contact us with a question or concern</li>\n  <li>Participate in other activities with SuperGeeks</li>\n</ul>\n\n<h3>Uses of Your Personal Information</h3>\n\n<p>We use the personal information you provide for purposes including, but not limited to:</p>\n\n<ul class="lists">\n <li>Fulfilling requests for products, services or information</li>\n  <li>Tracking and confirming online orders</li>\n  <li>Delivering or installing products</li>\n  <li>Providing customer services</li>\n  <li>Administering sweepstakes, promotions or surveys</li>\n <li>Offering new products and services</li>\n <li>Improving the effectiveness of our Web sites, our marketing endeavors and our services and offers</li>\n  <li>Conducting research and analysis</li>\n <li>Sending marketing communications</li>\n <li>Performing other business activities as needed, or as described elsewhere within this Policy.</li>\n</ul>\n\n<h3>Sharing Of Personal Information</h3>\n\n<p>SuperGeeks does not sell, rent or trade your personal information to third parties. We may need to share your personal information within the SuperGeeks Companies. These companies may use this information to offer you products and services that may be of interest to you.</p>\n\n<p>In addition, SuperGeeks may share customer information with certain third parties such as our agents, service providers and other representatives acting on our behalf for limited purposes. For example, we may share personal information with third parties to perform services on our behalf such as:</p>\n\n<ul class="lists">\n <li>Fulfilling customer orders</li>\n <li>Sending SuperGeeks marketing communications</li>\n  <li>Delivering packages</li>\n  <li>Scheduling and performing installations</li>\n  <li>Servicing products</li>\n <li>Fulfilling subscription services</li>\n <li>Conducting research, analysis or administering surveys</li>\n <li>Sending regular mail and e-mail on behalf of SuperGeeks</li>\n  <li>Providing chat functions</li>\n</ul>\n\n<p>The third parties with whom we conduct business are authorized to use your information only to perform the service for which they are hired. They are required to abide by the terms of our Privacy Policy including taking reasonable measures to ensure your personal information is secure.</p>\n\n<p>SuperGeeks may also share your personal information with companies who have referred you to SuperGeeks for goods and services, or have provided space in their store locations for SuperGeeks to offer its goods and services, or have allowed SuperGeeks to have a presence on their web sites.</p>\n\n<p>We may also share aggregated data with third parties for analysis and research purposes. This data does not contain name, address or other personally identifiable information.</p>\n\n<p>From time to time, we may be required to share personal information in response to a valid court order, subpoena, government investigation, or as otherwise required by law. We also reserve the right to report to law enforcement agencies any activities that we, in good faith, believe to be unlawful. We may share certain personal information when we believe that such release is reasonably necessary to protect the rights, property and safety of others and ourselves. We may also transfer personal information in the event of a corporate sale, merger, acquisition, dissolution or similar event.</p>\n\n<p>Any personally identifiable information you submit on a bulletin board, blog, chat room, comment about a product, or any other public forum on this Web site can be read, collected, or used by other users of these forums, and could be used to send you unsolicited messages. We recommend that you do not provide your name, e-mail address or any other personal information. Please note that if you choose to do so, it is at your own risk and you accept full responsibility for those posts and any consequences that may arise from posting this information.</p>\n\n<p>We also display personal testimonials of satisfied customers on our site in addition to other endorsements. With your consent we may post your testimonial along with your name. If you wish to update or delete your testimonial, you can contact us at info@supergeeks.com.ng.</p>\n\n<p>At times we may partner with a third party to create a site that may look as if you are on a SuperGeeks.com.ng page. These sites may be co-branded or may have the look and feel of being on our Web site. However, the information collected on these pages may not be covered under the SuperGeeks Privacy Policy. We will provide notice on these sites and post the privacy policy that is applicable to the information collected on these pages.</p>\n\n<h3>Choices Regarding Your Personal Information</h3>\n\n<p>SuperGeeks communicates with our customers through multiple channels and vehicles to keep you up-to-date on promotions, offers, customer experience content and new products or services. Once you provide your personal information, we may contact you through direct mail, e-mail or phone. We may continue to communicate with you through these channels unless you request to stop receiving these communications by opting out. Before sending you mobile marketing (e.g., text messages) we will require your express consent by requesting that you opt-in.</p>\n\n<p>If you no longer wish to receive these communications, let us know by using whichever of the following methods is appropriate under the circumstances.</p>\n\n<h3>Security of Your Personal Information</h3>\n\n<p>Whether you are receiving services, or in our stores, we use reasonable security measures to protect the confidentiality of personal information under our control and appropriately limit access to it. SuperGeeks cannot ensure or warrant the security of any information you transmit to us by e-mail, and you do so at your own risk.</p>\n\n<p>Please note: While SuperGeeks is able to protect personal information that is provided during the course of business, SuperGeeks cannot take responsibility for data loss on the products or systems serviced. You will need to ensure your data has been removed or backed-up in order to safeguard this information.</p>\n\n<h3>Privacy Policy Changes</h3>\n\n<p>We may need to update our Privacy Policy as SuperGeeks and our customers grow and evolve. If we make any material changes, including any change in ownership or uses of your personal information, we will notify you by email (sent to the e-mail address specified in your account) or by means of a notice on this Site prior to the change becoming effective, as well as inform you of any choices you may have with respect to these changes.</p>\n\n<p>Last revision date: July 22, 2014</p>\n</div>\n', 'xhtml', '', 'none'),
(11, 1, 1, '<div class="main row">\n<h1 class="page-header">Terms</h1>\n\n<p>Welcome to the SuperGeeks website. By using it you agree to be bound by its legal notices (explained below) and all disclaimers and terms and conditions that appear elsewhere on the SuperGeeks website. The policies of SuperGeeks service establishments may differ substantially from those applicable to your use of the SuperGeeks website.</p>\n\n<p>SuperGeeks reserves the right to change its legal notices at any time. Each time you use the SuperGeeks website, you should review the legal notices that apply to use of this site. If you are dissatisfied with the site&#39;s Content or the legal notices, you agree that your sole and exclusive remedy is to discontinue using the SuperGeeks website.</p>\n\n<p>Tampering with the site, misrepresenting a user&rsquo;s identity, or conducting fraudulent activities on the site is prohibited.</p>\n\n<h3>Right to Download</h3>\n\n<p>You may download Content displayed on the SuperGeeks website for noncommercial personal use, provided you also retain all copyright, trademark, and other proprietary notices contained in the material, do not modify or alter the material, and do not copy or post the material on any network computer or broadcast the material in any media. Modifying, transmitting, distributing, reusing, reposting, &quot;framing&quot; or using the Content of the SuperGeeks website (including text, images, audio and/or video) for public or commercial purposes without written permission from an authorized SuperGeeks representative is strictly prohibited.</p>\n\n<h3>Proprietary Rights</h3>\n\n<p>All Content included on or comprising the SuperGeeks website &mdash; including information, data, software, photographs, graphs, videos, typefaces, graphics, music, sounds, and other material (&ldquo;Content&quot;) is protected by copyright, trademark, patent, or other proprietary rights; these rights are valid and protected in all forms, media, and technologies existing now or developed in the future. All Content is copyrighted as a collective work under The Nigerian Copyright Act, and SuperGeeks owns, to the fullest extent allowed by such laws, the copyright in the selection, coordination, arrangement, and enhancement of all Content.</p>\n\n<p>Except as expressly authorized or licensed, you may not copy, modify, remove, delete, augment, add to, publish, or transmit; participate in the transfer or sale, lease or rental of; or create derivative works from or in any way exploit any of the Content, in whole or in part.</p>\n\n<p>SuperGeeks logos and other trademarks on the site are the property of their respective owners and are owned by, licensed to, or, where required, used with permission by SuperGeeks and may not be reproduced, copied, or manipulated in any manner without the express written approval of the trademark owner.</p>\n\n<p>By using the SuperGeeks website, you agree that all information, materials, suggestions, ideas, or comments (including testimonials) you send to SuperGeeks or any third party using the SuperGeeks website are non-confidential. By submitting solicited or unsolicited information using the SuperGeeks website, you grant SuperGeeks an irrevocable and unrestricted license to use, modify, reproduce, transmit, display, and distribute such materials, information, suggestions, ideas or comments for any purpose whatsoever to the extent permitted by law.</p>\n\n<h3>Security</h3>\n\n<p>The SuperGeeks website may only be used for lawful purposes. Activities including&mdash;but not limited to&mdash;tampering with the site, misrepresenting the identity of a user, using buying agents, or conducting fraudulent activities on the site are prohibited.</p>\n\n<p>Users are prohibited from violating or attempting to violate SuperGeeks website security, including, without limitation, (a) accessing data not intended for such user; (b) using the website for unintended purposes or trying to change the site&rsquo;s behavior; (c) attempting to probe, scan, or test system or network vulnerability or breach security or authentication measures without proper authorization; (d) attempting to interfere with service to any user, host, or network, including, without limitation, submitting a virus to the site, overloading, &quot;flooding,&quot; &quot;spamming,&quot; &quot;mail bombing,&quot; or &quot;crashing&quot;; (f) forging any TCP/IP packet header or any part of the header information in any e-mail or newsgroup posting; or (g) forging communications on behalf of the website (i.e., impersonating the SuperGeeks website) or to the website (i.e., impersonating a legitimate user). Sending unsolicited and unauthorized eMail on behalf of SuperGeeks, including promotions and/or advertising of products or services, is expressly prohibited. System or network security violations may result in civil or criminal liability.</p>\n\n<p>You agree not to use any device, software, routine, or data to interfere or attempt to interfere with the proper working of the SuperGeeks website or any activity being conducted on this site. You agree, further, not to use or attempt to use any engine, software, tool, agent, data or other device or mechanism (including without limitation browsers, spiders, robots, avatars, or intelligent agents) to navigate or search the SuperGeeks website other than the search engine and search agents provided by SuperGeeks or generally publicly available browsers.</p>\n</div>\n', 'xhtml', '', 'none'),
(12, 1, 1, '<div class="main row">\n<div class="row">\n<div class="medium-3 column"><img alt="SuperGeeks Gadget Protection (SGP)" src="/assets/img/sgp-logo.svg" /></div>\n\n<div class="medium-9 column">\n<h1 class="page-header">SuperGeeks<br />\nGadget Protection (SGP)</h1>\n\n<h4 class="sub-head"><strong>The Only Device Protection You Will Ever Need. </strong></h4>\n\n<h5>SuperGeeks Gadget Protection (SGP) is a device protection package that gives you protection from accidental damages and other device problems.</h5>\n\n<p>Simply add Supergeeks Gadget Protection (SGP) to your device purchase. From the moment you work out with a plan, you get 24/7 support, no question repairs and in some cases device replacement.</p>\n\n<p>Beyond your regular warranty, SGP covers breakdowns, malfunctions, normal wear &amp; tear and even device damage. We take care of the small details, including labour and parts.</p>\n</div>\n</div>\n\n<div class="row features">\n<h2 class="small-12 column">Features</h2>\n\n<div class="medium-3 column item">\n<h4>Normal Wear &amp; Tear</h4>\n\n<p>Includes repair costs for manufacturer defects in materials or workmanship and failures due to dust, internal heat and humidity.</p>\n</div>\n\n<div class="medium-3 column item">\n<h4>Hardware / Software Failure</h4>\n\n<p>Includes repair costs for defects in manufacturer hardware, or general failure in the OS or other software issues relating to installation and configuration.</p>\n</div>\n\n<div class="medium-3 column item">\n<h4>Liquid Damage</h4>\n\n<p>If your device gets into water or any other liquid, don&rsquo;t worry, we&rsquo;ll cover you.</p>\n</div>\n\n<div class="medium-3 column item">\n<h4>Irreparable Damages</h4>\n\n<p>If your device cannot be fixed, we&rsquo;ll replace the damaged device with a new one.</p>\n</div>\n</div>\n\n<div class="row">\n<h2>SGP Protection Plans</h2>\n\n<p><span class="icon-checkmark-circle">&nbsp;&nbsp;</span>indicates availability in plan; &nbsp;&nbsp;<span class="icon-cancel-circle">&nbsp;&nbsp;</span>indicates non-availability in plan</p>\n\n<div class="row collapse">\n<ul class="SGP-plan medium-4 column">\n  <li class="title">SGP Mobile</li>\n <li class="description">Smartphones, Tablets and handheld gaming</li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Hardware Damage:</strong><br />\n Including free spare part replacement</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>OS/Software failure </strong><br />\n (Including virus removal)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Installation / Configuration</strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>General Servicing</strong></div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Irreparable Damage</strong><br />\n (Replacement)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Temporary Complimentary Device</strong><br />\n (While device being fixed)</div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Trade-in* </strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n</ul>\n\n<ul class="SGP-plan medium-4 column">\n <li class="title">SGP Personal Computing</li>\n <li class="description">Laptop, Desktop, Apple TV, MACs and Printers</li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Hardware Damage:</strong><br />\n Including free spare part replacement</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>OS/Software failure </strong><br />\n (Including virus removal)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Installation / Configuration</strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>General Servicing</strong></div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Irreparable Damage</strong><br />\n (Replacement)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Temporary Complimentary Device</strong><br />\n (While device being fixed)</div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Trade-in* </strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n</ul>\n\n<ul class="SGP-plan medium-4 column">\n <li class="title">SGP Home Electronics</li>\n <li class="description">Smart TVs, Home-Theatre Systems and Games</li>\n  <li class="bullet-item row">\n  <div class="small-9 column"><strong>Hardware Damage:</strong><br />\n Including free spare part replacement</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>OS/Software failure </strong><br />\n (Including virus removal)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Installation / Configuration</strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>General Servicing</strong></div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Irreparable Damage</strong><br />\n (Replacement)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Temporary Complimentary Device</strong><br />\n (While device being fixed)</div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Trade-in* </strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n</ul>\n\n<ul class="SGP-plan medium-4 column">\n <li class="title">SGP White Goods</li>\n  <li class="description">Air Conditioners, Washing Machines, Fridges and Microwaves</li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Hardware Damage:</strong><br />\n Including free spare part replacement</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>OS/Software failure </strong><br />\n (Including virus removal)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Installation / Configuration</strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>General Servicing</strong></div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Irreparable Damage</strong><br />\n (Replacement)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Temporary Complimentary Device</strong><br />\n (While device being fixed)</div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Trade-in* </strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n</ul>\n\n<ul class="SGP-plan medium-4 column end">\n <li class="title">SGP Misc</li>\n <li class="description">SGP Misc Cameras and Luxury headphones</li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Hardware Damage:</strong><br />\n Including free spare part replacement</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>OS/Software failure </strong><br />\n (Including virus removal)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Installation / Configuration</strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>General Servicing</strong></div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Irreparable Damage</strong><br />\n (Replacement)</div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Temporary Complimentary Device</strong><br />\n (While device being fixed)</div>\n\n  <div class="small-3 column">&nbsp;</div>\n  </li>\n <li class="bullet-item row">\n  <div class="small-9 column"><strong>Trade-in* </strong></div>\n\n <div class="small-3 column">&nbsp;</div>\n  </li>\n</ul>\n</div>\n</div>\n\n<div class="row">\n<div class="medium-6 column">\n<h3>What SGP does not cover</h3>\n\n<p>SGP Protection plans does not cover:</p>\n\n<ul class="lists">\n <li>Theft</li>\n  <li>In-home/on-site service</li>\n  <li>Phone/web support</li>\n  <li>Preventive maintenance checks</li>\n  <li>One-time batter replacement coverage</li>\n <li>No lemon coverage</li>\n</ul>\n</div>\n\n<div class="medium-6 column">\n<h3>Where to get SGP</h3>\n\n<p><strong>Jumia, Konga, Game, Park &lsquo;n&rsquo;Shop</strong></p>\n\n<h3>How to Signup for an SGP Protection Plan</h3>\n\n<p>Buy your device from any SGP consumer partner. During checkout, request for a specific SGP plan that fits your purchase. You will be asked to fill a form; after filling the form, a premium that fits your plan will be requested from you. Simply add the premium amount to your purchase and you are done.</p>\n</div>\n</div>\n\n<div class="row">\n<h2>How to Submit a Claim</h2>\n\n<p>In Accordance with your plan, please drop your product off for service or repair at any SuperGeeeks repair facility. You are required to pay for repairs and then submit your repair bill for reimbursement. Once the service work has been completed and paid for, please follow one of these two options to be reimbursed:</p>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(13, 1, 1, '<div class="main row">\n<h1 class="page-header">Safety &amp; Security</h1>\n\n<h4 class="sub-head">Protecting your valuables with everything we&rsquo;ve got. We take a pride in respecting the valuables and information of our clients. You can be rest assured that your data is safe with us. We:</h4>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">1</span></div>\n\n<div class="small-10 column">\n<h3>Respect Your Privacy</h3>\n\n<p>When you work with us, you can be rest assured that we&rsquo;re looking out for your best interest 100%. We are committed to be handling your information responsibly, as we comply with all applicable federal and state privacy laws, as well as our own stringent standards.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">2</span></div>\n\n<div class="small-10 column">\n<h3>Security Your Personal Information</h3>\n\n<p>We take your personal information very seriously and do our best to safeguard it. When we ask you for your personal information, we will tell you why we need it and what we will do wit it.</p>\n</div>\n</div>\n\n<div class="large-4 column">\n<div class="small-2 column"><span class="numbering">3</span></div>\n\n<div class="small-10 column">\n<h3>Earn Your Trust</h3>\n\n<p>Every interaction with our customers is a building block to a strong relationship. From our pledge, it is our goal to build a respectful and long lasting commitment. If there are ever any questions or concerns, please don&rsquo;t hesitate to call us on 0815 092 GEEK (4335).</p>\n</div>\n</div>\n</div>\n', 'xhtml', '', 'none'),
(14, 1, 1, '<!--SuperGeeks Slogan-->\n<div class="row">\n<h4 class="SGSlogan medium-12 large-8 column"><strong>SuperGeeks</strong> - <em>Stress-free Electronics &amp; Gadget Repairs</em></h4>\n\n<div class="medium-12 large-4 column end quick-quote"><button class="round"><strong>Get Quick Repair Quote</strong></button></div>\n</div>\n\n<div class="row">\n<div class="homeinfopanel medium-6 column">\n<div class="medium-7 small-centered column">\n<h2><a href="/fix-and-repairs" title="SuperGeeks Fix and Repairs">Repairs</a></h2>\n<img alt="SuperGeeks Repair Services" src="/assets/img/Supergeeks-repairs.svg" /></div>\n\n<div class="medium-10 small-centered column">\n<p>Got a broken screen, your tablet wouldn&rsquo;t come on? Your beloved washing machine seems to be staring at your clothes? We sure can fix it. Contact us today.</p>\n</div>\n</div>\n\n<div class="homeinfopanel medium-6 column">\n<div class="medium-7 small-centered column">\n<h2><a href="/tech-support" title="SuperGeeks Tech Support">Tech Support</a></h2>\n<img alt="SuperGeeks Repair Services" src="/assets/img/SGP-repair-man.svg" /></div>\n\n<div class="medium-10 small-centered column">\n<p>Have some issues with your devices, or just got that spanking new equipment and don&rsquo;t know how to set it up?&nbsp;We ensure that your device is always performing like the day you bought it.</p>\n</div>\n</div>\n\n<div class="homeinfopanel medium-12 column">\n<div class="SGPHome medium-5 column"><img alt="SuperGeeks Gadget Protection - SGP" src="/assets/img/gadget-protection.svg" /></div>\n\n<div class="medium-7 column">\n<h2>SuperGeeks Gadget Protection</h2>\n\n<h4>The only device protection you will ever need</h4>\n\n<p>SuperGeeks Gadget Protection (SGP) is a device protection package that gives you protection from accidental damages and other device problems.</p>\n<a class="button round" href="/sgp"><strong>Learn more</strong></a></div>\n</div>\n</div>\n', 'xhtml', '', NULL),
(16, 1, 3, '', NULL, '{filedir_1}SuperGeeks-fix-install-service.jpg', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(2, 1, 1, 'content', 'Content', 'Page Content', 'expresso', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 2, 'any', 'YTo5OntzOjc6InRvb2xiYXIiO3M6NDoiZnVsbCI7czo2OiJoZWlnaHQiO2I6MDtzOjExOiJjb250ZW50c0NzcyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(3, 1, 2, 'banner_image', 'Banner Image', 'Upload a banner image that will appear on the homepage. required size is: 1000 x 400px', 'file', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjA6IiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_form_settings`
--

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '127.0.0.1', 'Contact', 'contact', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406140860, '2014', '07', '23', 0, 0, 20140723224515, 0, 0),
(8, 1, 1, 1, NULL, '127.0.0.1', 'About', 'about', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141880, '2014', '07', '23', 0, 0, 20140723194835, 0, 0),
(3, 1, 1, 1, NULL, '127.0.0.1', 'Tech Support', 'tech-support', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141400, '2014', '07', '23', 0, 0, 20140723222240, 0, 0),
(4, 1, 1, 1, NULL, '127.0.0.1', 'Fix and Repairs', 'fix-and-repairs', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141520, '2014', '07', '23', 0, 0, 20140723223554, 0, 0),
(10, 1, 1, 1, NULL, '127.0.0.1', 'Privacy Policy', 'privacy-policy', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141940, '2014', '07', '23', 0, 0, 20140723225542, 0, 0),
(9, 1, 1, 1, NULL, '127.0.0.1', 'Safety and Security', 'safety-and-security', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141880, '2014', '07', '23', 0, 0, 20140723225314, 0, 0),
(7, 1, 1, 1, NULL, '127.0.0.1', 'Why Choose Us', 'why-choose-us1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406141700, '2014', '07', '23', 0, 0, 20140723224924, 0, 0),
(11, 1, 1, 1, NULL, '127.0.0.1', 'Terms and Conditions', 'terms-and-conditions', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406142000, '2014', '07', '23', 0, 0, 20140723190047, 0, 0),
(12, 1, 1, 1, NULL, '127.0.0.1', 'SGP', 'sgp', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406142060, '2014', '07', '23', 0, 0, 20140723190138, 0, 0),
(13, 1, 1, 1, NULL, '127.0.0.1', 'Safety and Security', 'safety-and-security1', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406142600, '2014', '07', '23', 0, 0, 20140723191050, 0, 0),
(14, 1, 1, 1, NULL, '127.0.0.1', 'Homepage', 'homepage', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406145780, '2014', '07', '23', 0, 0, 20140723220109, 0, 0),
(16, 1, 3, 1, NULL, '127.0.0.1', 'Banner Image', 'banner-image', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1406147040, '2014', '07', '23', 0, 0, 20140723202415, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_content_types`
--

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(1, 'grid'),
(2, 'channel');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'sgadmin', '127.0.0.1', 1406132761, 'Logged in'),
(2, 1, 1, 'sgadmin', '127.0.0.1', 1406139096, 'Logged in'),
(3, 1, 1, 'sgadmin', '127.0.0.1', 1406140172, 'Field Group Created:&nbsp;Pages'),
(4, 1, 1, 'sgadmin', '127.0.0.1', 1406140274, 'Channel Created:&nbsp;&nbsp;Pages'),
(5, 1, 1, 'sgadmin', '127.0.0.1', 1406141738, 'Logged in'),
(6, 1, 1, 'sgadmin', '127.0.0.1', 1406145108, 'Field Group Created:&nbsp;Homepage Banners'),
(7, 1, 1, 'sgadmin', '127.0.0.1', 1406145271, 'Channel Created:&nbsp;&nbsp;Banner Images'),
(8, 1, 1, 'sgadmin', '127.0.0.1', 1406147023, 'Channel Created:&nbsp;&nbsp;Home Banners'),
(9, 1, 1, 'sgadmin', '127.0.0.1', 1406147257, 'Channel Deleted:&nbsp;&nbsp;Banner Images'),
(10, 1, 1, 'sgadmin', '127.0.0.1', 1406151613, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0.1', 'y'),
(2, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0.1', 'y'),
(3, 'Nsm_better_meta_ext', 'dummy_hook_function', 'dummy_hook_function', 'a:0:{}', 10, '1.1.6', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'grid', '1.0', 'YTowOnt9', 'n'),
(7, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(8, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(9, 'radio', '1.0', 'YTowOnt9', 'n'),
(10, 'relationship', '1.0', 'YTowOnt9', 'n'),
(11, 'rte', '1.0', 'YTowOnt9', 'n'),
(12, 'nsm_better_meta', '1.1.6', 'YTowOnt9', 'n'),
(14, 'expresso', '3.3.1', 'YToxOntzOjY6Imdsb2JhbCI7YTo3OntzOjE0OiJsaWNlbnNlX251bWJlciI7czozNjoiMGM0Yjg1NzgtYmQ1NS00ZWMzLThmN2ItZDZmOTVhY2NkNDJkIjtzOjE4OiJhdXRvR3Jvd19tYXhIZWlnaHQiO3M6MzoiNDAwIjtzOjEzOiJ0b29sYmFyX2ljb25zIjthOjE0OntpOjA7czoxMDoiTGlzdCBCbG9jayI7aToxO3M6NjoiSW5kZW50IjtpOjI7czoxMDoiQmxvY2txdW90ZSI7aTozO3M6MTM6Ikp1c3RpZnkgQmxvY2siO2k6NDtzOjEzOiJQYXN0ZUZyb21Xb3JkIjtpOjU7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjY7czo2OiJBbmNob3IiO2k6NztzOjEwOiJNZWRpYUVtYmVkIjtpOjg7czo1OiJGbGFzaCI7aTo5O3M6NToiVGFibGUiO2k6MTA7czo2OiJJZnJhbWUiO2k6MTE7czo4OiJNYXhpbWl6ZSI7aToxMjtzOjEwOiJTaG93QmxvY2tzIjtpOjEzO3M6NjoiU291cmNlIjt9czo3OiJoZWFkZXJzIjthOjY6e2k6MDtzOjI6ImgxIjtpOjE7czoyOiJoMiI7aToyO3M6MjoiaDMiO2k6MztzOjI6Img0IjtpOjQ7czoyOiJoNSI7aTo1O3M6MjoiaDYiO31zOjExOiJjb250ZW50c0NzcyI7czowOiIiO3M6MTQ6ImN1c3RvbV90b29sYmFyIjtzOjA6IiI7czo2OiJzdHlsZXMiO3M6MDoiIjt9fQ==', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(7, 2, 'markdown'),
(6, 2, 'br'),
(5, 2, 'none'),
(8, 2, 'xhtml'),
(9, 3, 'none'),
(10, 3, 'br'),
(11, 3, 'markdown'),
(12, 3, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Pages'),
(2, 1, 'Homepage Banners');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'SuperGeeks-fix-install-service.jpg', 1, '/Users/javik/Documents/www/supergeeks/images/SuperGeeks-fix-install-service.jpg', 'image/jpeg', 'SuperGeeks-fix-install-service.jpg', 181207, NULL, NULL, NULL, 1, 1406146687, 1, 1406146712, '593 1484');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_composer_layouts`
--

CREATE TABLE `exp_freeform_composer_layouts` (
  `composer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composer_data` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `preview` char(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`composer_id`),
  KEY `preview` (`preview`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_composer_templates`
--

CREATE TABLE `exp_freeform_composer_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `template_name` varchar(150) NOT NULL DEFAULT 'default',
  `template_label` varchar(150) NOT NULL DEFAULT 'default',
  `template_description` text,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_data` text,
  `param_data` text,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_fields`
--

CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `field_name` varchar(150) NOT NULL DEFAULT 'default',
  `field_label` varchar(150) NOT NULL DEFAULT 'default',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `settings` text,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `required` char(1) NOT NULL DEFAULT 'n',
  `submissions_page` char(1) NOT NULL DEFAULT 'y',
  `moderation_page` char(1) NOT NULL DEFAULT 'y',
  `composer_use` char(1) NOT NULL DEFAULT 'y',
  `field_description` text,
  PRIMARY KEY (`field_id`),
  KEY `field_name` (`field_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_freeform_fields`
--

INSERT INTO `exp_freeform_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_type`, `settings`, `author_id`, `entry_date`, `edit_date`, `required`, `submissions_page`, `moderation_page`, `composer_use`, `field_description`) VALUES
(1, 1, 'first_name', 'First Name', 'text', '{"field_length":150,"field_content_type":"any"}', 1, 1406139585, 0, 'n', 'y', 'y', 'y', 'This field contains the user''s first name.'),
(2, 1, 'last_name', 'Last Name', 'text', '{"field_length":150,"field_content_type":"any"}', 1, 1406139585, 0, 'n', 'y', 'y', 'y', 'This field contains the user''s last name.'),
(3, 1, 'email', 'Email', 'text', '{"field_length":150,"field_content_type":"email"}', 1, 1406139585, 0, 'n', 'y', 'y', 'y', 'A basic email field for collecting stuff like an email address.'),
(4, 1, 'user_message', 'Message', 'textarea', '{"field_ta_rows":6}', 1, 1406139585, 0, 'n', 'y', 'y', 'y', 'This field contains the user''s message.');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_fieldtypes`
--

CREATE TABLE `exp_freeform_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldtype_name` varchar(250) DEFAULT NULL,
  `settings` text,
  `default_field` char(1) NOT NULL DEFAULT 'n',
  `version` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`fieldtype_id`),
  KEY `fieldtype_name` (`fieldtype_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_freeform_fieldtypes`
--

INSERT INTO `exp_freeform_fieldtypes` (`fieldtype_id`, `fieldtype_name`, `settings`, `default_field`, `version`) VALUES
(1, 'file_upload', '[]', 'n', '4.1.8'),
(2, 'mailinglist', '[]', 'n', '4.1.8'),
(3, 'text', '[]', 'n', '4.1.8'),
(4, 'textarea', '[]', 'n', '4.1.8');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_file_uploads`
--

CREATE TABLE `exp_freeform_file_uploads` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_path` varchar(750) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_forms`
--

CREATE TABLE `exp_freeform_forms` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_name` varchar(150) NOT NULL DEFAULT 'default',
  `form_label` varchar(150) NOT NULL DEFAULT 'default',
  `default_status` varchar(150) NOT NULL DEFAULT 'default',
  `notify_user` char(1) NOT NULL DEFAULT 'n',
  `notify_admin` char(1) NOT NULL DEFAULT 'n',
  `user_email_field` varchar(150) NOT NULL DEFAULT '',
  `user_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_email` text,
  `form_description` text,
  `field_ids` text,
  `field_order` text,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `composer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`form_id`),
  KEY `form_name` (`form_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_freeform_forms`
--

INSERT INTO `exp_freeform_forms` (`form_id`, `site_id`, `form_name`, `form_label`, `default_status`, `notify_user`, `notify_admin`, `user_email_field`, `user_notification_id`, `admin_notification_id`, `admin_notification_email`, `form_description`, `field_ids`, `field_order`, `template_id`, `composer_id`, `author_id`, `entry_date`, `edit_date`, `settings`) VALUES
(1, 1, 'contact', 'Contact', 'pending', 'n', 'y', '', 0, 1, 'javik@live.com', 'This is a basic contact form.', '1|2|3|4', NULL, 0, 0, 1, 1406139585, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_form_entries_1`
--

CREATE TABLE `exp_freeform_form_entries_1` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `complete` varchar(1) NOT NULL DEFAULT 'y',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `form_field_1` text,
  `form_field_2` text,
  `form_field_3` text,
  `form_field_4` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_freeform_form_entries_1`
--

INSERT INTO `exp_freeform_form_entries_1` (`entry_id`, `site_id`, `author_id`, `complete`, `ip_address`, `entry_date`, `edit_date`, `status`, `form_field_1`, `form_field_2`, `form_field_3`, `form_field_4`) VALUES
(1, 1, 0, 'y', '127.0.0.1', 1406139585, 0, 'pending', 'Jake', 'Solspace', 'support@solspace.com', 'Welcome to Freeform. We hope that you will enjoy Solspace software.');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_multipage_hashes`
--

CREATE TABLE `exp_freeform_multipage_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit` char(1) NOT NULL DEFAULT 'n',
  `data` text,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`),
  KEY `ip_address` (`ip_address`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_notification_templates`
--

CREATE TABLE `exp_freeform_notification_templates` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `notification_name` varchar(150) NOT NULL DEFAULT 'default',
  `notification_label` varchar(150) NOT NULL DEFAULT 'default',
  `notification_description` text,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `allow_html` char(1) NOT NULL DEFAULT 'n',
  `from_name` varchar(150) NOT NULL DEFAULT '',
  `from_email` varchar(250) NOT NULL DEFAULT '',
  `reply_to_email` varchar(250) NOT NULL DEFAULT '',
  `email_subject` varchar(128) NOT NULL DEFAULT 'default',
  `include_attachments` char(1) NOT NULL DEFAULT 'n',
  `template_data` text,
  PRIMARY KEY (`notification_id`),
  KEY `notification_name` (`notification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_params`
--

CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_preferences`
--

CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) DEFAULT NULL,
  `preference_value` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `preference_name` (`preference_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_freeform_preferences`
--

INSERT INTO `exp_freeform_preferences` (`preference_id`, `preference_name`, `preference_value`, `site_id`) VALUES
(1, 'ffp', 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_user_email`
--

CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  `email_addresses` text,
  PRIMARY KEY (`email_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES
(1, 1, 'facebook_link', 'https://www.facebook.com/SuperGeeksAfrica'),
(2, 1, 'twitter_link', 'https://twitter.com/TeamSuperGeeks');

-- --------------------------------------------------------

--
-- Table structure for table `exp_grid_columns`
--

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list`
--

CREATE TABLE `exp_mailing_list` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(7) unsigned NOT NULL,
  `authcode` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `list_id` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_lists`
--

CREATE TABLE `exp_mailing_lists` (
  `list_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `list_name` varchar(40) NOT NULL,
  `list_title` varchar(100) NOT NULL,
  `list_template` text NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `list_name` (`list_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_mailing_lists`
--

INSERT INTO `exp_mailing_lists` (`list_id`, `list_name`, `list_title`, `list_template`) VALUES
(1, 'default', 'Default Mailing List', '{message_text}\n\nTo remove your email from this mailing list, click here:\n{if html_email}<a href=\\"{unsubscribe_url}\\">{unsubscribe_url}</a>{/if}\n{if plain_email}{unsubscribe_url}{/if}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_mailing_list_queue`
--

CREATE TABLE `exp_mailing_list_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `list_id` int(7) unsigned NOT NULL DEFAULT '0',
  `authcode` varchar(10) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`) VALUES
(1, 1, 'sgadmin', 'SuperGeeks', '70386e6a7db3800b19b1a0b9d95ec16c6c4fbd1c6d823d52de12ae91c74f3ff1b093f98bf7c8c0b66c5d695a93dc8826eb1d5556de859a4d562bbb1a905fc297', '+B!L75&y,__:,$^|[56Y@lw-Bmg<?\\.%6Q;BS6]W}]V,>v=kp-cC?2$''"0o!a??rYSf@>"`0C%Dw[#nB>{T''6K_.5&vy2j{)K!U,y,hz#J]}f/yF1uV{hUO[HW4c-CAh', 'b122f4c2648f4bc963ea0959169d2709b8d7fb66', 'fa3980a0838a2b2419c113cad539257bc313b3ac', NULL, 'javik@live.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1406132741, 1406132761, 1406155994, 12, 0, 0, 0, 1406147055, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Africa/Lagos', 'us', NULL, NULL, NULL, NULL, '28', NULL, '18', '', 'Pages|C=addons_modules&M=show_module_cp&module=pages|1', 'y', 0, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(2, 'Email', '2.0', 'n', 'n'),
(4, 'Jquery', '1.0', 'n', 'n'),
(16, 'Matrix_multi_upload', '0.9.3', 'n', 'n'),
(6, 'Search', '2.2.1', 'n', 'n'),
(7, 'Channel', '2.0.1', 'n', 'n'),
(8, 'Member', '2.1', 'n', 'n'),
(9, 'Stats', '2.0', 'n', 'n'),
(10, 'Rte', '1.0.1', 'y', 'n'),
(11, 'Pages', '2.2', 'y', 'y'),
(12, 'Mailinglist', '3.1', 'y', 'n'),
(13, 'Freeform', '4.1.8', 'y', 'n'),
(14, 'File', '1.0.0', 'n', 'n'),
(15, 'Nsm_better_meta', '1.1.5.1', 'n', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_nsm_addon_settings`
--

CREATE TABLE `exp_nsm_addon_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(5) unsigned NOT NULL DEFAULT '1',
  `addon_id` varchar(255) NOT NULL,
  `settings` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_nsm_addon_settings`
--

INSERT INTO `exp_nsm_addon_settings` (`id`, `site_id`, `addon_id`, `settings`) VALUES
(1, 1, 'nsm_better_meta', '{"enabled":"1","channels":{"1":{"enabled_fields":["title","description","keywords","author","canonical_url","sitemap"],"sitemap_include":"y","sitemap_change_frequency":"Weekly","sitemap_priority":"0.5"}},"default_site_meta":{"site_title":"SuperGeeks - If we can''t fix it, no one can","description":"SuperGeeeks Nigeria - State-of-the-art gadget device and repair shop in Lagos.","keywords":"SuperGeeeks, Fix, Install, Repair, Lagos, Nigeria, Tech Support, Installation, gadgets, SGP, Supergeeks gadget protection","author":"SuperGeeks","publisher":"SuperGeeks","rights":"SuperGeeks Nigeria","geo_region":"","geo_placename":"","geo_latitude":"","geo_longitude":"","robots_index":"y","robots_archive":"y","robots_follow":"y"},"divider":"0","meta_template":"<title>{title}<\\/title>\\n<meta name=\\"description\\" content=\\"{description}\\" \\/>\\n<meta name=\\"keywords\\" content=\\"{keywords}\\" \\/>\\n<meta name=\\"robots\\" content=\\"{robots}\\" \\/>\\n\\n{if canonical_url} <link rel=\\"canonical_url\\" href=\\"{canonical_url}\\" \\/> {\\/if}"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_nsm_better_meta`
--

CREATE TABLE `exp_nsm_better_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `site_id` int(5) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(6) unsigned DEFAULT NULL,
  `language_id` varchar(255) DEFAULT NULL,
  `entry_default` varchar(1) DEFAULT 'n',
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `keywords_append_default` varchar(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL,
  `robots_index` varchar(1) DEFAULT NULL,
  `robots_follow` varchar(1) DEFAULT NULL,
  `robots_archive` varchar(1) DEFAULT NULL,
  `sitemap_priority` double(2,1) DEFAULT '0.5',
  `sitemap_change_frequency` varchar(20) DEFAULT NULL,
  `sitemap_include` varchar(1) DEFAULT NULL,
  `geo_region` varchar(255) DEFAULT NULL,
  `geo_placename` varchar(255) DEFAULT NULL,
  `geo_latitude` double(8,5) DEFAULT NULL,
  `geo_longitude` double(8,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_nsm_better_meta`
--

INSERT INTO `exp_nsm_better_meta` (`id`, `entry_id`, `site_id`, `channel_id`, `language_id`, `entry_default`, `title`, `keywords`, `keywords_append_default`, `description`, `publisher`, `rights`, `author`, `canonical_url`, `robots_index`, `robots_follow`, `robots_archive`, `sitemap_priority`, `sitemap_change_frequency`, `sitemap_include`, `geo_region`, `geo_placename`, `geo_latitude`, `geo_longitude`) VALUES
(1, 1, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 1, NULL, 'y', 'About SuperGeeks', 'SuperGeeks Nigeria, Technical Support, Lagos, Nigeria, maintenance, IT infrastructure', 'n', 'SuperGeeks Nigeria SuperGeeks is an after sales device repair and service chain, and the leading providers of after sales technical support to customers within the Lagos metropolis, with focus on customer service.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Weekly', 'y', NULL, NULL, NULL, NULL),
(3, 3, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 10, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 11, 1, 1, NULL, 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 12, 1, 1, NULL, 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 13, 1, 1, NULL, 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 14, 1, 1, NULL, 'y', NULL, NULL, 'n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 15, 1, 2, NULL, 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 16, 1, 3, NULL, 'y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(5, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, ''),
(4, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, ''),
(6, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, ''),
(7, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, ''),
(8, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, ''),
(9, 1, 1, 'n', 'SuperGeeks', '127.0.0.1', 1406156204, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_pages_configuration`
--

CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  `used` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1404 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`, `used`) VALUES
(1, 1406132755, '0', '3ab74cded00ec16b3c0cc9d9ec8f0fb82f6c2560', 0),
(2, 1406132755, '0', '4daec563c326889ac14b937ae1629c415e607e92', 1),
(3, 1406132761, '0', '46b5927e096c3b0174e07bb228733f60a27e2b6f', 0),
(4, 1406132761, 'ebff582b815a63d74c570932dfca159d877e0d44', '4f8783e9cf26a1e1ecf4a96da9c91eccb7b4d57c', 0),
(5, 1406132773, 'ebff582b815a63d74c570932dfca159d877e0d44', '7173e1139f5eef7fb6a621de8450b87c52412266', 0),
(6, 1406132775, 'ebff582b815a63d74c570932dfca159d877e0d44', 'f53573546e11a537d41aafab9202ad70a7fa6a7c', 1),
(7, 1406132781, 'ebff582b815a63d74c570932dfca159d877e0d44', '4066d89f45c3a56e72fe8fc3814912f24f41aaaa', 0),
(8, 1406132781, 'ebff582b815a63d74c570932dfca159d877e0d44', 'dfa35cde87486a2e35f376b080ade6c04b0724d1', 0),
(9, 1406132794, 'ebff582b815a63d74c570932dfca159d877e0d44', 'd8636e4c7c7051e2e83c16dd143ac813a06913d9', 1),
(10, 1406132801, 'ebff582b815a63d74c570932dfca159d877e0d44', '0e45dc19ce878b976b829bc97453cbb237f4187d', 1),
(11, 1406132826, 'ebff582b815a63d74c570932dfca159d877e0d44', '2a36a2534205c625fb1343e3d5c3a160249fd626', 0),
(12, 1406132826, 'ebff582b815a63d74c570932dfca159d877e0d44', '549f00387ab8afd3574cf9fd350e4a418936ab8b', 0),
(13, 1406132828, 'ebff582b815a63d74c570932dfca159d877e0d44', '5c5d9316152ecfe6ffcf57bfa7a572af87eb8e80', 1),
(14, 1406132833, 'ebff582b815a63d74c570932dfca159d877e0d44', '791a1c60fac29c1292a9525d5af5f00db123f086', 1),
(15, 1406132848, 'ebff582b815a63d74c570932dfca159d877e0d44', 'c2bd0249ae45d533ea79dcaff7d8cd3627cd1de4', 0),
(16, 1406132848, 'ebff582b815a63d74c570932dfca159d877e0d44', 'b780c2f3e3d1db4e1d472d97cd889358233dac1f', 0),
(17, 1406132855, 'ebff582b815a63d74c570932dfca159d877e0d44', '752c3e87d531143cd20e01de0641b0984b038168', 0),
(18, 1406137851, '0', '4aa7fe15b57a6c0a651f95160da032281aee36bf', 0),
(19, 1406137851, '0', '94c32a374f56e5a1193a283636ff475814df98f7', 0),
(20, 1406137866, '0', '9ac5278a7023ceda4ad9943fee022efa625e9847', 0),
(21, 1406137866, '0', '74754cb7ce8ee325c8b8362e0762f7bea71ccbc5', 1),
(22, 1406139096, '0', '1b7e96d2011d12d3f11a5bd32442d93537fddfe0', 0),
(23, 1406139096, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b44e61ac6131541584baa6d65633b058e61af2c5', 0),
(24, 1406139103, 'eafc503940e57b973bf70d318dff7bfc041128aa', '584be8a6d4979d319c565ee19d28a1cc6d97c0b9', 0),
(25, 1406139195, '0', 'a82956e1ecc35d01e493a3fe06d766a8ca1840d1', 0),
(26, 1406139200, '0', 'db3064ccd3e1278e6077014e04d8d0a42e546382', 0),
(27, 1406139225, 'eafc503940e57b973bf70d318dff7bfc041128aa', '082b8a8ebc3f9f788d602d0a79a2ed6c7aa19371', 1),
(28, 1406139233, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7738b0edc7330f65e3f0feada0b11e737265d2de', 0),
(29, 1406139233, 'eafc503940e57b973bf70d318dff7bfc041128aa', '4be3d5180891c4776180e53d1bc81133e0544191', 0),
(30, 1406139247, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ce1189369fb4bca74f13b7577706938df43581d5', 1),
(31, 1406139262, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c643823276ce4add059844fbf9308ad5f104ece6', 0),
(32, 1406139262, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3a09bc827fa0ec3e89ca6518061d6c3d2fc96409', 0),
(33, 1406139352, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd02fa1977fcbc1c4ad1efbc5fd9f2c53b707e11f', 1),
(34, 1406139357, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e41a5fdb7811644a4730cc008cbb56908560e674', 0),
(35, 1406139357, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6b7bb8f2f86d9f5b4d91752fd22af86d3a846b18', 0),
(36, 1406139381, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a68eb8b9247e71a576b9e4a846f9369d594ebf71', 0),
(37, 1406139417, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b67eaf22661501ad75a64c30bd500df9e4d9c16b', 0),
(38, 1406139442, '0', '4a8154ff695e768da652b43deae370dcb08b0fd5', 0),
(39, 1406139479, '0', '27280bad4f6436b77bcc755b5d564af34962f7c8', 0),
(40, 1406139482, '0', '7106d407d1e366921089494d0b88400bafe8facc', 0),
(41, 1406139487, '0', 'e80a5b3f3ccd6382d7fb2cbe6b76617fffb5f579', 0),
(42, 1406139503, '0', '158b441634479cac8d6648af77a19693cd970300', 0),
(43, 1406139506, '0', '38057b3886c72dbf36cf3d66dc70d315457e9657', 0),
(44, 1406139508, '0', '1a3ac398d3a01aaf6c3f1f7f7a478398f45a2d2b', 0),
(45, 1406139538, '0', 'bad096c2e2164bdc7d24ddb95212226a075e577b', 0),
(46, 1406139550, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e5d3217626b077abe9a3e3b972cacb3f211c4871', 1),
(47, 1406139550, '0', '3a8fac0af7fbc7cbf675dd70c12b21183e2dc159', 0),
(48, 1406139553, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6c487146f633bece8f62d40b6e6ea7b2a4a4040b', 0),
(49, 1406139553, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'cd12def69357d51f282164ad57218047d7760586', 0),
(50, 1406139554, '0', '45eca4e284f48029d92f957568bf20f5ddfa48b5', 0),
(51, 1406139562, 'eafc503940e57b973bf70d318dff7bfc041128aa', '8d114482bba60697a76439d3aed3aeb32630ce6c', 0),
(52, 1406139562, '0', 'e7214476593f9f05d6cb863def11925a59619290', 0),
(53, 1406139570, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'dbd5113efddcbcb1a82c12c5879c54971cbcd380', 0),
(54, 1406139571, 'eafc503940e57b973bf70d318dff7bfc041128aa', '577010d4d93a73d36b7ba9215a7e0d37a4d4e412', 0),
(55, 1406139571, '0', 'aac1d4c2ce0adeab3a31c7dcfbd0aaacafa0aefb', 0),
(56, 1406139578, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ece6c2920be944e135c4cfb34063794619ab6fbd', 0),
(57, 1406139578, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7f229a3b282b2becff1b73ad1c1abb8622c2980e', 0),
(58, 1406139578, '0', '178804525bbd3b19c54d7b9100b9942cef178dc4', 0),
(59, 1406139583, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bf06d63a4266272e42b6060322e43de1088896fc', 0),
(60, 1406139583, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c232306f9af9a695e5812037bbd50c8e57fdc639', 1),
(61, 1406139583, '0', '597399f0b3eddb7dca8908d7cbebcf3b0e1d1ae0', 0),
(62, 1406139585, 'eafc503940e57b973bf70d318dff7bfc041128aa', '50be3286ddb85262453f66fbedf8c42ce5450ea4', 0),
(63, 1406139585, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e57216450c4bdfa1ffb0ba2f61135c9804bf01f8', 0),
(64, 1406139586, '0', '4875fb020bcee96c678c788b4799ad267c14c229', 0),
(65, 1406139626, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f84ec28929a3afd4dded3c442e020b7dfcfed138', 0),
(66, 1406139626, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'fb781870256edd5c854be7caa09e1e6e6fc2f625', 1),
(67, 1406139627, '0', '4501ff5a09c8173900705e3c1b007aa1a8119c93', 0),
(68, 1406139628, 'eafc503940e57b973bf70d318dff7bfc041128aa', '27662bdd3c0a78db03a018bf31a5c5b6d7c1d87a', 0),
(69, 1406139628, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'cf7ec458b5371e15522cabd379bddb4ff5543aca', 0),
(70, 1406139629, '0', '5b914b4be519cabd5fb9cb239828ba8e68f9d5ae', 0),
(71, 1406139633, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6375aa88634a7d039ae902b0a001e3aef019ede6', 0),
(72, 1406139633, 'eafc503940e57b973bf70d318dff7bfc041128aa', '775f2483ae5a7377589bbb01e2102fa51c222dab', 1),
(73, 1406139633, '0', '936d2cd718d0dd857a58b39c91cf643735d53d34', 0),
(74, 1406139635, 'eafc503940e57b973bf70d318dff7bfc041128aa', '2e6cbf2d58edade2d8a80395a6afa68e24dff0db', 0),
(75, 1406139635, 'eafc503940e57b973bf70d318dff7bfc041128aa', '25b0d8041e9488c949622cad64469c213414b8ef', 0),
(76, 1406139635, '0', '0de19356e70437ad1aa6f834b001f974129d98cf', 0),
(77, 1406139651, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9cbd37cbb94dbf6aff934eed3fd2d71cf9963f5e', 0),
(78, 1406139652, '0', '1a03f85546222837cc90734a081418f9462e536e', 0),
(79, 1406139669, 'eafc503940e57b973bf70d318dff7bfc041128aa', '48c64e70ba264361cb59075605c56a8a0ba06128', 0),
(80, 1406139669, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9052a7c4393a55c080fdea966fcc52d28acc79cc', 0),
(81, 1406139669, '0', 'f5904394981ed63ad3b465abc94837a7c27a0216', 0),
(82, 1406139671, 'eafc503940e57b973bf70d318dff7bfc041128aa', '0d6cb83d88311d32dd5f16d3cbc2c88baa06ccc3', 1),
(83, 1406139672, '0', '14759ebbc6c08e9d034e95cac00b8f6db1054cf2', 0),
(84, 1406139804, '0', 'f54669dde1c73c8699487a8442c20f64116cc0fc', 0),
(85, 1406140028, '0', '3a019cf8f1e541b8c42b370da53f2d402b6a9973', 0),
(86, 1406140150, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ed268183752a381896e1b08e77ccf5886bdc182d', 0),
(87, 1406140150, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9580fd23a992cb20a1506c32faebc5de9a49152b', 0),
(88, 1406140150, '0', '8668413b69d4fda2d01ebb8bc8ac10430189ed6f', 0),
(89, 1406140165, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5f74a656c324e25f25bbe4557f77081115f16585', 0),
(90, 1406140165, '0', 'c3cb973b285611536db404e003da77fa86729c56', 0),
(91, 1406140166, 'eafc503940e57b973bf70d318dff7bfc041128aa', '23e32e7a25e11a716fbb2488be91aa057aedad68', 1),
(92, 1406140172, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3834180384ecbfce9bd482200f291eb8209b1ec2', 0),
(93, 1406140172, 'eafc503940e57b973bf70d318dff7bfc041128aa', '374ff12632415a1917b9b79bd28bd9c827933901', 0),
(94, 1406140172, '0', 'cefeaead435e126f86e869983dda46c8ae8f9595', 0),
(95, 1406140181, 'eafc503940e57b973bf70d318dff7bfc041128aa', '68671238c8dc8d6766564af55a76c32ac8563f36', 0),
(96, 1406140181, '0', 'c30ef6dabe592a1793229a8bd1523684c02e86c0', 0),
(97, 1406140182, 'eafc503940e57b973bf70d318dff7bfc041128aa', '88c3059e3c7b6804735b8e91d033d970fd84139b', 0),
(98, 1406140192, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a59011ade66554b51fe5ecb007fe07586af17db6', 0),
(99, 1406140193, '0', 'a5493202719021db03252ffdb152064115a1858b', 0),
(100, 1406140194, 'eafc503940e57b973bf70d318dff7bfc041128aa', '097c2ea110de70f367542402e1c9e0c37432838d', 1),
(101, 1406140195, '0', 'd82d8dff9de9d294c1addcfd9e97f366907ade7b', 0),
(102, 1406140246, 'eafc503940e57b973bf70d318dff7bfc041128aa', '4c94c0d48d04eb0178e58d82a85ada4a4fee7c9a', 0),
(103, 1406140251, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c143ec07b59984ee2536ce65214c83b66661981d', 0),
(104, 1406140252, '0', '2734075b9b3da963e52b99ec6c7594f4e1350f10', 0),
(105, 1406140257, 'eafc503940e57b973bf70d318dff7bfc041128aa', '769775f9d610a113f49631eb2007de9fa3d935aa', 0),
(106, 1406140258, '0', '326be068345a256d3bb55ed010fe9876b478dbc6', 0),
(107, 1406140262, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'aa6a4223a3ce6570f6d06ecf292b5a8f8ffaed8a', 0),
(108, 1406140263, '0', 'a7595b0dae2d6fe7e7073cecb563bf0513cd455b', 0),
(109, 1406140264, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1f5d9e8d87874dfd2d725c26bfad0c73883d03c9', 1),
(110, 1406140265, '0', '8a41823789558464591818a45ae1420b2f4cec84', 0),
(111, 1406140274, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5ed81fc30e0a7b783f7f108e469c272dabeb1a24', 0),
(112, 1406140274, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'db04498da1fab9abf88227c3d15936c78f39d71c', 0),
(113, 1406140274, '0', '2d280559d2d209133900e9b10703c8bbff254704', 0),
(114, 1406140278, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6a132e8f974d011dcaca956c132f05f57cd7bfec', 0),
(115, 1406140279, '0', '9d09ffa61a9197cd456e37f97727369aefa9df78', 0),
(116, 1406140283, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1f34e03ded5d883a0f024c6895ecda454d6b2193', 0),
(117, 1406140283, '0', '13bc6d55b082ba599cf4f3029d45d1ba5ab0ef03', 0),
(118, 1406140300, 'eafc503940e57b973bf70d318dff7bfc041128aa', '408a2cead18243c4568e664c7536682b2bff9749', 0),
(119, 1406140301, '0', '85174c27d29b031cad070e5f96840f2ebce36301', 0),
(120, 1406140315, 'eafc503940e57b973bf70d318dff7bfc041128aa', '00972fdce09ebf2c7fc18a83ce1ba55a59e14203', 0),
(121, 1406140316, '0', 'a8426a037568a5e31ea20bfd72b615a33d428139', 0),
(122, 1406140324, 'eafc503940e57b973bf70d318dff7bfc041128aa', '999e632a8f7b70d7dba7fe81595cbaf8bb848c34', 1),
(123, 1406140324, '0', '43ab354fe04bd03926c7641c67bcc049534b4924', 0),
(124, 1406140326, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'da5d353b1b3cde1cee912f13e8232c764a016041', 0),
(125, 1406140326, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9dc06b60b270bb03fdcc56e5b0773e1beefedd56', 0),
(126, 1406140327, '0', '5573f798df7cb9a75d5bf55e896a847cd0e9edce', 0),
(127, 1406140335, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd921c9ea66851f7fac9a57aa452beae41226e250', 1),
(128, 1406140336, '0', '517cbfa01382241dda1706c28033a4c78746e9d3', 0),
(129, 1406140337, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f7838d899d824cafc580dd461a47b1bc97fd8e9d', 0),
(130, 1406140337, 'eafc503940e57b973bf70d318dff7bfc041128aa', '21529ae6a3839210d0c337d4af2bc834e80c4d2b', 0),
(131, 1406140338, '0', 'f975f7b97632577e0bfd58b187dfc7de5e541011', 0),
(132, 1406140379, 'eafc503940e57b973bf70d318dff7bfc041128aa', '493be9343e88a576ba037ddec385d74bb47ec069', 1),
(133, 1406140380, '0', 'b819a4cb80a3631976770aae23b1f90541751d52', 0),
(134, 1406140381, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7b62cf27323f5972568126c0b244afbb7101374a', 0),
(135, 1406140381, 'eafc503940e57b973bf70d318dff7bfc041128aa', '217046c046cc443e62105e09ccf69b3f5bce639e', 0),
(136, 1406140392, 'eafc503940e57b973bf70d318dff7bfc041128aa', '19a399d33c321d6a9b3f51ee53e559fc4a67407a', 0),
(137, 1406140392, '0', 'c7c9edc65c32645787c88269590a8cd5f274e4ab', 0),
(138, 1406140523, '0', '96e7e74d970949cc9758fc271f5b4bfdb6dc280f', 0),
(139, 1406140524, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'aeb91aa6c21b2744531ee44aa49830ade9ea18f2', 0),
(140, 1406140524, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a1f824760892961d861fed041b0f4f2ebf3b08a8', 0),
(141, 1406140525, '0', '3bcbe3f0ed63cfb2f8f8719ee78140e661efc804', 0),
(142, 1406140538, '0', 'e464e61aea4610c719ab66b729d506446e48619e', 0),
(143, 1406140540, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'dcfc352936aa0f013cfe0925aeac20f3d98dbfdc', 0),
(144, 1406140540, '0', '4f540dfdf00ca38aef19bb427eb674f86e63909c', 0),
(145, 1406140542, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6bb5834f2f3830e6709afdba53df8ac6213bb13e', 0),
(146, 1406140543, '0', 'b362daa47ff9bace91a225aa614eee1caa600fbd', 0),
(147, 1406140553, 'eafc503940e57b973bf70d318dff7bfc041128aa', '758ee1fd8ca99da6229d3fbc43df391e98e80646', 0),
(148, 1406140553, '0', '7fa86b8326fb0e50b52608b384be1176ad07a7e1', 0),
(149, 1406140556, 'eafc503940e57b973bf70d318dff7bfc041128aa', '21b534e35687eeb5ad13b994ba6572fea5544183', 1),
(150, 1406140556, '0', '8174441b481b98729a4a183c8e788c4aa0ccbb99', 0),
(151, 1406140557, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c1f789579f13b755ab6d46f1d66a78cd8b453cc8', 0),
(152, 1406140565, 'eafc503940e57b973bf70d318dff7bfc041128aa', '4b9f9eb64856dfe096c2be37330ae5ff32194631', 0),
(153, 1406140565, '0', 'fef1e5e89a60da728f5e58280c88a21ac9955f55', 0),
(154, 1406140568, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9e6436ff9e1f35c7fad154323ad7bac2d6ab42a3', 0),
(155, 1406140568, '0', '9c3466685777cfbfba98d2212d719cb8cddcdec2', 0),
(156, 1406140568, 'eafc503940e57b973bf70d318dff7bfc041128aa', '2b97a8d707ee764dda8ea54bcbfef08a3c6d4979', 0),
(157, 1406140572, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f9d29b5662ac4f3cbd953fadddf18bf2148f9c3e', 0),
(158, 1406140573, '0', '7e392d9faad62c0464b5953c72b6da5277ae7216', 0),
(159, 1406140578, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'fb90406a3f108387689d4aadbee9a1bb7788b8fd', 0),
(160, 1406140578, '0', '7182589f96b698424992e740e4c585c7dfd719a1', 0),
(161, 1406140597, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ccf6f58abcc878dc15068e63887860d20b4949b6', 0),
(162, 1406140597, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b950bd8f4851f69249c5304636f2978248068d11', 0),
(163, 1406140598, '0', 'ed4c7f02f127a9ca956dd109610818a75b73624e', 0),
(164, 1406140600, 'eafc503940e57b973bf70d318dff7bfc041128aa', '4795904fc885a9c781206c4c47c537adb5a6e300', 1),
(165, 1406140600, '0', '880f3886d4617779e219278b50131e36a499626c', 0),
(166, 1406140612, 'eafc503940e57b973bf70d318dff7bfc041128aa', '8b486e749a450d729703e43457a75f7afc64bbc3', 0),
(167, 1406140612, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1e79c14a8f1dbd65234ae16b2a55d752bcaae678', 0),
(168, 1406140612, '0', 'bbe44c0b8f67d54a29e85d729b853f8aac9da913', 0),
(169, 1406140615, 'eafc503940e57b973bf70d318dff7bfc041128aa', '405fffffa9bcbc1aba81cde44977f4d1be25fab9', 1),
(170, 1406140615, '0', 'b3facba0da53beab3927d6c78a8ee07c6e6b59c6', 0),
(171, 1406140619, 'eafc503940e57b973bf70d318dff7bfc041128aa', '84f84702e17d23dbeecad5e258990f465e97fe72', 0),
(172, 1406140619, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a57c8d02d49ffa28ee90bf891d3cd5ab03673816', 0),
(173, 1406140619, '0', 'e2cb1787d104cb1d57504749cc58a8ef8b93efd4', 0),
(174, 1406140621, 'eafc503940e57b973bf70d318dff7bfc041128aa', '025224abdeb4524608d480430c0bc7fcae6e02e8', 0),
(175, 1406140621, '0', 'b4ddf635be7c5f4545d3911c14abeea1a89c5e06', 0),
(176, 1406140623, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5af3a55f77f07cfb818b57b72b533a2677ebffda', 0),
(177, 1406140624, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ead55e34d3f3f51367d5caa8a7467f7c2e2202e7', 0),
(178, 1406140624, '0', 'cddfed0afb2cd547282e07c579326f5ca699b710', 0),
(179, 1406140630, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b1d1587cccba8f148961fc9d1d8ed4b47ecb6e06', 0),
(180, 1406140630, '0', 'a98b43f82aabcd54dadc9838f825f55686ae4e06', 0),
(181, 1406140632, 'eafc503940e57b973bf70d318dff7bfc041128aa', '2ac4a31ed1fbd8f609f70e5545daf10ed40a0c0d', 0),
(182, 1406140632, '0', '34b280cdeb0f2ef832ddb467bd6a90f8d0f02aa8', 0),
(183, 1406140633, 'eafc503940e57b973bf70d318dff7bfc041128aa', '774bb628e7b111f7d1cfeee3b4688599f19371c8', 1),
(184, 1406140659, '0', '2039253dc9e57a752db802ef03dc3b5c2616c4c0', 0),
(185, 1406140669, 'eafc503940e57b973bf70d318dff7bfc041128aa', '8386753882a33ded217def611f6df5ea5300f3bd', 0),
(186, 1406140669, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f2206079a7321405730b486a9a18200a398b6b44', 0),
(187, 1406140669, '0', '4e45e5824e3e26b2d64772c2cf10549e8e62cefb', 0),
(188, 1406140672, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e6ef7b9d9a16d6c1a077f91ee093e5d412623b73', 0),
(189, 1406140673, '0', 'd8f6516033425353763f2a4d8abe98627a0cd9a4', 0),
(190, 1406140679, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'df992f95498a55833db257369d859334bc333eae', 0),
(191, 1406140679, '0', '1d573af085395583f38cc61c13a4cccd83eac6cb', 0),
(192, 1406140681, 'eafc503940e57b973bf70d318dff7bfc041128aa', '060120f8c8e4f016784612d8fbe7ac04c40fae0b', 0),
(193, 1406140681, '0', '0a0c32cffbfe761a0047c26c01bc68fb31de04b9', 0),
(194, 1406140682, 'eafc503940e57b973bf70d318dff7bfc041128aa', '28fc25c12c5c93661619966bcbc249acbfb06738', 1),
(195, 1406140704, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6b8e0e1fa31f075d9536cf7dbf38ec41c6e8b485', 0),
(196, 1406140705, 'eafc503940e57b973bf70d318dff7bfc041128aa', '93e1c1e4ddd74952a7155b1b4c55c20ac88500b2', 0),
(197, 1406140705, '0', '118672fdd4d88d3820d8ea7c16134108e14f96a6', 0),
(198, 1406140707, 'eafc503940e57b973bf70d318dff7bfc041128aa', '23a4913160776f04e79810d8edafc59c2d9b5fb5', 0),
(199, 1406140708, '0', '6437f8a224b372f11b685c979d43f9611a6a56c9', 0),
(200, 1406140712, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b9b144e3f8334f6d52d4d2833eebf6f3c2bcd75f', 0),
(201, 1406140712, '0', '8449ebcc11d2126b8bf10fb5b42ed4eb1fb9cbb3', 0),
(202, 1406140712, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bf36e80cb39752b52d75ea401905e6853c63e4c0', 0),
(203, 1406140719, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6b1cb8de2e63bacb861f04fdca43308d489341a8', 0),
(204, 1406140719, '0', 'a5684c56b0e0d3b4e32aec6482b58f7674d10917', 0),
(205, 1406140723, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9631a5311e84a32c8987477e767c909031b588f1', 0),
(206, 1406140723, '0', 'ea72f9b0701b917fddeee1498c715fcea524f9f9', 0),
(207, 1406140725, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'df8843f021cd594035255d9c94ae95d951a8b6da', 1),
(208, 1406140725, '0', '45feddfd1cbc2acc6f14e606611bd1e7a5fd9f2e', 0),
(209, 1406140735, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5584b339b7573d5f3f6ef382edec203d6b094464', 0),
(210, 1406140735, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5cee54372a5eab1ec158518949505ccc512af69b', 0),
(211, 1406140736, '0', '734c31e89b95ec88eabd3677dd8252faf884aa95', 0),
(212, 1406140738, 'eafc503940e57b973bf70d318dff7bfc041128aa', '143aa685f0323708e994ee8ff38d22cf82666d5d', 0),
(213, 1406140738, 'eafc503940e57b973bf70d318dff7bfc041128aa', '14bae396832c7f2f5127afddfddcc630d651fed3', 0),
(214, 1406140738, '0', '54ea11043a74f19aa9303b96d4822c215c2a95d0', 0),
(215, 1406140749, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd32d41536b72f6e5e86f591528938856dc58d870', 0),
(216, 1406140749, '0', '86018b62561edc1a60689b1be88461149ebfc033', 0),
(217, 1406140751, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bee3f95c23ef02c13e07b8d7664ef890ebcd1a0a', 1),
(218, 1406140751, '0', 'ce1e371cb5ff3e9e551910bf99a3b24ab1e04dc2', 0),
(219, 1406140765, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6912a5d549d4cef7599478987f64b9c4b46a2c98', 0),
(220, 1406140765, '0', '561b79bb421423ac5fa5832a7cd6ef7b9a1314b1', 0),
(221, 1406140768, 'eafc503940e57b973bf70d318dff7bfc041128aa', '84bb2d6ea15501a7fd2b2bbc1d1388da9b76f8a8', 0),
(222, 1406140769, '0', 'b74cefa6d9ddb291154d34adc85f7506cfe31cf1', 0),
(223, 1406140771, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'dd772c2eab7dc669095b98d8aec646755c24c51f', 1),
(224, 1406140772, '0', 'e64c7c6fda51fc11e7ecc8c77695e167d58e4f35', 0),
(225, 1406140792, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f1c1795cba653373cd736f1ff8ff4b7414c7f64a', 0),
(226, 1406140792, 'eafc503940e57b973bf70d318dff7bfc041128aa', '58d425bf1cc1e44b1a2c8abac2e86a9f4e2f9526', 0),
(227, 1406140793, '0', '022146d2f7eccb17dde752d72181a2b513c77180', 0),
(228, 1406140800, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3a73f9d4a46b3055072c816af82e8609b5afc6b2', 0),
(229, 1406140800, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ae58c82542009fff3fdb79751f49473e936c9a83', 0),
(230, 1406140800, '0', 'c7c171764e93eb51b1eae47b0ca5e450557c37de', 0),
(231, 1406140817, '0', '602d7266c44080350b5b954f09ac9d8ec4a4c20d', 0),
(232, 1406140834, '0', '8880bf4a51066f0c3e5ab1911e2c9715eb3ee5c4', 0),
(233, 1406140836, '0', '58c238074115d77497a8aa3a181140ebe4257bbf', 0),
(234, 1406140847, 'eafc503940e57b973bf70d318dff7bfc041128aa', '68f522942c9c2041f749994fb341359822850698', 0),
(235, 1406140847, 'eafc503940e57b973bf70d318dff7bfc041128aa', '070df233bd020cdd00360ef69802ea363d6fc762', 0),
(236, 1406140847, '0', 'de90469133984526fc32daadff43250341fd8044', 0),
(237, 1406140850, 'eafc503940e57b973bf70d318dff7bfc041128aa', '46d6b78b68055db6043adade38c513dc0dd5e687', 0),
(238, 1406140851, '0', '4e2bcff5c36a98f7f99b15d6287243bba945a245', 0),
(239, 1406140851, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ef8625b68ad654084f4145997c9001289e09df4b', 0),
(240, 1406140855, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b7d9a2a8701702e53756a7819f8572aef09e1fad', 1),
(241, 1406140856, '0', '4bb2d5a7a2dfaaac93717a6d332191ce82306949', 0),
(242, 1406140858, 'eafc503940e57b973bf70d318dff7bfc041128aa', '52ff329b1668ab9e2c0a6d05980d36b08bc1610d', 0),
(243, 1406140858, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a0baa09d59ad8d3a23753e2c1203888442693397', 1),
(244, 1406140859, '0', 'e6f516fcac48f3abe24a3abea6999e26e10d27db', 0),
(245, 1406140860, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9b6f5dca90cf37fbaf77705d419dd5a24d0feb30', 0),
(246, 1406140860, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd8bbfd9716174e32ecb2091ccfd84bbfc17b37aa', 0),
(247, 1406140861, '0', '6998a87d6c2ed0dce5cd7942de52a62eccbab54d', 0),
(248, 1406140863, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd1715125ddc099383517b8d3857dbdd3aa9a12f8', 0),
(249, 1406140864, 'eafc503940e57b973bf70d318dff7bfc041128aa', '79d7fa9c14abc0f55ba437ef67adb89a39c64fd5', 0),
(250, 1406140864, '0', 'adeacdfefa2546c00f1749489099268820e51470', 0),
(251, 1406140867, 'eafc503940e57b973bf70d318dff7bfc041128aa', '250b8cbc3c0a9216b458dab24bf6ca3fc17914e1', 0),
(252, 1406140867, '0', 'b2f53912da99f139cefb2b270cb1d5e325d52ffb', 0),
(253, 1406140870, 'eafc503940e57b973bf70d318dff7bfc041128aa', '91359ad433176e023d893c3f08b32631e16b8b63', 1),
(254, 1406140870, '0', '359f04ec2992d8b9ff85efab4853bce9cd271760', 0),
(255, 1406140873, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'df58d4fe406a94b8e831afa0803b26d821635190', 0),
(256, 1406140873, '0', '1b43259e816ff926731e27d05d5f7d9aaee29710', 0),
(257, 1406140876, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ac557c662c2c44929df7fd7365451cac49693e76', 0),
(258, 1406140877, 'eafc503940e57b973bf70d318dff7bfc041128aa', '16ca10bacbee14f60dc9f3012db06a0a4f601d67', 1),
(259, 1406140877, '0', 'ac126acd02fd00c32965c6221103e830c0051f29', 0),
(260, 1406140878, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ba0736cc28d6cfdf6814376e27c60724222b40b9', 0),
(261, 1406140878, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd0f644b3e523f64e9324d5297ffb63a357caad0a', 0),
(262, 1406140879, '0', '0919b6aa01ef6e7d689cc488351def8e1d5b09dd', 0),
(263, 1406140881, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c87ae4534eacd17a5386dd43dde557caa445d951', 0),
(264, 1406140882, '0', '87b8bb2c1f090780b523da27523f9496b9e8dbee', 0),
(265, 1406140885, 'eafc503940e57b973bf70d318dff7bfc041128aa', '801e997d1d6b80559f854aa1451efba7bb60dfc2', 0),
(266, 1406140885, '0', 'e5ca95a987d98d1e44025f370ebc165201bffe05', 0),
(267, 1406140886, 'eafc503940e57b973bf70d318dff7bfc041128aa', '045a654dee3d22886b2b03c42a17fdffc1fd8fca', 0),
(268, 1406140887, 'eafc503940e57b973bf70d318dff7bfc041128aa', '07cf99bc3a088626d24d57bb274cba6b8b0f04e9', 1),
(269, 1406140887, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'fdb2298de7cfd8990e98bad15fad185696755e32', 0),
(270, 1406140887, '0', 'f93b5599919f42f8faff8f3cd0cafff877360b0a', 0),
(271, 1406140927, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'cf03c14498dd3db69d8c125412ea179fc6a00c82', 0),
(272, 1406140927, 'eafc503940e57b973bf70d318dff7bfc041128aa', '0ddf5f8780ee925b3d8b11938dc165be9155c7ca', 0),
(273, 1406140928, '0', 'ffae1036c7315592fbb8d10cbc528739ff144a1b', 0),
(274, 1406140933, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c512ccfc18721449d7bcb48febf4b8cec13936c0', 1),
(275, 1406140933, 'eafc503940e57b973bf70d318dff7bfc041128aa', '37f2ea4536965fea2e95787ea7b79d62c5938157', 0),
(276, 1406140933, '0', '60b226ca7947a7c2c98e2d7720c6720ad6e5b40c', 0),
(277, 1406140951, 'eafc503940e57b973bf70d318dff7bfc041128aa', '21c57f54552c11afddeeeb10500b2ba068625ab4', 0),
(278, 1406140952, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ce0aecf37569c7fa4e5a67c0f7a8cb5bf8597502', 0),
(279, 1406140952, '0', '110f098120f383674a3741f8e2967992c45ee8d5', 0),
(280, 1406140961, '0', '1cc52c4d647a0813b216ac2deb4da468f30b3f37', 0),
(281, 1406140971, '0', '13ada47d35c2f336df1120f8ec8756094a9c8034', 0),
(282, 1406140972, '0', '9fe39f44fb7c547b9b213703b8d752fc1b942524', 0),
(283, 1406140972, '0', '3b40e67e1fdb1af122716ba13fb6cd5280e84279', 0),
(284, 1406140973, '0', '7547b207703caf9376258aa3a364eaf3f7a20eb9', 0),
(285, 1406140973, '0', '5944880989ee2cebd3195b4b8683949610261c08', 0),
(286, 1406140973, '0', '5521d267e9dc0683ef2e1cdf3b10219201a8240d', 0),
(287, 1406140974, '0', '137aebf97bf289facd973c766e7e8173ace18d50', 0),
(288, 1406140975, '0', 'e27e6fa862f37371f1daff494272f1039615515e', 0),
(289, 1406140975, '0', '67b9a367a71c71aee9ab222deae50768bf884480', 0),
(290, 1406140975, '0', 'b7b60d662f6af3c5cf2bbb24cb9624b21f42abc4', 0),
(291, 1406140975, '0', 'a8095fbd0aeb89f1bc10b9f129750ee593a8809c', 0),
(292, 1406140975, '0', 'a15ffd3aa9760c9d18589fe3d5f4314e455826c4', 0),
(293, 1406140977, '0', 'bb1e28f3f9d41aa9c7acc1617ed6c9e549287871', 0),
(294, 1406140991, '0', 'b06d71f6c09bcb2e2aac889c0dac6bb906a593d9', 0),
(295, 1406140992, '0', '1879cef5abcf7701e7eaf67c3eb50b16ab242a09', 0),
(296, 1406140993, '0', '415f4c4db487421993fb0ad9de724192512d2ffb', 0),
(297, 1406140993, '0', '96190b66dbee4e98d0be94706383d22d549c2381', 0),
(298, 1406140996, '0', 'f6acf57bff51474365badc1c9b45592bc5cbab54', 0),
(299, 1406140996, '0', '3a05dad560fd55c3edde0d69adfd1a3cfadc1ce6', 0),
(300, 1406140996, '0', 'bf36aa30c9940574f5c3ef5748d31cc7743cb6ad', 0),
(301, 1406141002, '0', 'a132313581829310dc07141e0f58852b380d36ce', 0),
(302, 1406141007, '0', '5797e321966daf69e3aad3efb7ad4e5f20bed1f1', 0),
(303, 1406141007, '0', '1e5f930dc1e279a6eaa7bfdff256e6f0be29c489', 0),
(304, 1406141007, '0', 'f68587048319b9eb9c8a13565dcb044c32ce9c86', 0),
(305, 1406141014, 'eafc503940e57b973bf70d318dff7bfc041128aa', '061c98c2ffb4b5ee9508f0af73cce93af8f4e8f4', 0),
(306, 1406141024, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a33d7c981a31e228c566637b918c67f8c483c2ec', 0),
(307, 1406141024, 'eafc503940e57b973bf70d318dff7bfc041128aa', '951161b07817433042f4fcfa4c97f31707875208', 0),
(308, 1406141024, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ef0c7417f92513a3f41469afc1ee5c3ac1cb553f', 0),
(309, 1406141054, 'eafc503940e57b973bf70d318dff7bfc041128aa', '18cf33d65f968e832e0dcd9a0e446b32ba8391c1', 0),
(310, 1406141060, 'eafc503940e57b973bf70d318dff7bfc041128aa', '590ac388ab96a0aa2cdf06261eff58ad573f292f', 0),
(311, 1406141079, '0', '6b57dc0c8cd0fa57c0893f80cc26d92d3b23bcf3', 0),
(312, 1406141079, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a4ac3335149c77ec9ee7dc58f946e1ed9f1612d1', 0),
(313, 1406141081, 'eafc503940e57b973bf70d318dff7bfc041128aa', '64e58f8ae3a1d3d0c977840741cee309329e9358', 0),
(314, 1406141081, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'fd1c1894b0d328a1ebb41711590fb792fd386a4e', 0),
(315, 1406141084, 'eafc503940e57b973bf70d318dff7bfc041128aa', '8868fa01d9a69a4091d0f4e0a399711a42524437', 0),
(316, 1406141088, '0', '169df1138ef22b62f52b7c5e02ae74ca7f7c37fd', 0),
(317, 1406141089, 'eafc503940e57b973bf70d318dff7bfc041128aa', '542fbca71d5844dd6f515ff1cf3ba0af434559e2', 0),
(318, 1406141092, 'eafc503940e57b973bf70d318dff7bfc041128aa', '630ae36d9f80238388ea004438b5ba0bd8075b77', 0),
(319, 1406141094, 'eafc503940e57b973bf70d318dff7bfc041128aa', '77b2284addc0fe99ac262483bf7bf5230138ef0b', 0),
(320, 1406141094, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b7c0b074006e158d0d077107e9b337df76f3a0b9', 0),
(321, 1406141094, 'eafc503940e57b973bf70d318dff7bfc041128aa', '254ac4af6bcb6922c56dbe9f1f7ee28798594027', 0),
(322, 1406141133, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7f971f295dda6d29d65b5c5ec334ca02d4ee7670', 0),
(323, 1406141134, '0', '4079da0d0a09b4b75a733e43c98a7e622f5b55f4', 0),
(324, 1406141140, 'eafc503940e57b973bf70d318dff7bfc041128aa', '2dfba681c4bcf701b130d2141282a79bfef98051', 1),
(325, 1406141140, '0', '3eb68f4fb3177d66340fb4c78f1cf5f432745169', 0),
(326, 1406141144, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'facbc2bdb33351131539b4a2e9ca08f5e453f443', 0),
(327, 1406141144, 'eafc503940e57b973bf70d318dff7bfc041128aa', '669e5a69cced213cd42a7b52840eb113548f528a', 0),
(328, 1406141144, '0', '7a080a99ee74d9cf91980c1acbdcb97b7c133b98', 0),
(329, 1406141147, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e8347621228c17d13f5912a47b98515dd8e3396e', 0),
(330, 1406141155, 'eafc503940e57b973bf70d318dff7bfc041128aa', '2919346ca76a8d92a4d772168e5209c48fb9dcee', 0),
(331, 1406141162, '0', '0d76fe09ed5c84bcf3c6fda14072c14197bea163', 0),
(332, 1406141168, '0', 'e9df8b601d6a8823e70d1e7f6c41f2581e71f734', 0),
(333, 1406141169, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3881a2a7399839ef41279037d88f8fe1a7f7f19c', 0),
(334, 1406141193, '0', '82f4c39c6a4eef650de475f53bca01e45c6a2bf7', 0),
(335, 1406141194, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1ca829b8ff54428b3e867df297e04e1922b63036', 0),
(336, 1406141197, '0', '958c990f844aed60b80ddd3443f50a8d541c1208', 0),
(337, 1406141201, '0', '69e2116d07fbe9dac31c9fb11e8fc16ef45785c3', 0),
(338, 1406141216, 'eafc503940e57b973bf70d318dff7bfc041128aa', '27b4876d4d7d011d66cf443926e2faf2674e46e2', 0),
(339, 1406141218, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a19e2908b030c871ce9afce3c4d4a56a6241b88e', 0),
(340, 1406141218, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3391d5cc93e0ae39636bb88a15ac9111284f9838', 0),
(341, 1406141226, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c844c0ff65f11d10c47e5f84628f404131a390e3', 0),
(342, 1406141227, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c58372ef5304c3105fae951db0aaedf19282591d', 0),
(343, 1406141227, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f68bc2c2847048e7de22f33cd140511b49a11406', 1),
(344, 1406141228, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b24f6a6601c2aaaa19736f377e0edf407e2004d3', 0),
(345, 1406141240, 'eafc503940e57b973bf70d318dff7bfc041128aa', '45ad5a6d6126f3dc2f7c9052e94c7b8c1d8533f0', 0),
(346, 1406141240, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bb74c245eab322fc84b79c6637e5ac01c406ac97', 0),
(347, 1406141242, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bdfd78e2f6248cfe70b59f52ccd337c4338a20f9', 0),
(348, 1406141243, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ce74e87d3265b8be22e4b83c615e3d9846ebf413', 0),
(349, 1406141245, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7c687e23ac13351f6698afd323784f001e0922fa', 0),
(350, 1406141248, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'eb7f4197d6e49edfcb0a2818d3b133fa0fd93193', 0),
(351, 1406141252, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1edea7e6aac0f55be594f84264fed44d61ed73b9', 0),
(352, 1406141252, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9b66146a20e93a506b0355fcd2ddbd0dade944e8', 0),
(353, 1406141276, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'cfeb2f89553eae636774b567ea2ff63ce1a6e354', 0),
(354, 1406141279, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'cc5c18a02ebbae996a8b2610f74f00be681c4582', 0),
(355, 1406141282, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7156d953cceabbf5fb9a3db53e53f11d7ede2294', 0),
(356, 1406141286, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f4b9f61a55a52bf90a8f5eeabc97153061aae741', 1),
(357, 1406141319, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5558a37d1ed79706f8fd8cad3f2570078780f96b', 0),
(358, 1406141319, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6d587bcff3f0249dabf9103507fcc74c74f25c60', 0),
(359, 1406141320, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a275cf30e11700e9cfaf1d21fed52a3db0ee598d', 0),
(360, 1406141324, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1b3ea2b06ce8d851c2d64b5c5fc8ee34f8613fe6', 0),
(361, 1406141326, 'eafc503940e57b973bf70d318dff7bfc041128aa', '319445228b3130d8beae71760ea1be7c03eb903d', 0),
(362, 1406141330, 'eafc503940e57b973bf70d318dff7bfc041128aa', '4013dc74bd42475ba803434c0558b8ca4ec7e8c2', 1),
(363, 1406141330, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3db1535590acbe5425f4e4c216155b92b585a364', 0),
(364, 1406141334, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1f9c334ccf1de32a69a7d2557fb508aa7564537d', 0),
(365, 1406141334, 'eafc503940e57b973bf70d318dff7bfc041128aa', '1132a3ff7acdb1ce14cafd97371324ff7725db60', 0),
(366, 1406141338, 'eafc503940e57b973bf70d318dff7bfc041128aa', '329a4f3e65ac4f93fbd2433602bf9bf0f121b502', 0),
(367, 1406141341, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'bcb17d9f2ce656326bb6a1ab1ba85793bc1467ed', 0),
(368, 1406141343, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9762866df3237a2da88a0fd74336357e90173200', 0),
(369, 1406141344, 'eafc503940e57b973bf70d318dff7bfc041128aa', '280c29fc12d12ac903ffb4a876f6ff1a391baa55', 0),
(370, 1406141369, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6a5356dd8920b28d27d6547dd460c7a504baf2d9', 0),
(371, 1406141419, '0', '7b829bd02b5a8d0f9b12ac02f47a16e8aed15311', 0),
(372, 1406141422, '0', 'f640a673f61dfb75caa51cf1e77ee94cb14a50ea', 0),
(373, 1406141436, '0', '809c69ff1cb2c505b0f3773f5efd3cb3e9213902', 0),
(374, 1406141437, '0', 'c30864aa5c5d273ddd569df672afc9314f4ebf30', 0),
(375, 1406141440, '0', '336af1b851489ec3e7eb4ba8cf2fad89829fa4b9', 0),
(376, 1406141441, 'eafc503940e57b973bf70d318dff7bfc041128aa', '9bab489ffa91a84fc3b53e5ddaf30cab6665950c', 1),
(377, 1406141442, 'eafc503940e57b973bf70d318dff7bfc041128aa', '28c7b1a83f7faa7e53363d7a227dbb8f15c9f020', 0),
(378, 1406141442, '0', 'b2ab19a99ad0afbdde13d6ba55860319d5c4febc', 0),
(379, 1406141485, 'eafc503940e57b973bf70d318dff7bfc041128aa', '75db864f6cd21912b16e8190327cf684b66f3bdc', 0),
(380, 1406141485, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'af54340153b9626a83cf8a3529821a395bd33b55', 0),
(381, 1406141485, '0', '89079990a181be4ac6639774184e8f6a8679f714', 0),
(382, 1406141488, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7aa7a1a4a01eea1e77cd50ef9aa041e2ab471447', 1),
(383, 1406141488, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'e0f6e18301176788d45b7044cd2f9d2132569175', 0),
(384, 1406141488, '0', 'ca7bf8ca03d535edc87cafa13c74bb8a2284a37d', 0),
(385, 1406141502, 'eafc503940e57b973bf70d318dff7bfc041128aa', '101753c1a8b07ace0089ddf71c77d0c7f0f216f2', 0),
(386, 1406141502, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a1709a0c6698a92db8522711c2e1a8a59450d133', 0),
(387, 1406141503, '0', '52952d6527ba7a1fe1f871145e3c3ea665c306e4', 0),
(388, 1406141505, 'eafc503940e57b973bf70d318dff7bfc041128aa', '7438669d59d29e703bd063177f8bc27b8803da79', 0),
(389, 1406141505, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'b4717214d56554baee763a5f33aa28cea3f5c499', 0),
(390, 1406141505, 'eafc503940e57b973bf70d318dff7bfc041128aa', '16daa8de57fb588fa7b9bb204286a1c06d677869', 0),
(391, 1406141505, 'eafc503940e57b973bf70d318dff7bfc041128aa', '918cae98ef16ba551a5d05ff009418f51ed5a167', 0),
(392, 1406141515, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f68062b27c57ca3359f9c661597a6592020e6a42', 0),
(393, 1406141526, '0', 'da1a562a1fa561afdb3b514ed15f322a28e4ede8', 0),
(394, 1406141533, 'eafc503940e57b973bf70d318dff7bfc041128aa', '843d9c3514c848211fd2ef0bb3d81d54cbd1d5f1', 1),
(395, 1406141534, 'eafc503940e57b973bf70d318dff7bfc041128aa', '695d7448c1781ae5eb46c7ec6881b154f59d616e', 0),
(396, 1406141534, '0', '198790f1ca5573080422fbd6a8e7ee9bfa8c2351', 0),
(397, 1406141593, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6165597f5595a771e76f48fd947b0ce6d52153ab', 0),
(398, 1406141593, 'eafc503940e57b973bf70d318dff7bfc041128aa', '565966540f6311f27d7b10faba04f8dae546855a', 0),
(399, 1406141594, '0', '7ad0b0075085cae6d0daea825ca52b44cb715e85', 0),
(400, 1406141599, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'a18d02ce4cbd858e96da341ac372f0c0c77d9a1f', 0),
(401, 1406141601, 'eafc503940e57b973bf70d318dff7bfc041128aa', '641881c707fbf445f72a507bb978e1ec4bb1589c', 0),
(402, 1406141603, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'f2062bc7b6d6d1d8408aca9cad27b71204a818fd', 0),
(403, 1406141608, 'eafc503940e57b973bf70d318dff7bfc041128aa', '32e6fb7aff41b7d0d7d440ba797f8ff0cb45050c', 1),
(404, 1406141608, 'eafc503940e57b973bf70d318dff7bfc041128aa', '868d1e34c26a429e6eda619be36a8bb3f814ec14', 0),
(405, 1406141608, '0', 'efd6cb4af4db7eccd3abb5a0dd3a85b4493654a5', 0),
(406, 1406141614, 'eafc503940e57b973bf70d318dff7bfc041128aa', '375352f54b939fb03a691efb492c24030d0f2dc6', 0),
(407, 1406141614, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'be47cefb6e79cd8ed636edd41b7f74e5c5dcac19', 0),
(408, 1406141614, '0', 'c230fbeadec66d5f188bd1ccd33a301a60d4bdb4', 0),
(409, 1406141617, 'eafc503940e57b973bf70d318dff7bfc041128aa', '5ac55c32c54665be616f89a699e7af81cde4767a', 0),
(410, 1406141622, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'aef95c168a8c0ea87fa24f0bb161b2e054f8a027', 0),
(411, 1406141632, 'eafc503940e57b973bf70d318dff7bfc041128aa', '0bbac7c1c2d895284eefb4dcc2b8a9a38243311c', 1),
(412, 1406141632, 'eafc503940e57b973bf70d318dff7bfc041128aa', '3d253ac5ffaa6b3481816536fce98176b8479909', 0),
(413, 1406141633, '0', '9e0cd18360e03c4702b2e2b2ddcc324d5b601d51', 0),
(414, 1406141661, 'eafc503940e57b973bf70d318dff7bfc041128aa', '60dd0320c6e5f02f708e072288062d38680d9bb1', 0),
(415, 1406141661, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd8df75e0b06ba7d418da04e236823a84bfb20a96', 0),
(416, 1406141661, '0', '4432b381cf687703cc61226b09fcfcbf73befcda', 0),
(417, 1406141665, 'eafc503940e57b973bf70d318dff7bfc041128aa', '736c91e5c2d7bcb4e7217d84fba362402e6d6cc9', 1),
(418, 1406141665, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'ca7c13fcc05f9887e5e56898b714a479a22b3d4c', 0),
(419, 1406141666, '0', '13912558a30040e366a0eaa38456ffb5c88b3772', 0),
(420, 1406141672, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'adb0d728fcb7b53156e45254714ded3b5ad013c7', 0),
(421, 1406141672, 'eafc503940e57b973bf70d318dff7bfc041128aa', '919cde1556463bcbfa3b4e3392d6b1f70c276d55', 0),
(422, 1406141672, '0', '2d64606f27da6a51c742438a763acf80557a2f90', 0),
(423, 1406141678, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'd439121f8a92b2108a94c41cd429d85ba43afa06', 0),
(424, 1406141688, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'c45a7605a5390c1ef39a2a4b46c0fd52e7629d40', 1),
(425, 1406141688, 'eafc503940e57b973bf70d318dff7bfc041128aa', '0f004224208f9ebdf37c2c9d9eee1a1ee76a096b', 0),
(426, 1406141688, '0', 'e141c0e60b1db66d0c8e84e83cc8e685ff65094f', 0),
(427, 1406141712, 'eafc503940e57b973bf70d318dff7bfc041128aa', '98baf1a92f73ffa6ae43110951d19a186cb67da0', 0),
(428, 1406141712, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6adbaadd29fe6c8a98ac37f8f019e0132990ae95', 0),
(429, 1406141712, '0', '2a37e6eea9c8896be5c31f24beceb38441abb78a', 0),
(430, 1406141718, 'eafc503940e57b973bf70d318dff7bfc041128aa', '92b1fc64c2e4b5d9cf159aab933658d29949c774', 0),
(431, 1406141724, 'eafc503940e57b973bf70d318dff7bfc041128aa', '6f35db240d37e66499e6d003328b8b82de51e604', 0),
(432, 1406141734, 'eafc503940e57b973bf70d318dff7bfc041128aa', 'aac8ec598e6d1455ce59d18274536f0114397a59', 0),
(433, 1406141736, '0', '482178c9fc03db66b4c5d3ae072e3f94faa96443', 0),
(434, 1406141736, '0', '22be9fd5457bf019e14719ae33e0a82b0ca76fa0', 0),
(435, 1406141736, '0', 'a02bb435dab000c9b5acb527d3ae46dbcd88f8b5', 1),
(436, 1406141738, '0', '0e43bec36e872596b2f29816c670d33b4adea74b', 0),
(437, 1406141738, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '46b4216ed690043da24c0e8c5a757c0340a4598a', 0),
(438, 1406141738, '0', '6dd177c8b2fdefe5560375c7cd78238470bc853b', 0),
(439, 1406141746, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c3c566867077dc70802e15dd1132685ca51987ed', 0),
(440, 1406141746, '0', 'f6aeab5d0d9d0ed0107bc9f34ea309d21c0f9a47', 0),
(441, 1406141756, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd2f24545ecf4a19105e964dd012ce3f960d51d84', 0),
(442, 1406141757, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '48df95b4a0e1481fba27197286ff43ac084bc6a6', 1),
(443, 1406141757, '0', 'a23b63d0205b45e59ccee3510e0ac23d3c6e238f', 0),
(444, 1406141757, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'caf7e8e59ede63c008f9ee3edbda5a30bc572183', 0),
(445, 1406141773, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'be11e89c828c14d13da5ab99ef07454fa560bd5b', 0),
(446, 1406141773, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '914fd30815a52cdef2586232d214c2c936570cf9', 0),
(447, 1406141773, '0', '2cf628c9eefd5baeca3a404f32f696ef75f76390', 0),
(448, 1406141775, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2cd4d0e5d6b7ca90e4cc1f62e5062f36ae207097', 1),
(449, 1406141776, '0', 'd1257d6a275355d5313455f3d224438854ed5a96', 0),
(450, 1406141780, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bf0d5f56ba87d4eb7b9d2c953c6b9593c29e72dc', 0),
(451, 1406141781, '0', '3fbedc8765bf859b4804521c0dd12c6c2b79b576', 0),
(452, 1406141781, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '8bbc4370349e6bcf8e5a60c4d8d9a5de15e1c7be', 0),
(453, 1406141788, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '8871c0dbd518bdb2f5cfaf11d6a4915f5a0d1b45', 1),
(454, 1406141789, '0', 'a9cde2005ee5c694a754f78c2e4efa14d06aca1f', 0),
(455, 1406141790, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '753e11f08adab854dce38e0ba9ecd31594ac48ac', 0),
(456, 1406141790, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'aee72d207c19697eabb38c3e417cb6a2142335c4', 0),
(457, 1406141794, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '3eaa8f57fc9f3b6fec427669d6e0a87875724fee', 1),
(458, 1406141795, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '36d95e78de0e727e32432c84dd86c488382c6568', 0),
(459, 1406141795, '0', 'b4244d6c35bf65cc936e92f7e394b9e449226c47', 0),
(460, 1406141801, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '29392b273c98d36ba3f777694c9e752c2c45e252', 0),
(461, 1406141802, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2d37f1f1e23b9a94df0cd35cb36316617c63bde2', 0),
(462, 1406141802, '0', 'd47682ffeefdfc2d9f8fb36327cd3094f0529281', 0),
(463, 1406141803, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '98ef4dece5c5ca6432f147acbe15a2ddc746c79f', 0),
(464, 1406141804, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '1c0e282dbbfe904e84878f0bfeb46e6f69c6acf9', 0),
(465, 1406141804, '0', '520ced87d02f90469dab898a33d78fbc161c74ec', 0),
(466, 1406141806, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '19d04e4f9f905a6437998628706879d1c700cc54', 0),
(467, 1406141806, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fa346495bc0c9357d88665f97ce34a6abe60b805', 0),
(468, 1406141807, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7de709e91b9ca63ea06ccf23fb03a2d57c18b2e8', 0),
(469, 1406141807, '0', '104e2dab9ea8e4c16946f700c788a80b934385ee', 0),
(470, 1406141810, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fbcb173ff561a50a801b3eba1f4edce47d678bd2', 1),
(471, 1406141810, '0', 'b4155185939c3e3f9f58f2ae0a32333ce9117abd', 0),
(472, 1406141812, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'abc97dc6e0e33718bca9be7d9ad0ca562a79979a', 0),
(473, 1406141812, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7aa0a078208321082c742febd92536c4ad68663e', 0),
(474, 1406141812, '0', '4aa3dad8396c5991e65282a1101af4dce67bce42', 0),
(475, 1406141819, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0ae9b4f402bee30eb0ad84b581c31bcca1b8934b', 1),
(476, 1406141820, '0', 'e184c3aea61d6c4e714616cd9c3f31a7cc09d4ae', 0),
(477, 1406141820, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'da177f2c0636a9b3a6625a6ad8fcf37c420d4e68', 0),
(478, 1406141821, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7b93af081be31e4b111dc6e2ed28669350f2bbfb', 1),
(479, 1406141823, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'cdafd8ce5c3a96d8436cfbb6af7ac44a081c3bee', 0),
(480, 1406141829, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '44b0711e88b67c125adfb81dc255878ac798d579', 0),
(481, 1406141842, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '953d7e8700d789ccff17eddb29a377509905817e', 1),
(482, 1406141843, '0', 'a52e1e70972608c02d9bc466303f1e6ce33d948a', 0),
(483, 1406141844, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e496f01d97662a354e6d6707b2c24e5f678d0b63', 0),
(484, 1406141844, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0a9ff639eb63f3032e92f8d9fbdbf4e8a4564e87', 0),
(485, 1406141864, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2f1161235cc08a4160fac17ef5922f13d417ee3d', 0),
(486, 1406141865, '0', '4b4b9915c2dc8e05c7805cb9de977af01c77ef6b', 0),
(487, 1406141887, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f8b8a02c729a1c0229c7aa917f5c27626427c975', 0),
(488, 1406141888, '0', 'c5b952eabeeca11e9aac74dd8a088c095a9e4c5e', 0),
(489, 1406141890, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7ef0eca646086ffddbb1f9819b02cf70922720cc', 0),
(490, 1406141890, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f31e70bfc9cb444f6b556f7d779f8e10383f28a3', 1),
(491, 1406141890, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '9a714ead7423a1c3281b2848eaa8511494b1fc63', 0),
(492, 1406141890, '0', 'd30852dc76ccbd3855f885194e3a19f4bfe5f2f4', 0),
(493, 1406141900, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '39db5d440dfb4a8575f8edfbf4de8a7ad1dc9381', 0),
(494, 1406141900, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0faa20a67d4e06f6ab84ccae1e327b4a1e8e6dd5', 0),
(495, 1406141901, '0', '3043d3ff39ce408c0c02c771f68ca68d0d3ead33', 0),
(496, 1406141923, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '1927f9a2b0a2a84b7936fec399a968fa52dc135a', 1),
(497, 1406141923, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '09e5823ae7ddcf3980d50451e36da546956d6fb3', 0),
(498, 1406141923, '0', 'efcc7e2f0e13035eb6d33cf98070a35fe17b59bc', 0),
(499, 1406141938, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '23130873f187d328ac2767ff9f326565342bd3e6', 0),
(500, 1406141938, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a3c0014ff19c7f58a4f6419495752f7834d3888e', 0),
(501, 1406141938, '0', '7af99d6fb440dab8ac7981731640752afbb7b721', 0),
(502, 1406141939, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'cf6593502e1a6be2dca45e82ad22aff0b15077f8', 1),
(503, 1406141940, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '4a8fbc73df53031c59ca5c4d7e530836ed34d9fc', 0),
(504, 1406141940, '0', 'cc2987a1e6111ecbd7a82f2b77ac9be0330ce747', 0),
(505, 1406141943, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f88aac554565353e844e3ab28fbaadf8275b5a86', 0),
(506, 1406141943, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fcca5b11a82d127ca1da33f97406ae89038c2fd9', 0),
(507, 1406141943, '0', '5065d7be186378486a64bd117bd4e11a486302d2', 0),
(508, 1406141945, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '4ba26a7b10ae496874b8428f0bba8da22c065f48', 1),
(509, 1406141945, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bb832939ec39af6926f69422c77824aa60b95588', 0),
(510, 1406141945, '0', 'f3727e0c7b3800c8b263caeb9b9b98d34f9658bd', 0),
(511, 1406141982, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '73f7d5c8ef8a6cd55dcaaadd0d326b3651e18c9b', 0),
(512, 1406141982, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0e6441cab2934dd61831ccbb86fe712514156354', 0),
(513, 1406141983, '0', '9cf54e8dae8030671d1eb276818ad8eacb9f7534', 0),
(514, 1406141985, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a27924aa75a2f44c4fc29fbba01e2ecefa3b4e6e', 0),
(515, 1406141985, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7a427f0bc1a387b8e5131e70cd396469f52a7824', 0),
(516, 1406141985, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a841a81ffa215c78ce93a398e023b47ee3629899', 0),
(517, 1406141985, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'b996edf4053b7b86559a54f8f21d76b55a983090', 0),
(518, 1406141993, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd1563ad43493204749a9c9e09fd973ebf7ce27fc', 0),
(519, 1406141998, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0c1f98f4eaf29e2d272a811bd3eb5e28229d63fe', 0),
(520, 1406142025, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '920c301af906a17b0982e8ebade9bf886967cb08', 1),
(521, 1406142025, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'cfd697e6c0e6e39b4072d7d71b3f38558a3a2957', 0),
(522, 1406142026, '0', 'ca7fe0bd5611cc3d2d6787066836c78367257b56', 0),
(523, 1406142047, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e0dbd1fd4a5f962cb41e23c1d9408adc8378f2f3', 0),
(524, 1406142047, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2d9c2cb32fb0ef9d2b2095624e9268b1b58b97bc', 0),
(525, 1406142047, '0', '9efb15a8123707a39ba519ef8dcac4211c2bfafc', 0),
(526, 1406142057, '0', '7b428f0447ad8082bb44a0aaa586ba7ef4b590b9', 0),
(527, 1406142063, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '65f1a19aefc153e2cfac1df7e82b9e3f4d17e7b2', 1),
(528, 1406142063, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bb77dd1905520e5e618b8e389e29c7d46fe026b7', 0),
(529, 1406142064, '0', '27bdb8e74a05879103f5b014b7315e965ee276a0', 0),
(530, 1406142098, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd5c770e8c03b94cb33ff15719433ba62465a2980', 0),
(531, 1406142098, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '1954f5f9b33561ba2b0a69d62c1b2625cc67144d', 0),
(532, 1406142098, '0', 'efdc3144bd3737fb0e4d6a09f869e857a020d0fb', 0),
(533, 1406142104, '0', '6f38ee93d93c3c29fa73f128a75ab65d6908f477', 0),
(534, 1406142111, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2a2f2aaa795e1f3b087e4ec6d6e4424843156d5b', 0),
(535, 1406142111, '0', 'ffc5185ea188d0413fba134fb7293f4263df0f3c', 0),
(536, 1406142113, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '23f7aa1d7989e71930fe007ae30b6e546a543d9a', 0),
(537, 1406142142, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c086d993cf4e0e8d156ac8de44486040ab25f6e5', 0);
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`, `used`) VALUES
(538, 1406142345, '0', '8ddfb30e735d5a961456b688d43872c5f9444281', 0),
(539, 1406142353, '0', 'ab0852f1bfa3b74e43c7f86fbd200c0188015773', 0),
(540, 1406142354, '0', 'e8b6d6bf8cffe80a683b5e2882abaa522a38300d', 0),
(541, 1406142355, '0', 'ccaaa654848fb085eb146134792572cbff4440ab', 0),
(542, 1406142356, '0', 'd56019956b6339341adcaf1b38d42f1451d559ec', 0),
(543, 1406142358, '0', '036700f38ab2eeddca4f623b76c831dcdf1db174', 0),
(544, 1406142359, '0', 'b05929564a402bc5757360b36c2b41b36422aa91', 0),
(545, 1406142360, '0', 'ebf41a8ca377cbf9f46c69aaf3fb87e9aa21120d', 0),
(546, 1406142370, '0', 'c7f71d1950edb97cf1917c8957c8c87f610b8c0b', 0),
(547, 1406142371, '0', '9ea7a590d1651626e2e478de367dec2beb5c6194', 0),
(548, 1406142372, '0', '7ec9716509f8e810645acec814502bce1d6bf03d', 0),
(549, 1406142437, '0', '51be5e551dc341d26d202c1bc86268ab25292517', 0),
(550, 1406142441, '0', 'd3c2ebef1c900152ec093fbb1afd30c2a773b366', 0),
(551, 1406142443, '0', '0435bfcb55e7dc42e8be98f564fd34b6681ada52', 0),
(552, 1406142445, '0', '16b480c25d2b833f5aa06a16f27579907a9604e4', 0),
(553, 1406142446, '0', '224007ea7aee3e90a9821d06074ca7e15ed29207', 0),
(554, 1406142447, '0', '29b4d53ac21a4796a338a3abc79b1037bad27ea8', 0),
(555, 1406142448, '0', 'cc314124f70a220be501702032ea841b06261636', 0),
(556, 1406142450, '0', 'f20e4978358ea6878ba6cadb14a4cec64598e0f6', 0),
(557, 1406142451, '0', 'f5116373bbbe0dc5f3088ddb9b69dde4eb9c1b9b', 0),
(558, 1406142451, '0', '2f64083691b541101b80175f9eaff34e0b6e5243', 0),
(559, 1406142452, '0', 'd1b74ede8e6916ff63dbe719c11bc5e357ed470e', 0),
(560, 1406142453, '0', 'aaf990ceaa4949c7120df947da8f4eb7214971fb', 0),
(561, 1406142457, '0', 'ba5a419872bfe40a1ae87c88fb51d15de079cac0', 0),
(562, 1406142458, '0', '1aa78d92d766d609833457e06cd8c4bdf61d8f4d', 0),
(563, 1406142459, '0', '333614e6351696588ec03cc17e876fddf16da3b3', 0),
(564, 1406142460, '0', 'c6a53b8e76b2ce3d9219af9332c505e6994d28cb', 0),
(565, 1406142464, '0', 'ac6ab95d739b754efbf8a2aa763bca211ef9547d', 0),
(566, 1406142465, '0', 'd6108eca8e890c39f637af66ffd108ec513fdf50', 0),
(567, 1406142466, '0', 'b6005fbc8e07de71105edddc7933d8d0ed9801d3', 0),
(568, 1406142467, '0', 'b78c7b41ea8e30afb74702e584320fbef2fd07bc', 0),
(569, 1406142468, '0', '644e0ecc0fef59bb54b6cbcb6de8e317fa446933', 0),
(570, 1406142507, '0', '90e24c960a0b202b61d6f11bac84bb71a1e26596', 0),
(571, 1406142524, '0', '9c8287dede02bac22589fc0476b168c8e3eaaea1', 0),
(572, 1406142528, '0', 'ce002c859caf5026a5c83b8907003954192a7042', 0),
(573, 1406142530, '0', '282fb63430c37dd630ea3dae07aaff1be8cf6e11', 0),
(574, 1406142543, '0', '1333f2220009adf45968b964cee896e9101b1a4e', 0),
(575, 1406142554, '0', 'f8e290224caedb61e7f68e86ecf59e0b82d175ea', 0),
(576, 1406142557, '0', '412e8c463611b089509d863c723c96e1d98b83a7', 0),
(577, 1406142560, '0', '8fb5c715eb58f0721353d14ffd1dc311c6142a2f', 0),
(578, 1406142562, '0', '20852305d58389d3e13522e49b3af9c177ff9243', 0),
(579, 1406142565, '0', 'e72582268b68a6dae1484a09016360426f743d93', 0),
(580, 1406142568, '0', 'd8c8941c6fe1ff005530f19aab79cb8a5da78fef', 0),
(581, 1406142570, '0', 'db79a9953c97e35e6a4a1dda73fae000919bd9ef', 0),
(582, 1406142571, '0', 'd9e54320457b001e62816931acfe875f48061560', 0),
(583, 1406142627, '0', '674ddd15c0c8bb138df7dacad3fd66e138788354', 0),
(584, 1406142634, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '4370f12da750806300f00e58463481bdfe94d00f', 0),
(585, 1406142636, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7f27789b957474fd3d41fe9a6d484093774259ae', 0),
(586, 1406142636, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '66d1fb6f3283e9cb98855b6f955dc24c8764ea1d', 1),
(587, 1406142636, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bc6ab03edb36d3bbd78b07f2531380ea60e8e0ab', 0),
(588, 1406142650, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '1e143cadc638990c89512fedcd2eae5762fb9cc3', 0),
(589, 1406142650, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '7839d91ca423d7263e48c8102f80d0bfda223f7e', 0),
(590, 1406142650, '0', '06e70eb6e94d9315d890ab993fe72e8263b6314d', 0),
(591, 1406142658, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f8b3a288c44b78ec3e0796cec1f2f8e5e491a9e4', 0),
(592, 1406142659, '0', '3aafc360f0210623869438f113b89180ba906041', 0),
(593, 1406142662, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '165edd896af6f3de99d7ff24c623f142e8fe06ba', 0),
(594, 1406142663, '0', '943bcd67043f67fcfcd2dc8447dc3b2931870951', 0),
(595, 1406142665, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '40d6c5130073f546f99e6cca6a9795b06f07d12b', 1),
(596, 1406142665, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2da433e86e6b43f5844c516a94acbddd501cea1d', 0),
(597, 1406142665, '0', 'd30d02889716196c8ea1601d82309abe21bb1f82', 0),
(598, 1406142669, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '68a2fa355e39b19fcc7cb4caea71b73f5e87c530', 0),
(599, 1406142669, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '08813613b3013480226fe37ccf102c4c69abbba3', 0),
(600, 1406142670, '0', '3e40b462e2a887310f47be7a7cd13b6ff4994a43', 0),
(601, 1406142675, '0', '959d7b72907e2ed4c7525a784cf1a88979bcaca1', 0),
(602, 1406142677, '0', '7edc956a1310ff41ae643d49619f7920ae403c57', 0),
(603, 1406142683, '0', '28b85134f2e0d653220324297f496d9222d3b429', 0),
(604, 1406142687, '0', 'b0d4f07694455c480e2c12e61763cb49de2f82d8', 0),
(605, 1406142690, '0', '95013f47404102c0cf5eba7f2692b686b5c6a8bf', 0),
(606, 1406142693, '0', 'd762b5abfcb6a56d54cdf2e6825207f452f44741', 0),
(607, 1406142696, '0', '61c907dd02a8942d89e965909e067ba2c3384bbb', 0),
(608, 1406142700, '0', '8b33fef934ac704a49d59d5a3b982f1593ee87aa', 0),
(609, 1406143034, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '74ab3e03cb59fb673454a76b5d1424f35f42b62e', 0),
(610, 1406143037, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '8ea89875f9348a2fd3e1814c35d0a5b1c3c41f50', 1),
(611, 1406143038, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c1cf2c496d8f82d4e31669b8e6020b66edf480a9', 0),
(612, 1406143043, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '84885d0d5d960fd41ef8509dc95c19b3a7673112', 0),
(613, 1406143043, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '6807a7ea129d64c38e65ba77ad561401f95fe175', 0),
(614, 1406143046, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd171e0ee4bab37cfaf9387db67eabb8070bb45b9', 0),
(615, 1406143048, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fd73dd61950389af15107c3d5734676cfaab2575', 0),
(616, 1406143050, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '6f72c4ec115c8af920539ff21671d8560a664a7f', 0),
(617, 1406143065, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '37895dab6841d90bb8c7e22fd2d8e7c4b2d8d188', 0),
(618, 1406143072, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fdc2e4dd30dd86d8241c0ad6e9ee30059bec8b2d', 0),
(619, 1406143077, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e7640f5c3622387c2af6fbba4f45757ad49d14fc', 0),
(620, 1406143091, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd0b26a55036f58d79fa8b082934c375cb6a95731', 0),
(621, 1406143306, '0', '74241e5b1060bc0f51e6285e0fae96a8fda2b287', 0),
(622, 1406143309, '0', '81916a06caf60b5de847223645c0ae9857251ae6', 0),
(623, 1406143312, '0', '037e38c37162ccd8ed5a88592f1bf7984cc7dcfa', 0),
(624, 1406143317, '0', '73901264450ead2cd9edb63da2e22c4b9a34087d', 0),
(625, 1406143320, '0', '69d279e8ad111fc5b067b9fbd1f3af4fbd6d9d43', 0),
(626, 1406143345, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e2933abe4e199e671ee4b0024fc46680d2884608', 0),
(627, 1406143686, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2e7d8e344a624b9893773670955a74242eba2797', 0),
(628, 1406143708, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c18712f127d0588351eb9e92eb28d556ef0bf27e', 0),
(629, 1406143724, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '34df87422ba5337b8442aa00563f4dc4def93ada', 0),
(630, 1406143725, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'cfb82aff5bcc510ba6a639ff68134be5fb614f2f', 0),
(631, 1406143726, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '198ffe64fe08661c4c5663ece70662442360c287', 0),
(632, 1406143727, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '8dae5f60bddf16cf99e030aace08231288fd9b4b', 0),
(633, 1406143730, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'ef01be81f2160be773e5c6cb76adbc0b4950d59a', 0),
(634, 1406143733, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bfb0df70ef1008d9a8a9406f4c9eaa9ceda34d9a', 0),
(635, 1406143741, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c466f7244666cfe740cff4e251798c732061a0fa', 0),
(636, 1406143742, '0', 'e8375befca08640a0b6a7d65dcecbd9da5553129', 0),
(637, 1406143743, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '3f4ffa5a56360dd9f8384636aa082a3d542e028c', 1),
(638, 1406143754, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '71289d92aed9233236f5a4bc9956d944ba9cf01e', 0),
(639, 1406143754, '0', '569802ede9dfa1da670fe2d841507919b7117bdf', 0),
(640, 1406143755, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fac33c821409ac4ec281fe356312761dd79fe119', 1),
(641, 1406143764, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'aad8488270087b211b0d3679cf20be51ef8880c7', 0),
(642, 1406143764, '0', 'bc1b552cffc60a6d94ccb9971cf6031de448eb1b', 0),
(643, 1406143767, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0c31c937be6b92752afb96bc75a913f71c45e34a', 0),
(644, 1406143768, '0', '48b287dd52d209c753bec3d4e22ff0565d68ee9f', 0),
(645, 1406143771, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '4e5afafa47c7cec15b1e88056339e51bdf01bf9d', 0),
(646, 1406143787, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '21bbf3064893cfc0d98699d102d75835318c98d1', 0),
(647, 1406143788, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '4ec48708f6ea90d2ee8ed553555ec4ea8e455136', 0),
(648, 1406143800, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'b244f58f801e772e618f955662dad4daa27b8e42', 0),
(649, 1406143801, '0', '00075d5b7700b99616652b8a628e94d1d30eb4bf', 0),
(650, 1406143816, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '3775099763b36abbf84929836a5ff12e6770f3f1', 0),
(651, 1406143879, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0d635b0adba1c37aebd40eeb0bc7d594a044a297', 0),
(652, 1406143880, '0', 'e2499d46c5c86a95f4b9c42ad89ab3e9b557df15', 0),
(653, 1406143885, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'ed619c9b02bc5e4194a80af9649e24612abdb0bd', 0),
(654, 1406143885, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e0005f3940a56073a3c0ddc29d043ef2c3eb99e0', 0),
(655, 1406143885, '0', 'a1fdf35448beac7f5c530a588fc783d0a73434ae', 0),
(656, 1406143888, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '9d03c69e565ef8264113cfe97c5d5abb15829562', 0),
(657, 1406143888, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '992fc1c93026bc45f5394a850473bdbcbc231f56', 1),
(658, 1406143888, '0', 'b5267d6cf11f036596bfea8d55a303c4b1d9283d', 0),
(659, 1406143890, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '472556bba17fee20f360f60371dd27074e124f12', 0),
(660, 1406143890, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '6a7d8947b70906dab1ce8f2a8e27e7292eb9ef5d', 0),
(661, 1406143893, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '692d4a8d10ebb70134867dab47cbcf03176d2671', 0),
(662, 1406143894, '0', 'c8771c57da8bd5e11abd0639c8751dff85cf64d8', 0),
(663, 1406143896, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e3623e695706ef7c0220b46d5230dd79df0cc538', 1),
(664, 1406143896, '0', '88c7cdb8d14ad1257ed0881a9d06e89a79c8915b', 0),
(665, 1406144163, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'ee3f541ae34d2e6690505b657063b48765fc6d43', 0),
(666, 1406144163, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'be2f3c4d7d174bf39b7d85ee71064096b1eaadb3', 0),
(667, 1406144163, '0', 'e7379cfec4ec674ac22236438898755cc2d9f7ca', 0),
(668, 1406144215, '0', '420e52fe85685acc0f46f8e21c5b3d0dd5f26c82', 0),
(669, 1406144225, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'b63be631683a7857191070daebe9b182d0099839', 0),
(670, 1406144225, '0', 'e4f990a69468e024d64a435b2fee2bb42634112d', 0),
(671, 1406144227, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2517a62efaf2a35f7d1e8141a286596968e22bda', 1),
(672, 1406144227, '0', '37957ef678db965586fea4ea3005e46113ec89f7', 0),
(673, 1406144227, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fc29e034943226225548befded510554d1042f38', 0),
(674, 1406144285, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'da8da8d1dcd6105c492cd474ee69c397e7270012', 0),
(675, 1406144285, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '854a5a8eabc1bca9ae119efa46bbf7a03105bb62', 0),
(676, 1406144285, '0', '40117256589e45871aa26bd7785461f45de38b81', 0),
(677, 1406144293, '0', '6bfece9fa16bebaf52b2256749fcf8beb98499b9', 0),
(678, 1406144300, '0', 'e9b5dc5df2661087bcaec666446c75694c2a47fd', 0),
(679, 1406144318, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '821409be6e2b6f3365510487f24c9ee9d48f817c', 1),
(680, 1406144318, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'ac921749f41d0545741bc6f0e8b9229ae10cef74', 0),
(681, 1406144318, '0', 'a9e7385864c5255404c2e8fc878c6252776f3dcd', 0),
(682, 1406144798, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2ce42319b6a90e219d25c82efb26599ba7045381', 0),
(683, 1406144799, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e2f6fd20e14b38ba5491f1eb63c7b6e2075099b8', 0),
(684, 1406144799, '0', 'ffbfc72e1754daa85825f9ef20a6e1ab58c2c3fa', 0),
(685, 1406144812, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '5079ab0c57a96cca0cf622fb5d6c4c89f2820add', 1),
(686, 1406144813, '0', '130e5ed7659c0ca7d9b06ca4b48252c72262ffe0', 0),
(687, 1406144817, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'ceed1d4d4978a7d38e3e68db59321d838a05bdfc', 0),
(688, 1406144817, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'fdb82ca3c3c7b4310047e7e317fc56885293ca69', 0),
(689, 1406144817, '0', '4ea54820aeb76a0b19fa018bd388faef1a719568', 0),
(690, 1406144825, '0', '59fcd7a37c0ec2d03810b5941565e06db784e78c', 0),
(691, 1406144832, '0', '650784a774ae8a1689e8cf39252a6cb1121f75a0', 0),
(692, 1406144846, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a876e12b1282900e45607d1f50689b497aadbea1', 0),
(693, 1406144846, '0', 'd7c4f9c4a3caee608a22e4a620e7db7943f533fe', 0),
(694, 1406144848, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a82518b1f0894aaf3a64f6d5e64b064a55d137d3', 1),
(695, 1406144849, '0', '06e081377d89f2aca1834adc313b2aa400e88949', 0),
(696, 1406144876, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '5ddcba6e988343e0a4d48720b05d000e5889bf6d', 0),
(697, 1406144876, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '15d38847cb1370569097cae95fd3b04c99b3cec3', 0),
(698, 1406144877, '0', '39e14095501175b9a1cc812c13ef56abb89fbc5c', 0),
(699, 1406144880, '0', 'db3e14db0afcd23ee2bfd372ed0cf099d5578a8d', 0),
(700, 1406144883, '0', 'bb993ccabb332643ac60eeac057240035c06f32a', 0),
(701, 1406144895, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '228baad0f1afe0e1c064d9f7fb2fc3449de7ae65', 0),
(702, 1406144895, '0', '7c595033ff150376e289a0f821018e3fec08d86a', 0),
(703, 1406144898, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '883bc7260a7be3e2bb9984760876238cd6973b17', 1),
(704, 1406144898, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f9a1d5668506bbfab2c319e92dcbd86a85edd0c0', 0),
(705, 1406144898, '0', '478a063c1841e44934d0b08da92ca2d54c03e0fe', 0),
(706, 1406144915, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bb05788015998259ff9feab87d1b66394c4eacf7', 0),
(707, 1406144915, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '942071476772c80acfdc72f865dfd3eff2accf4e', 0),
(708, 1406144915, '0', '205811d34fec54428f86cfe0d8861e7860843312', 0),
(709, 1406144918, '0', 'e80b9cee4856ede65ecec3a57e3d7c1760c233b8', 0),
(710, 1406144921, '0', '623777435bc31020585ee0f3b9f9a480e46ac627', 0),
(711, 1406144922, '0', '51baf8195b28818e2c0267aeef3f45bc383dc35c', 0),
(712, 1406144923, '0', 'a08a83f30eac9e1922a51c10ef4a4ab02eed0955', 0),
(713, 1406144923, '0', 'd515faa499a62fd7d3e6323a22289e57a04c0945', 0),
(714, 1406144923, '0', 'd4f4ef31bf8aec73cadd7c51dffe08c808adf78f', 0),
(715, 1406144923, '0', '5a9844872fcb72ec31a173f18b9c16b15c4719c5', 0),
(716, 1406144923, '0', '4022a87439b4be12253b2f53dd7a5397c469bff7', 0),
(717, 1406144923, '0', '6c8b7d0cd386196eea084eca4df9abc9bc380fe4', 0),
(718, 1406144923, '0', '85c6e4ac81c69104c3e8ecd72c1b7e91235dc655', 0),
(719, 1406144930, '0', 'fba7de0e17ffbb1a3574b336b634b300b364129b', 0),
(720, 1406144954, '0', '7430ebe0f36d74551d135c66641a75e42128af28', 0),
(721, 1406144956, '0', 'db40fc7929ac19f6473bac269f35cece87b0eb13', 0),
(722, 1406144956, '0', 'f8b44814f8a0cd8f464df6ed16e2fa71f54bb4da', 0),
(723, 1406144957, '0', '6c59078fda18c5e82e3391888b00ea6b6fa99259', 0),
(724, 1406144957, '0', '4ba9abd64de5c2d2bb099a618c527acb8af0b7e1', 0),
(725, 1406144957, '0', '5d9106e403ffc3f3904690fe60312c0cba5a12c0', 0),
(726, 1406144958, '0', '8747e34935bba271575bc9827c9910e05c5469df', 0),
(727, 1406144958, '0', '501ffd3e844feb947ece25c3768f8f0b6f2c599d', 0),
(728, 1406144958, '0', 'c2eff091ba1ea07f55f8fc3175fc4435ebe88192', 0),
(729, 1406144959, '0', '36add756a3044dcd76c897405e546565c70c0a1a', 0),
(730, 1406144963, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'e373a322bcb7d188065c9eb6f880827194b29616', 0),
(731, 1406144964, '0', '550c6d76fcc3106eb9d2244abd1b8fb6a9f2261b', 0),
(732, 1406144967, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f6716e969909acb6f8b23021b1baad14625b6504', 1),
(733, 1406144968, '0', '8c69806122314bfbdab796383d9b67d915400b87', 0),
(734, 1406144983, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a415762c856458aaf9eaae5f1c58a44d2bbc9a88', 0),
(735, 1406144983, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'b171bc1a2cfea40768c328ede405d576a5ff609c', 0),
(736, 1406144983, '0', '922af36a128e2aad2e36cf2fcbdcd4e16fa0df14', 0),
(737, 1406144987, '0', '80f3463ef8b6c4c4386aeda8658da7ab661934a7', 0),
(738, 1406144988, '0', '2ced3117569ac70a2748e7b2802b5d947bb28e16', 0),
(739, 1406144991, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '48c88b72b2427e3385edfa9438d5eee89869f3cf', 1),
(740, 1406144991, '0', '56669baa8992a417571ae00073bffc4643f454a0', 0),
(741, 1406145010, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'adec11d5e3f9942175b3e27bf08bf671889e14d6', 0),
(742, 1406145010, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '800c06ffdc9c48d450c89d64d665dcf9928019db', 0),
(743, 1406145010, '0', '8d0b5f269915119e2c28c203c1e2f9af4a2c068a', 0),
(744, 1406145013, '0', '1f5dfdee607a344245b35449792039c7d8b2b62e', 0),
(745, 1406145022, '0', '1914163edb16309595655de63e53671fbdc29a72', 0),
(746, 1406145028, '0', 'c62f0294f086dbf6772017070bf92b2b5e2c06ce', 0),
(747, 1406145029, '0', '8129ad333bf793042635b13ba942545106d3fa68', 0),
(748, 1406145030, '0', 'a56306b378192de550067660cabad94e8ca3f7f5', 0),
(749, 1406145030, '0', 'c7bf59f75c7e2851e6a8aefc8b6fea9772044919', 0),
(750, 1406145031, '0', '7204bd6db150f6423e39898b2ebc9cc31f9b32cb', 0),
(751, 1406145032, '0', 'f8d8af1855ea875a6eae380d0b16019652362688', 0),
(752, 1406145035, '0', '1a3dfa2435c6f72c058d3bb5c3beaec2b00bbe3c', 0),
(753, 1406145038, '0', 'def2df4eb9a08e61433f149afaa2c23bfbe0ac38', 0),
(754, 1406145049, '0', 'b9d143b131605e0ee53c3c8d2e3febb1f76f0a43', 0),
(755, 1406145052, '0', 'a8fba65c1e4b8f26b854084289ddea215e130e02', 0),
(756, 1406145057, '0', '850444968c814d3b3be1117878fabf04c6b5f95c', 0),
(757, 1406145061, '0', 'a577b62eb01590b29d89738d13c2514bea70fb06', 0),
(758, 1406145065, '0', 'b37ee4c26772c7a008bfac9fd04376bac4d56bda', 0),
(759, 1406145068, '0', 'a846b3812c90033d17365fd96400fe2d398cad01', 0),
(760, 1406145069, '0', '24d2aa087d47f3a17b92dd9812d209da351ec6de', 0),
(761, 1406145083, '0', '2f1c7b12ff1d3f85d61ce5f43c1b8e0b962a31cc', 0),
(762, 1406145100, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'f155c1279dfa77b78b8a172b5a25107f962f4f8e', 0),
(763, 1406145101, '0', '725eda7a70aef45a442c990376ae5b85dd5e84f1', 0),
(764, 1406145102, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '2e59ad64e111ef58fa7b08e1d52a8fac80a04cd6', 1),
(765, 1406145108, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bff81c2883eb5802e5fc5c07f59ff77fb871dc37', 0),
(766, 1406145108, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a15767e8d9ce7ca1935d8dc49afda08d7738f887', 0),
(767, 1406145109, '0', '47c602df537a53b100cba4453823b0c1b5502948', 0),
(768, 1406145110, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '81a44e37275a930fba70012d1be40fcf43ad8886', 0),
(769, 1406145111, '0', '6beac48d1c2a1b3f2a86cd42b8fd2e5f36872ec5', 0),
(770, 1406145112, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'dca1beb2fa855f2f8de156552e27351caad074b1', 0),
(771, 1406145176, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '02d8ab96b4482a75fd2a7c847a93a8477ec04d2c', 0),
(772, 1406145176, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bbd9e10ac54205a60b8c5921bbbd0f7c489a4bca', 0),
(773, 1406145176, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0514b361e8d1e3162932efe1e362f724972fdfaf', 0),
(774, 1406145176, '0', 'b2cd5fa99ad6b46a2471c18f147728d297358cbf', 0),
(775, 1406145178, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '8198ce0e26d39b8f78b066c785c49c108096ecab', 0),
(776, 1406145178, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '147e4a0ab8a172dac90ae3a1d46fe062ae9a4c49', 0),
(777, 1406145178, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'dd68f4808619eb10b8f69dc63e1da94767111606', 0),
(778, 1406145178, '0', 'baab7c5163c6432ce193f056b14cd5261686fc32', 0),
(779, 1406145180, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'd1cbc0cdfbfcd9d815e3504e19031c11bd7bb322', 0),
(780, 1406145181, '0', '51bea1c2f5196bcd1f1220d3c70917b93fac3131', 0),
(781, 1406145182, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'eecfa2927a9eaae392c5a0021ba14481d6dfe1bc', 1),
(782, 1406145183, '0', '1be586d9689398ed68096f6d2cf64b9095feec3b', 0),
(783, 1406145209, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bb47df93c2cc4b0711af11b0d3e248a5bebd2d85', 0),
(784, 1406145209, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '97d5c564bd7953c3a58422ee7edeb30072dfa781', 0),
(785, 1406145210, '0', 'd28447b47f01bed2ae35879d2abce948ef507670', 0),
(786, 1406145220, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bcc9bf38cf66b6f26f8ae93f7d32f75fc247f48c', 0),
(787, 1406145221, '0', '0376a3cf61207fd0c0f3dd939af649d505fed076', 0),
(788, 1406145222, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '0df64cb02026d0be3a7459954441ff2f1c73fb0b', 0),
(789, 1406145223, '0', '87e60dd01305e0a6f90c5b379ea9465e9b46a498', 0),
(790, 1406145223, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c9b444f5ebbd50914c548d2f80b69d273fe5db81', 1),
(791, 1406145252, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '3f9e4d9bbbfa491c28647741100a0e2fcb88d20c', 0),
(792, 1406145253, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '9a709581939b235567c5a9b94a6339c7754c69c0', 0),
(793, 1406145253, '0', 'c24ea2a9773472ec89aacf827294f6ab763cbe04', 0),
(794, 1406145257, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'cc2440a1e7f40722682cea6dda3c38501364b47c', 0),
(795, 1406145258, '0', '0276c8d178bd1b9ceba44d5bc32e92fb35a005e1', 0),
(796, 1406145259, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '1afe2400cf7192d3b800734924c5bff5356f1cab', 1),
(797, 1406145271, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'db82a6078ca227bb2bb0fc0daa322f9936a87685', 0),
(798, 1406145271, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '734b593e8dc66605d7a1352dedeec876f4910a3c', 0),
(799, 1406145271, '0', '5f5b2057cb35aab2e86ef82c7444f692d85c876e', 0),
(800, 1406145275, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '84578d52319a9eb63a8e61a838a16537427fb337', 0),
(801, 1406145275, '0', '3188db9c3c600eb19529fe07746de5b5e83f8046', 0),
(802, 1406145278, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'c5815e608e2410fee6189f00edb651e68b909287', 0),
(803, 1406145278, '0', '49d9b2f8b16b05938f057fd266acfe69dfc0cd2c', 0),
(804, 1406145278, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'bc8e80c67c9849086eb318c0b4f55f1ff1624575', 0),
(805, 1406145279, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', '50fa45f54dcea6c758be07e4090af7f566f5b4f4', 0),
(806, 1406145279, '5095230c8ba4cd75fb8d0cbc251acd905a96528c', 'a22abab08db00245b984165e1a126f0cbd936a2b', 0),
(807, 1406145685, '0', '4b12f336538cfa6c5e990548a9e8e4b35a9af646', 0),
(808, 1406145691, '0', 'f064cc4b4262f85587eedb1d6788875942d2e91e', 0),
(809, 1406145790, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8a936193ba81d0d86c0c6f2a42253b42a4e61a95', 0),
(810, 1406145791, '0', '502e9d2249889e1afd52ff4786d1201ca947ee3a', 0),
(811, 1406145792, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'bedc12b4b9760e28328c2b3d5954140076c6462b', 0),
(812, 1406145793, '0', '1d9f0485a5fb280093083a215ec1a914982661ba', 0),
(813, 1406145794, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '18fd3133aad014a5b38b074773eea768844e81bf', 1),
(814, 1406145795, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '22f23d4ed4d6eea34f085d28d58629be3279f731', 0),
(815, 1406145795, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1608482f7952529b60203f39a3773bd7cacd5041', 0),
(816, 1406145795, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '455259e43c65164e9727bb66ea1f0afa353dbde6', 0),
(817, 1406145795, '0', 'bdc5907795ed5f61a9d2c54387ba99f1132c6e91', 0),
(818, 1406145821, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'af2ef15acdf1ed9435d6bb8d77536b167c8eba26', 0),
(819, 1406145822, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9f8cd590f3a79de2ca45a640528dfa6f83302085', 0),
(820, 1406145822, '0', '123cb14f2803882c45b308e3bcefcd19c53d99a8', 0),
(821, 1406145825, '0', '13935faa50c97007a592951dff363587cf9410bd', 0),
(822, 1406145831, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ac13800a0dee69901a5fe55fb33f9702a689b1d8', 1),
(823, 1406145831, '0', 'eefc9b2e00bf04c187a06a8b2d3997568bd5eb1a', 0),
(824, 1406145831, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1eca88d8b469cef6a5017e22e349f3c22640d569', 0),
(825, 1406145831, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '457e45212393afd4607c5a19796db239cd2851b6', 0),
(826, 1406145832, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '27f9b0c7fb3577c60a5b79dc39982abd27724ebe', 0),
(827, 1406145844, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2fafb875ab9849116ef19d17ac62bfa3c6d0ae71', 0),
(828, 1406145844, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3e8c95f69c7519c3feac9ee22a460d58f616f97e', 0),
(829, 1406145844, '0', '8c229bb1c8708cf0fc7d76a5bfc99a3e7cbff448', 0),
(830, 1406145849, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '957e5d12e2c0e7a77fcf7bdcd84098df659376f6', 1),
(831, 1406145849, '0', '94613a120cfef6ba5e40122ac4ad9558a49ef489', 0),
(832, 1406145849, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a5abe76608543e15b862399ab7a5d15cde803ab2', 0),
(833, 1406145849, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a8f76d0e37755395e2026246bf887a494f73cd00', 0),
(834, 1406145850, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '41e7bfff2667bf88a6b7a36c3ceb393bec027d87', 0),
(835, 1406145856, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '285b2fb124a5f15127ad0bd78d3fac502f573541', 0),
(836, 1406145856, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'dda8b1b99c6ae005a35ac6d3ff4e70b65500ed21', 0),
(837, 1406145856, '0', '46a08dc2812ffd3d830104ba48815f6d0a5629c0', 0),
(838, 1406145871, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0fc4db09886e643d54744de9c8497b91614df40a', 1),
(839, 1406145871, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1f7bde94b0252950731554297b5d4ee117dad6f9', 0),
(840, 1406145871, '0', '6acaacbd7503effe58e084f84dea251e640ab875', 0),
(841, 1406145872, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '32268fd7917e78a1c3546be16bb33072c415d24f', 0),
(842, 1406145872, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '7781e15d9bc57bce986b2723ba80e99f7589cde0', 0),
(843, 1406145961, '0', 'b5428034131a19bfdb4e568b96cbd1b8918db1aa', 0),
(844, 1406145975, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2d67fa2c761c81d71eae67d868fc9b74bb86045a', 0),
(845, 1406145975, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'e07471fb91475b1df50ce7ed4a336fc80245a60a', 0),
(846, 1406145976, '0', '0d67cbaf95e743d0c7da9c302fc554073d7de45f', 0),
(847, 1406145978, '0', '5eaf89378d8e78eb9fc7392cd1bf92962f7ae2bc', 0),
(848, 1406146044, '0', '10320a238967d45b7b76fae1dd976ecb04879fb2', 0),
(849, 1406146060, '0', 'c2601d508e5b56e92ab35a2f2218c87d335a1033', 0),
(850, 1406146062, '0', '404231ad1429e32a4a8778a17ad220ada690eade', 0),
(851, 1406146068, '0', '8f79073a3cc4dff438d4ed9976c2f261b291a899', 0),
(852, 1406146070, '0', '7ecb0ad1ac61a18c2d04fb556439b89d00c3b4a8', 0),
(853, 1406146133, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '26a6c7e1444f89e6ee52bc69b9c272adb7a2fa2c', 1),
(854, 1406146133, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c44d0c0adbd31b8abd7778f844bacaccf93e29a0', 0),
(855, 1406146133, '0', '8692d17a95822b61e8c94ba99cf38ec4a22f40b7', 0),
(856, 1406146133, '0', '2d9a23e5a4f64c8152447d5196b6e83eca15e4bb', 0),
(857, 1406146133, '0', 'ac3d617a0881ff67a1064b5db3d03be29cf1b121', 0),
(858, 1406146133, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1df8b58cbe1bfb4475293efa83f68dde90f18abe', 0),
(859, 1406146134, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'd6219369c740086226aabd1fa688a03acd44134a', 0),
(860, 1406146153, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '627a5d88a9e25182a7a3c79c7930e3feae086755', 0),
(861, 1406146154, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '7a2ef9c764dbb9d8f13dad512ebc66b12b7f9160', 0),
(862, 1406146154, '0', '597856d1cc01a8255940b595649a023c7740265d', 0),
(863, 1406146154, '0', 'ab8a1c333aaeda9f3086763902459892626fa6a0', 0),
(864, 1406146154, '0', '5b06aec9f2e1d85097f20d16a62bd7b504d0c3df', 0),
(865, 1406146161, '0', 'f7d72e93b339de1ae7c632095729b5645e191bbe', 0),
(866, 1406146188, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '51c755e8f24492657483c5502c39e4e867a3d6c1', 1),
(867, 1406146188, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c90b76ea3510840f936bd8cc6c93fda143d8ed57', 0),
(868, 1406146188, '0', 'ae5c29273460dce55f15d308d1de12d8acb0d040', 0),
(869, 1406146188, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'bee2b8159fb1a4c6490062f0da3ee71ab8d07a06', 0),
(870, 1406146189, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '13fb438cf083bc8d4ec39d18d6f0b65a9d161e2c', 0),
(871, 1406146209, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '54cee686ffc1bd96990b95d50320e0bad72aaa7d', 0),
(872, 1406146210, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '74c3cd86e7f7d89ce2d4a53d95abb5c68bb7ccf7', 0),
(873, 1406146210, '0', 'aa395717f1bd89e85769d203c0c2a25f9881deb4', 0),
(874, 1406146221, '0', '4bf3e09b189a733d91ad5f6e3ca2be4b7b7ce76f', 0),
(875, 1406146230, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5071de8166a2618adf553a416b0f1ff45af70252', 1),
(876, 1406146230, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6351704c8bf14ab6b262ea943eb1636b3443d9a2', 0),
(877, 1406146231, '0', 'f3f8135ef8b10301117bd032455dafdbc3a0fe93', 0),
(878, 1406146231, '0', 'b1caea03a2a26397c7336cb889d2cc818e1c1521', 0),
(879, 1406146231, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ef25c280aeae505d9b972886d79506c2987d3824', 0),
(880, 1406146231, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '18aed7c89ec69afeee72df0f04a585d69bca0dd3', 0),
(881, 1406146260, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6be0b164d5ef9112c065e72aae145755212a28bc', 0),
(882, 1406146260, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '42a97cc4a250cfc8ebc5f0f7932bd4df42f646ed', 0),
(883, 1406146260, '0', '64edadcd1f5e0db0c858e08bea33df8070249c72', 0),
(884, 1406146260, '0', '8db61249e0fef6f3871ed02fa561d471ddda5dcc', 0),
(885, 1406146263, '0', '6f0090c44e2374edd1d6484801250065e067ec2c', 0),
(886, 1406146272, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3f9d172ad36e21eb2960866b0c75e9bdac6bbc4f', 1),
(887, 1406146272, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9863f7e7df36f40f7a5a13e81801cb5307868bec', 0),
(888, 1406146272, '0', 'd0dc2b6cdbe7616b65b7351972ff61c24ca9b142', 0),
(889, 1406146272, '0', '8ea124a67c03d8c06d24205098f08085d85b41dc', 0),
(890, 1406146272, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ea7b178ae74a33146f13fe6fdac1be2131a8915e', 0),
(891, 1406146273, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '01fbfb99c54003e5273ec709612fcf40f551918a', 0),
(892, 1406146285, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'e1542e11af712fd2fa259a6c8c8d551844a5ec16', 0),
(893, 1406146285, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5db204fabcf06a3f7fc06d6634235295c069d873', 0),
(894, 1406146290, '0', 'ef91e3da3edd13aa9d333f8a5455f4a624cfc104', 0),
(895, 1406146343, '0', '6fc1799bab798cc217749325bdbfa67ebe0894c8', 0),
(896, 1406146360, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c45afa3343815ba83ca6c3d95a3e5192b9f2ea3a', 1),
(897, 1406146360, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5e1925b0bc48c7bf4dad4393aca48d95eec9f19c', 0),
(898, 1406146360, '0', '4a491cb2c682894849ecdeb6f79a5658eb8c2b7b', 0),
(899, 1406146360, '0', '6689ddec10e7809c59c806d8d7ab018d44a24259', 0),
(900, 1406146360, '0', 'fa90b04a3e231b0a4440393a01b74c488e95dea2', 0),
(901, 1406146360, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a71ed68a986c9a525a0851cf26fcc4802ff066aa', 0),
(902, 1406146360, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0a26bfab699adb2071b71655b68ff933c1e98696', 0),
(903, 1406146381, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '03a8374c9ee2ba239bf9fd0b5ab5393417e81814', 0),
(904, 1406146382, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '80eabcc75b4491a79c7066f86ef9a14d5b163c3f', 0),
(905, 1406146382, '0', 'e8078e3cbcbb22d6c431d17cc7cf84a286db959e', 0),
(906, 1406146382, '0', '11efabdc68e4dc473b8326f94abfe81d485a5754', 0),
(907, 1406146382, '0', 'e154e20536266e184df12a1de1f4f83d085dce71', 0),
(908, 1406146388, '0', 'd76f27f0f371789be14f7dab05b72a15c5558275', 0),
(909, 1406146393, '0', 'e43ebe3fcc56d21846567a5427e3f1f9c85d0561', 0),
(910, 1406146402, '0', '30adff26389e4add4c0813bad74e6206f685b010', 0),
(911, 1406146412, '0', 'cd568672349d85d5e657fece32212c6366125a91', 0),
(912, 1406146474, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '22941cccfff34727713fd887dbd958a64f559b8d', 0),
(913, 1406146475, '0', '4af07011a8c4ddac1bbb6393bc36b2f78f5c0d5f', 0),
(914, 1406146475, '0', 'b5b5f102c5dbf8b12d9b6494adc11326df314948', 0),
(915, 1406146475, '0', 'a37cfe2f9d6c3134c99024fe23c309bef77a2a02', 0),
(916, 1406146549, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '114e93ad3e5be0bb27a95775c464d5d92dfec8d5', 0),
(917, 1406146550, '0', '1235e0bd3fe4204f205f7c21c3bf357eb8299f33', 0),
(918, 1406146550, '0', 'ae21a0c1f26754f5c116ebab507bef22b32a68b0', 0),
(919, 1406146550, '0', 'd9bbb3e4039d1694f3d9c0421ea02dec8b105efe', 0),
(920, 1406146551, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '51e49aa551d6470691c720b3a5aeaa7903c37303', 0),
(921, 1406146578, '0', 'aa67d9f556de3a7b55e37f2c733debeddf9ec81a', 0),
(922, 1406146578, '0', '1e685f3df67b8708d143aaee8a8d80493466bbb6', 0),
(923, 1406146578, '0', 'b6dc34e3f14353e6c23687ebcb0b3cfa74ca31e1', 0),
(924, 1406146580, '0', 'efcb6926f259eb4366ee86369f3aae83aa10f61c', 0),
(925, 1406146580, '0', '14f4c28f877a5cc90448264518f4f0eb3c696ab0', 0),
(926, 1406146580, '0', 'c1e9a2dcb1cb96c90113f6a2a03d6f8caee0227c', 0),
(927, 1406146611, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '404021904d13ef51529ab1abd3d4855266698da1', 0),
(928, 1406146612, '0', '13cd13a4354e52ee35f310c28b924b3eee93cb51', 0),
(929, 1406146612, '0', '0906037e6373e77cde14c0759ce58e459d5cd61a', 0),
(930, 1406146612, '0', '7adfd5b41cfe6a045cf1b15caedfea2cc1567d5b', 0),
(931, 1406146615, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'fd1015d22d7e087974e9e5651a964135e117bc2e', 1),
(932, 1406146615, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'fe1ae615b9e74ad9a56b29880e5d31de4f2a8348', 0),
(933, 1406146615, '0', '7224ac35d5f96370ac037e8ac4a54155466e3eba', 0),
(934, 1406146615, '0', '56be154108a0ecfa61c3e4cce19b2d98199d424c', 0),
(935, 1406146615, '0', 'b875b2a41d474982f1285aad1dbbd873112c080d', 0),
(936, 1406146616, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ce4157c4fda7e5b2dd3c5e5b4eb919149dd5259c', 0),
(937, 1406146616, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4f1322828cbec6defa6c10699a685e2fd1c9577c', 0),
(938, 1406146632, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8c20477790061f4ab0c02001d0ccdab8182b151a', 0),
(939, 1406146632, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '302bdda1e1335ac34a4a837e94f385cdef1e43e6', 0),
(940, 1406146632, '0', '2a7f0fd2823e5773841f98a2c352aa7d4d7ab721', 0),
(941, 1406146632, '0', '97d62b51e1f0d9044925f9922fdb6c0a794c3200', 0),
(942, 1406146632, '0', '88eab231e789c29ca46eda60ef1fa8a940dc53b8', 0),
(943, 1406146640, '0', '82d10ac68ce3347949e67b581128f0baad155ae3', 0),
(944, 1406146640, '0', 'b0fc320f9dd25c471ba15415b1362c52cd890cab', 0),
(945, 1406146640, '0', '1ab6146c73e472095b47559cbfc4c4ef629e4dbd', 0),
(946, 1406146647, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a4d26ec80c177d0860359be736bbdc8d9c1b76ca', 1),
(947, 1406146647, '0', '3b1b2ae1dfbd78cf3617ae89fd1767b43a584e2b', 0),
(948, 1406146647, '0', '2d7a111d997768968969ef5020c85bf4bf03920f', 0),
(949, 1406146647, '0', '78463a6454a3fec46f46b7465b438842e759176a', 0),
(950, 1406146647, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '40bfb53d763ce9b5b0503b46e6ae5abec735925c', 0),
(951, 1406146648, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c714139f18b5bb97a36a0ab577a3953284b5c4d5', 0),
(952, 1406146648, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4c9a228e934bf23f41278528009bd63f25a3bffb', 0),
(953, 1406146666, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6528c3fea50b3de561077837322873116c1dc55c', 1),
(954, 1406146666, '0', '5219148bc5e0e3bd4e3b4ee5adef184e8cb94164', 0),
(955, 1406146666, '0', 'ea3038beabce327df01c29ab9de77bf7bdac06fb', 0),
(956, 1406146666, '0', '4116b81f4d00f5dd284161fd3932ce3959e89ea1', 0),
(957, 1406146667, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6bad2e4a3448a2d1ceeb86f0730d29047e622acc', 1),
(958, 1406146687, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '05c819dc4be7c1b70dfd078bd4c86c17856dce83', 0),
(959, 1406146689, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '38e0d25ca2bdf8d8be918be2497d6aeea6295637', 1),
(960, 1406146689, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '438a2b616801bf499c66ae85f20c6471acdd6e3d', 0),
(961, 1406146693, '0', '39b31480895d10188b39d258709b738882d3b1ce', 0),
(962, 1406146693, '0', '0d71a8b27540ae6c9861f92542dd2876e0123bc5', 0),
(963, 1406146693, '0', '0e9eb018c101dacbeaa67b0a62e9c947078002af', 0),
(964, 1406146698, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4d405daa29cd43f93a0b12dfa00d3083eabe0b1e', 1),
(965, 1406146699, '0', 'cd7bddb7b74b45310a3ae8f29868d41dcae64a11', 0),
(966, 1406146699, '0', '6b698dd6e646120431460fb1d34912325fcee8d0', 0),
(967, 1406146699, '0', '369043d859c8d5fddf2f2c345e023685bcde062c', 0),
(968, 1406146710, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '68137a84debea576a45cb423e587d4cc5d2db4d6', 1),
(969, 1406146710, '0', '77f36e0851f6e1a7e9d7bc850b8906236d890b70', 0),
(970, 1406146710, '0', '52571d441aadc86ee06867e0c1bb0082332b21cc', 0),
(971, 1406146710, '0', 'b3aff4ace9eb08a0b0714d64340b3b834b7897df', 0),
(972, 1406146711, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4d20ccea8bf786e5d8bcf4f5c073339c63f3cf39', 1),
(973, 1406146712, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'eb6dd52c92c922827d823c19ba54cd73415d9dfc', 0),
(974, 1406146715, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'e1e8dbf0344797883a24cbf0d7e5408a1f017f9b', 0),
(975, 1406146715, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'fba0659b02462fcd0d03dc713720fc554ac67da4', 1),
(976, 1406146717, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5488bbc1dbddd8863dcb47890595079280cb3989', 0),
(977, 1406146718, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'da2b5019d8e57742eb112123723604e282102368', 0),
(978, 1406146722, '0', '5dd5ff2675f967e12c6950890e7fe8e92ad68ad4', 0),
(979, 1406146722, '0', 'b3c3a8106b0c68d4c8c62ad22e2772dca3af306f', 0),
(980, 1406146722, '0', '6df39e92e01b712e68881993d9e6d80fbea781c7', 0),
(981, 1406146739, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '76c8a59a4e7f26c3be500e73aae2059fa7027575', 0),
(982, 1406146739, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '49a491faaa810f43fbf87e32232f2905c6891e2b', 0),
(983, 1406146740, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3ebfe9d6710988ce2b2adb4a628bd24261e3dc18', 0),
(984, 1406146740, '0', 'f23067bccd21f8592e44c927098ec6d3cc742a48', 0),
(985, 1406146740, '0', 'b408a535a54397ff4e64d6827d62011a70bfa5e7', 0),
(986, 1406146740, '0', '9ab76b01e2c94f4405c42996d5ee5ea63a7d5fef', 0),
(987, 1406146740, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '96df4748a0feedfeabc9f8b1cc5ccb5da25fdd96', 0),
(988, 1406146752, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ea013c852322793d8a7193db498730af984c0e72', 0),
(989, 1406146753, '0', 'd8b4886330b845e0aac7ecad5aef887e4b6aa7a7', 0),
(990, 1406146753, '0', '984393751fcf3c592c17b43bbd0e97b3d4cec20d', 0),
(991, 1406146753, '0', '0ad454aa52c3b4b3332067f04d73cdc8dc35392e', 0),
(992, 1406146754, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '287e2df4f5c707db67050f3ea0d367399163fa8d', 1),
(993, 1406146754, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8d7b736ac2f3a0bd71ae77c4434df6ccaacea9ab', 0),
(994, 1406146755, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '58b0ec885e7a93077d47bb67996acfcec986f513', 0),
(995, 1406146755, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1f42c5ff125f68045f00b24dfa390f68faccc272', 0),
(996, 1406146755, '0', '6778953c3ed38d3faa0d08ae6a33db498c05acce', 0),
(997, 1406146755, '0', '35e22a4fec84f52fbf4d9a0584035671478bd4f2', 0),
(998, 1406146755, '0', '5834afc9dc98d7ce1c7659048aec1a83bd6221ca', 0),
(999, 1406146760, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'f0ae5c69366a55e159405e0cc5eb3a9154692fe5', 0),
(1000, 1406146760, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6fdf828ed3186691b5c83604d0af4c50c341abc2', 0),
(1001, 1406146761, '0', '77ab4159af66b8726d7652f6b5ea38d223c5cf73', 0),
(1002, 1406146761, '0', '360cf34eecf24b95c95bf07d3481a4dc6c1cea10', 0),
(1003, 1406146761, '0', 'dec18f3de0d050b13277a4ad4b738d4f89688769', 0),
(1004, 1406146765, '0', 'f94c8956f88e927609d6c28fb5ba34d3c3b00bbc', 0),
(1005, 1406146774, '0', '953fc782b87aace58e7674d767a22f7459b254c5', 0),
(1006, 1406146799, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b89302384176971890bafaf30fc7cfb05e8086fd', 0),
(1007, 1406146799, '0', '5a114087da176e19340a5c3d549e538eaf8977ad', 0),
(1008, 1406146799, '0', '64cbe2f698d5d0f2fa44230c3818fe55c2f9eb49', 0),
(1009, 1406146799, '0', '0f041d255ffd499ff31907272b03ff100cd6f76d', 0),
(1010, 1406146802, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3df80be7e758414a8ddf2ba8ba30d1feb219f68d', 0),
(1011, 1406146802, '0', '600a4f8f420ff07a1d4432d1c755b37d2d9f410e', 0),
(1012, 1406146802, '0', 'f26aa312c94e901efb39ea771ca904ad99b99762', 0),
(1013, 1406146802, '0', '8ce7af8cd658c2b1b1f8ba2adc34f6ae9ef01682', 0),
(1014, 1406146802, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9e786a6368d7a2b32291ab3519ce58a65a51282f', 0),
(1015, 1406146802, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '33fee7cdf9fa0cee98f8715d3fec1a92316d5694', 0),
(1016, 1406146803, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'bce90ecc18aeabb0a9b992a5a751916b859233fb', 0),
(1017, 1406146819, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1f7503e62901f5c47f581bcbe04767cff97822cb', 0),
(1018, 1406146819, '0', '7f4cf3a34bfa900e33ccc2c6cd0e43ccc9ce94c4', 0),
(1019, 1406146819, '0', '0d23a6d2e714ec9fd886c883e61d7e8f026d6dcf', 0),
(1020, 1406146819, '0', 'c8fc26e50b91a95e104d3c74732f8608336b7fbe', 0),
(1021, 1406146826, '0', 'de2c6ca80dd3bed7d5eb4a2ede75ea319f9ba4ff', 0),
(1022, 1406146826, '0', 'db13ef2397b3af3b6ca4838cd155a14cf8a85488', 0),
(1023, 1406146826, '0', 'eba23aff29de02d4a4d68c4f448a750ecb938554', 0),
(1024, 1406146829, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8e56c25a1b85b3bb5edcff2f2cb440cc70b1cad9', 0),
(1025, 1406146829, '0', '0f680d7857ebceac13ef39b436c3b71b776ea72b', 0),
(1026, 1406146829, '0', 'a524c08345fb09fde0081aa8bab7d681e77e4693', 0),
(1027, 1406146829, '0', '8bb05694853f8412b46322c64454c2cd9a9475ba', 0),
(1028, 1406146834, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8beae591b39602cc81a46ccab5c5d9fcdd95026f', 0),
(1029, 1406146834, '0', '42bda244d0482d1ab894efbe7aa50da154948427', 0),
(1030, 1406146834, '0', '2721e2c2785b0f66b2a46001e6547c5fde10e531', 0),
(1031, 1406146834, '0', '35489729d0b72cf3ae5d4f9e73010a41bb608773', 0),
(1032, 1406146837, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '47288d037a259e0a3151c7edebdfacb685a9e24e', 0),
(1033, 1406146837, '0', '2268a16d3b8bf00f18ae93e81ba47dc88f66fa6d', 0),
(1034, 1406146837, '0', 'ee6a7ec1fa831864960bae1beb839c3c790691d6', 0),
(1035, 1406146837, '0', '65a3c3626fa3e4ec30eb4ca9fc36f25124f3409d', 0),
(1036, 1406146838, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8324022c375b06db703abe9e571f8224dca4db30', 0),
(1037, 1406146863, '0', '075079bbf680d38f7ea8ab3c6df9c7f9d6874b07', 0),
(1038, 1406146863, '0', '64fff8e3595bfc13d3b3de4ca58b3e1cc158c811', 0),
(1039, 1406146863, '0', 'debc43483ca0c090ecb80b0bb74984a892db1dc9', 0),
(1040, 1406146868, '0', '4673942bfaabfdf1a5cb4272d257a813f3ff9df0', 0),
(1041, 1406146869, '0', 'b260c20dc1d4785e4e07221551e9b0651c11ede6', 0),
(1042, 1406146896, '0', 'a330a1521c53a04300843e075d969e8ac77b91ff', 0),
(1043, 1406146896, '0', '8508126ecc9cd4b0a3acf886437d4ca8de86b4bb', 0),
(1044, 1406146896, '0', '53cbf4bd24f0a3131f9b20cfc0d9d5f0a01a24f4', 0),
(1045, 1406146912, '0', '0be04f3de73fb72dae624555b81377701918efc6', 0),
(1046, 1406146912, '0', '2a5e02b66f0d40359bb8a27789ee629cf30e2dc1', 0),
(1047, 1406146912, '0', '7ec59c3298f76d2cb7c9eae693142d48e9ad89eb', 0),
(1048, 1406146915, '0', '60423dbbbda319f175f7e87bc1da08c5233eceab', 0),
(1049, 1406146915, '0', '836ba7a605576abc0e067ec7084ea79095bbaa5b', 0),
(1050, 1406146915, '0', 'ab92820710e4a2ef4b219b30c677d18748ab8b35', 0),
(1051, 1406146916, '0', '87b0561dde4c9aef1a513e06bfdd2b79ff680ba1', 0),
(1052, 1406146923, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6d30c43bac989b308fdf39eac2daa42fe0227b22', 0),
(1053, 1406146924, '0', 'ea897a139f129ae27a233f297d0c9337c0a3a91f', 0),
(1054, 1406146924, '0', '1cc2801f6813e360e22dbd6f1f71edefcef205c2', 0),
(1055, 1406146924, '0', 'dc46000bd0d2ac9d0285a50a91f92abc601e5b71', 0),
(1056, 1406146926, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '997ef1beec81b86b70bd09fa736310fa4d9f4943', 1),
(1057, 1406146926, '0', 'a004b62c9f44eb3e1c641458cca736d8e0bc1d18', 0),
(1058, 1406146926, '0', 'a93ecd26d2c03afb851a9bd2714eadaec4fa58c6', 0),
(1059, 1406146926, '0', '9bd47fff9d96157ec12dc429f00e272a65bc653d', 0),
(1060, 1406146940, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9611bf33f3e506c72b4b9784f3257dd3e2c3fe71', 0),
(1061, 1406146940, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9918e73e2cd3950f1e9c5b1d0d30d5f0bc9195df', 0),
(1062, 1406146940, '0', 'd16652f811e07e2981ec4fc7f23d31c6f589225d', 0),
(1063, 1406146940, '0', '80fa1f2e506ff4d87d4a1bf71ff5ca188b7fda87', 0),
(1064, 1406146940, '0', 'd2eeded524f5c454341a2e5df5cbed99370d255e', 0),
(1065, 1406146942, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3afcc61494850433a1363444a01ca2a00369792f', 0),
(1066, 1406146943, '0', 'a03f8aa3507a2e6d3e81963df209509f1957ffcc', 0),
(1067, 1406146943, '0', '1be9dd80aa6a3bf814bffde61926cabb4f5b9ae5', 0),
(1068, 1406146943, '0', 'f6dbfc82267024bb4cd9cd16baf8ef0ea15413e1', 0),
(1069, 1406146953, '0', '69177bf8a74265c055ab35fd2105089ee4d3ffbf', 0),
(1070, 1406146958, '0', 'fdd88b086397117f4626a7db73a37d8104af0f0b', 0),
(1071, 1406146974, '0', '87efa60d3e934687e70f38a4af289220ac2b5224', 0),
(1072, 1406146974, '0', '777bc313a921a756e57a9b4aeeec20f3b7866aa2', 0),
(1073, 1406146974, '0', '6a22fa27ca1c9d6c83984ee6e6b9dc1b3e98bd1e', 0),
(1074, 1406146976, '0', '1789655e1603a870f682a8431746a1826030ce6c', 0),
(1075, 1406146991, '0', '966299cbef2d27999f3428f5f957e54f654d7d38', 0),
(1076, 1406146991, '0', '9d30659634f9bb33e8eaa920ff27711492aa5021', 0),
(1077, 1406146991, '0', '7ddb34662d3daf7ce2afaac0e40492bbfe005baf', 0),
(1078, 1406146993, '0', 'd3e16d1e31833f430f05358a853bb6916a01a9d6', 0),
(1079, 1406146999, '0', 'a708766e85017b65389e18b67a4b261a132969a5', 0),
(1080, 1406146999, '0', '217ec62d50052220570d5db8fe1b2442daf4de79', 0),
(1081, 1406146999, '0', '5a826555efbbf6db1866152654e781611659f5a1', 0),
(1082, 1406147006, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1e41e240cb66c4db60426e68ac404d4f67555011', 0),
(1083, 1406147006, '0', '52e145343f9d284a868198a83f46375d8be556df', 0),
(1084, 1406147006, '0', '23ed31bc84a651325b99edb1ddec9cb6b46cc869', 0),
(1085, 1406147006, '0', '0278b4bd6498fec852e4f5f6db6866c2d8df6c74', 0),
(1086, 1406147007, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '467828defd5663c07cbfad281a373215e1a32bdf', 1),
(1087, 1406147023, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'fe2a48e0aabc74ed6d38aa2148cd5aedfa1345f9', 0),
(1088, 1406147023, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c284dfc0880af4ef712aa781b742939fcdbc8ece', 0),
(1089, 1406147034, '0', '40ce96076b4f6d99fbd451b49c12c924327a4f5c', 0),
(1090, 1406147034, '0', '61cdfba1f394eb70f9baca1b3bf48fddb64b09d5', 0),
(1091, 1406147034, '0', '8e93b6d9fb5ac783c9dbd164eabeb43fe68b1055', 0),
(1092, 1406147036, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5eaaff51e2e63ced126c10b976edac53f59d72b3', 0),
(1093, 1406147036, '0', '6e859e37b880925fe89daff09c3c33f50e2b4822', 0),
(1094, 1406147036, '0', '2a065df57a5fdc0f3795bfbca127bac20b440b3c', 0),
(1095, 1406147036, '0', '222f8a8550cf0db6d4acf3f43696d46faf0b590e', 0),
(1096, 1406147040, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8942e0f820cb8ce2eaa0bea73a6864b83e0a4247', 1),
(1097, 1406147041, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1919eca88c25a177f6f4ee79ecdb8195501d3e68', 0),
(1098, 1406147041, '0', '199b03c36085f77cbbae1a9b46c351ef5d63919a', 0),
(1099, 1406147041, '0', 'e673d6a50ec39c34898a92576eb4933142f9297e', 0),
(1100, 1406147041, '0', '63929344bc21a3a7ba4ea151db24b8f088f58d51', 0),
(1101, 1406147041, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b68fb862fc3fb453a4b535f67b038b3e929d750d', 0),
(1102, 1406147041, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2b91db420053dbb45b1033727c662c593905bdcc', 0),
(1103, 1406147043, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8373e08fa299f0c31dfd003a1640fc90a6db255d', 1),
(1104, 1406147044, '0', '63e07865c0ad0e4926f3ab8dc74026dd4db55299', 0),
(1105, 1406147044, '0', '7eb834d43068cd5d088e08b49a155dce14ad1008', 0),
(1106, 1406147044, '0', '21540d548aec5d2da68e17b0b586cf66e63b0028', 0),
(1107, 1406147045, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'd9bb855e04a72a1053548b82bb417ac51fd10068', 0),
(1108, 1406147047, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '950fd0247b7310b031554f51eac631dc5b73ba06', 0),
(1109, 1406147047, '0', 'bddb5214ec46efb903006cccd83193919000c625', 0),
(1110, 1406147047, '0', '3906a050e2b4c09c393f71bb5d7534b452156c0e', 0),
(1111, 1406147047, '0', 'dadf87419cdf58f10a537c8be663e2596e07a7a8', 0),
(1112, 1406147048, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '42fb47d0fe19a527a7ceee605c1af1ad3734b0ca', 0),
(1113, 1406147048, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'f226a4a08a102dc81b4d6c50917c68299741e356', 1),
(1114, 1406147055, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '27dca9830616ea39fa113788d4daee3d9f523096', 0),
(1115, 1406147055, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '7d26a44abecb27accb5138cbf353e2d8b9fde1e4', 0),
(1116, 1406147055, '0', 'bc01f560d8ced96386b111882f5736e8c56f38d3', 0),
(1117, 1406147055, '0', 'fb2ecba1349c84b633fa1ae99ef246b1c89795b6', 0),
(1118, 1406147055, '0', '92bf1e9aab167d5bc28d2959f777cd8dd162a188', 0),
(1119, 1406147059, '0', 'bbd64a4b6a45f61bc6968a02d23bb481f7e4035d', 0),
(1120, 1406147059, '0', '5b25a13e7d690da62c82426623da2a747393549b', 0),
(1121, 1406147059, '0', '5b550a27394fe339bce05d0815c6b88ea99b210d', 0),
(1122, 1406147063, '0', 'c8e9dfbbfb7291ef4a9e8de7a635db021ff2cfa8', 0),
(1123, 1406147065, '0', 'eaf6b178ab38c8ce1da566e7dc0f0762466c9c88', 0);
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`, `used`) VALUES
(1124, 1406147075, '0', '1ae178a5ceabc9090d3ff03a87b33e3be7a47a51', 0),
(1125, 1406147081, '0', '734eeb5b14b86f535214ea60fb9d43d6f7e5523b', 0),
(1126, 1406147082, '0', '1c8ed035afc9e6d30179db44f98b5862294e284f', 0),
(1127, 1406147086, '0', '396bfed8f58a7e8d946046fe45a3f2362479268c', 0),
(1128, 1406147089, '0', '54f9898fff7586f4dee87e01b16cbf8e44e5f0a3', 0),
(1129, 1406147092, '0', '56f7a09c3dd18eb29bcd458bab77ebb9d0f42e33', 0),
(1130, 1406147093, '0', '003e12201278c64281c99fe569da91d30d99b236', 0),
(1131, 1406147094, '0', 'dc6e8991b3922ab9bf4beb2cf22bdcf643f83a15', 0),
(1132, 1406147102, '0', '17ce3447e1e38c7e062565854a1b65c177923fc0', 0),
(1133, 1406147145, '0', '30a2ca0d14e06e4bd39bbf25d50887756be0caf1', 0),
(1134, 1406147145, '0', 'f423697a3e7a01d32db9666ee5e636339fc59d27', 0),
(1135, 1406147145, '0', '839fa1b8a45d23ce173d9f4b19002d539ff95fc2', 0),
(1136, 1406147153, '0', '16d5add5d8040e65b0a3a6c7327fb0fe73a9eae4', 0),
(1137, 1406147157, '0', '1ebb0a013a07c7f12f69284d7902b43f28e9af47', 0),
(1138, 1406147195, '0', 'dfb056018c35d8d17ab35e01d51237c84450d281', 0),
(1139, 1406147204, '0', 'dc4cf2def1c7b5c743962b64989a6d0f316ee017', 0),
(1140, 1406147204, '0', '472b6dc1a68b76cca3b001667a7ed21e179064a6', 0),
(1141, 1406147204, '0', 'd960159d677e008bf36048fa175d031161a22681', 0),
(1142, 1406147214, '0', '4c983b13789eb628c24e6bff308237dbd8074643', 0),
(1143, 1406147214, '0', '50f1638edd60c83b598caa3b18829efcf4047c4e', 0),
(1144, 1406147214, '0', '4833225b3481b547cd692a25504e760216548035', 0),
(1145, 1406147217, '0', 'a9fdcdb87763d0c63cd4bfb3776524b78429dcba', 0),
(1146, 1406147221, '0', '53bfc436f220580e9c4ac883385d3b7224899891', 0),
(1147, 1406147221, '0', '2fd41df37c99512d1f750665cbda6d3261965a87', 0),
(1148, 1406147221, '0', '2e502893803765e81eae33aca63c4ed4671040dc', 0),
(1149, 1406147226, '0', '24e2cf3dc863a25876712e05745a2789663c28f4', 0),
(1150, 1406147226, '0', '9c44b1f61aaeb68b35226bb8855c0ae098d173c6', 0),
(1151, 1406147226, '0', '79cf237d7fc873fc1e7ed3c63f49a5c3ddc0e8b3', 0),
(1152, 1406147235, '0', '198f292f3bdea9eb820486c59d549a4c28e347b8', 0),
(1153, 1406147235, '0', '5c1e7adf6ccc144683656cdba5382b2368fc262e', 0),
(1154, 1406147235, '0', '1017ede5a77eefd4a166bb3ae7890e2afbf4ee8d', 0),
(1155, 1406147252, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'acbb4d0d316fe5df3845ecf6c61542a98162a018', 0),
(1156, 1406147253, '0', '6b8dd0f320193b569cc4c7cc613c6d950d26b58b', 0),
(1157, 1406147253, '0', 'c0110c1e4aeeeb04eef8eb490f3b9ae168c94365', 0),
(1158, 1406147253, '0', '0f0363ea5c66413afaffb4d58f2d740d5d98f810', 0),
(1159, 1406147255, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b2a08899884a40157519f183b2dda1c2042de5c3', 1),
(1160, 1406147256, '0', 'dac0c94b456e98beca048f8804d528b3d6707d30', 0),
(1161, 1406147256, '0', '741560c3826a7f7da2fb2785f137692277da7868', 0),
(1162, 1406147256, '0', 'a3ae0cade1906b749ea84bbed8135a083464e049', 0),
(1163, 1406147257, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '558ff626b99dd3af42ad88e362dd0ec4e9d6bc22', 0),
(1164, 1406147257, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '889a493c0c0c0ea4ecd3295f486f7ad57ff7584b', 0),
(1165, 1406147261, '0', '6136746950ee42a143d175f428e29da7c3483a00', 0),
(1166, 1406147273, '0', '39092a728659be4a21a252bc5d1c97ca870eed9a', 0),
(1167, 1406147273, '0', 'fd5f9f63e7fde0c0ce688e2dd47a0799b3973492', 0),
(1168, 1406147273, '0', 'e5e8a9e34731dc5ffd2e179a03134bae4108fc72', 0),
(1169, 1406147284, '0', '87ace2a4c4f31a8febec0a124971dec381ca6b4b', 0),
(1170, 1406147284, '0', '4920920ef2184e823b86daf28d0809dbc8ca1270', 0),
(1171, 1406147284, '0', '53e7fb7459e4dee5f3bd1ba42c557792ebdad267', 0),
(1172, 1406147290, '0', '9444919a32896b40973d3317fd57ff6c4f6daf64', 0),
(1173, 1406147290, '0', '6986976b9d1c07401a478e60e40e038c08baa2dc', 0),
(1174, 1406147290, '0', 'e8ecfeb7f733f5d44f18fa81c0b601ebd2f20a52', 0),
(1175, 1406147295, '0', 'b6932d64c904fa07308811a11eac1e6b091cadc8', 0),
(1176, 1406147295, '0', 'ee137e1f8347a629463d0bbd3f833a58da4a903f', 0),
(1177, 1406147295, '0', '3461f9131e2576306d519951913d2323032eb6f7', 0),
(1178, 1406147300, '0', '9a05f0e76e16935719eec244ef807e5633833907', 0),
(1179, 1406147304, '0', 'e9083d02d556713a6bb0914924bb91f3ce763945', 0),
(1180, 1406147304, '0', '60aad10530cfda2b73a5925fd20e15bce2b00f15', 0),
(1181, 1406147304, '0', '984bf84bc0232ab7f3fd77cce9838aeb5ea1a6ab', 0),
(1182, 1406147307, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '36dac00cb14cad419aa215985b8e51be673c0ef7', 0),
(1183, 1406147314, '0', '6ad6d73d462868abb9c4e32e0bcc38d1f71fda83', 0),
(1184, 1406147314, '0', 'd472fde1d2a5265c095a4c13a9faefdda25a0bde', 0),
(1185, 1406147318, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3735d454dcb7f5238bac2ca1784b14ee637e224d', 0),
(1186, 1406147332, '0', 'de7dda629f9440fc062b874eb1ceca9671451849', 0),
(1187, 1406147332, '0', '9987ce4c97ec372407dacb6f45166d7af5bcd582', 0),
(1188, 1406147335, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ee7c246ff3c5239986590e9b97d4a5014baa65c6', 0),
(1189, 1406147351, '0', '569a78821476da70eb62754d27176d8b02c36f22', 0),
(1190, 1406147351, '0', 'f1be03aa3250db2cd3d9969f398db6a48be1a1e1', 0),
(1191, 1406147354, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'd10f998155c028c104a77227508ed9a1e1993364', 0),
(1192, 1406147460, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'f963ea24c21eb14fcf0039fe6fce19ac1208a708', 0),
(1193, 1406147467, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4746bd478d9bd7b21b5a1e2e68ca2a2e28f4a985', 0),
(1194, 1406147482, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '33eedb09036b16b4d86eeeef75f32fbdc41b59f5', 0),
(1195, 1406147635, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'dcb15ab9b18843b233e89708e300770f7885a163', 0),
(1196, 1406147641, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2a15300569cbca10d3eecbaa4bc3eb0abf2b94a2', 0),
(1197, 1406147642, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6ff9dbe845bc36d0fc89c6e033f59c2043ae43a9', 0),
(1198, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'db3b445392aac705e1abbeac4278ce45dde73d29', 0),
(1199, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '76e1989e22a5150168f442958b2ccb98c463f755', 0),
(1200, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ece32e7f269369fd24524f330de4bbfd1366cd9b', 0),
(1201, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '36c90509bfa75b9db5418e7441c1090248237059', 0),
(1202, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3b5ed6839b48a6c7997a02f38a4658285ae67add', 0),
(1203, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0f0af8baaf382b308702a452c0136a229cb0c9e9', 0),
(1204, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ad07a81746b42b58eb49d836e9a6689c8373a0a6', 0),
(1205, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c6f4dcacfd90d9ec644e9375ffe81171364b2065', 0),
(1206, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b37b2d6255a994cce5421e9a5c702259603c7b29', 0),
(1207, 1406147643, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0029d572618c18b30e66aebedee31fd05f6083b0', 0),
(1208, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '45c880d77af83edbb81415384f097b935d134ef0', 0),
(1209, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8f3f8511a403bd3a2f3836638cbbcef75808df20', 0),
(1210, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '1c663607ddff746fbee0f8a02530e96ad47dbef2', 0),
(1211, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b206586617fb7429c5954f1930ad401a7cd0fb05', 0),
(1212, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '67af36448aea4a791764488c12e3d1801a630ce1', 0),
(1213, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '014b6e6dc98aea932918e8ba1bc14bc3ddb56707', 0),
(1214, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4470325d52f284ff966e6cb32333b15048e13dc0', 0),
(1215, 1406147644, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'f9033981d22a16bf7b498eceedde4ee32687f3b3', 0),
(1216, 1406147738, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8b59dd3343fd66f2ed14e3aa3ef5307e311a70c4', 0),
(1217, 1406147784, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '7d5485ed04dec3698aa830d5d7cc0db9f01b1246', 0),
(1218, 1406148081, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3e95c5555e9ec06c93586e532cf030dfea700a4c', 0),
(1219, 1406148092, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '725bd8b7768b04b41fdf509bce07a719caff669e', 0),
(1220, 1406148095, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '63c8ef33be7b0e9550a635cd8f589b8fdd4d5f09', 0),
(1221, 1406148148, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '16b710c704347b89ef2ce19f8d87f0295558fa0f', 0),
(1222, 1406148152, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'fa5c61f825ef45d5c8de55e2e51c4958c7beed7b', 0),
(1223, 1406148155, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2a40d35cad2cfb7078cbf259d3e1b2f58189b527', 0),
(1224, 1406148160, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'af8eab7c10b39572b5e4fb37057045cee9b6da92', 0),
(1225, 1406148164, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '22c75a13cd0f08c092ebfa30a4f3c418d5fe2401', 0),
(1226, 1406148167, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b80a960e1c4ed3073e612562b1003f7f5b160570', 0),
(1227, 1406148182, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2322aed8391a6439563798b2e629835ecb9ed536', 0),
(1228, 1406148184, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0377f68e9f1903a024abdf36cb3c3c30bd01de90', 0),
(1229, 1406148187, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a469e75e7b29c1f85a16ec4ff2a27cb3aa364900', 0),
(1230, 1406148191, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5ac9e519ee1b57b56410725c386c7e2a86a3d73f', 0),
(1231, 1406148228, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'd9a1406c5652f7f59824da8f4693d28ff8c20771', 0),
(1232, 1406148230, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8ca39552ffd240eb957ee903206a08a7e08fbac9', 0),
(1233, 1406148236, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '923ae8828fdcce3eafda743ed022725557f282f5', 0),
(1234, 1406148239, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '75b8408e08a208279e39fe5d568b5f52fdcf60ee', 0),
(1235, 1406148245, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '922f8cba0b4bbbe6eac7ef806e12424ff264431b', 0),
(1236, 1406148249, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '845d31155660372170d7718c991814d4054166eb', 0),
(1237, 1406148274, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ad4e4fadfba42319ff5244a6aede61db2e3d9c2f', 0),
(1238, 1406148275, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '9a9e300c0e91ed7373045658b55d8d75bbb7b5bf', 0),
(1239, 1406148275, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '70f7117fdfa0383de5435d1b35a21ecb4f9f1566', 0),
(1240, 1406148278, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '71ee09d54c2d4cfbdae0cf3924e409815bcb73cc', 0),
(1241, 1406148282, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'e5c8a4e605bd1a2fb72b57da835f715001f04efe', 1),
(1242, 1406148283, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ccc2827474ca67a996749088cddc1c97267545aa', 0),
(1243, 1406148284, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a31e8722c26d8b0e7fba2bd499dac1bfd963e1b7', 0),
(1244, 1406148284, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'a2b5acd447db6359ea8500e5c1a2d8a0ad880c95', 0),
(1245, 1406148287, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '36860d56b00fc4d3fdec8636cc03b3881854ea16', 0),
(1246, 1406148289, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b4fa224f01590af26c6c0d2d50735e5d744a291e', 0),
(1247, 1406148290, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '501fbd6148ba1c978d38f09a5d578e347007b499', 0),
(1248, 1406148290, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '51657fec1043ab1453dedbf9d3a5f63c5e2501f3', 0),
(1249, 1406148308, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '6aa3f950352463042610e234be2e178a856f32f4', 0),
(1250, 1406148365, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'dc41e3118dce2709cf69cdbe7eeb9cc11ed75b17', 0),
(1251, 1406148365, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ea64f83e8f72a18c6096292ea3a364eac2999219', 0),
(1252, 1406148368, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '00c282a5d4e6fcf34476217878edcd609b5eb8b6', 0),
(1253, 1406148381, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '459200d4ec47474ce7b017066183e9befed1ee72', 0),
(1254, 1406148383, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2d29f8dfa76561418357befbde2e55767d54bb2d', 0),
(1255, 1406148385, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4fe70a266519033c98d9e536fb35bd97c9031cd0', 0),
(1256, 1406148386, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4260cec20db0a7e6db2f18bef1868989cf9c0665', 0),
(1257, 1406148411, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b6a1db941548bd71ceb4eacac2eba508d1b1bae3', 0),
(1258, 1406148604, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '28594189c3df180ceb3920e3979e4197c5501b0b', 0),
(1259, 1406148605, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0f5cb9fd7c23c4dd247519d55de54eb4602e8741', 0),
(1260, 1406148607, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5bf436b32a6e75effd43a060a274eb738dcf8271', 0),
(1261, 1406148608, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4e0a173385e930af68ca885b07250e40a7797046', 0),
(1262, 1406148609, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '5e9987356a9a8767ab35336d62dff302f48331ad', 0),
(1263, 1406148615, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '0771a741e93aa1669aa5d6dc74763c2d3f3bbcee', 0),
(1264, 1406148617, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'c563cf5a74d29d8241982815555e666a08d9d154', 0),
(1265, 1406148618, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '314af597fd8f0aa291c1a8ff7182054935579558', 0),
(1266, 1406148620, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '48223ebc82ce7e499a44efcf14f1b2dac8e9fd1d', 0),
(1267, 1406148626, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '67b0a84bfe3e64353b79964a6aff79c3cfdf5136', 0),
(1268, 1406148717, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'f7fe984d49c7e982d06547871666a70d7280b35f', 0),
(1269, 1406148727, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8b5f3ce6af797a54edf81a5096514a428774f6d6', 0),
(1270, 1406148728, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b64c30ba1a719d2b37d4d7b81d46b308981bc71a', 0),
(1271, 1406148729, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '8a2284ea10f48791a2ea122af3ee7bd867caf589', 0),
(1272, 1406148730, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'b6b483d52fa87df2de2db95c35165edf211b81c1', 0),
(1273, 1406148731, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '894d831dec16af89e7b2094ac137230b72b4514d', 0),
(1274, 1406149680, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '669c40a42e607901a3984574aaefcd1a4bc33695', 0),
(1275, 1406149685, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '2f2bee8bbbb09a81a450f92365abb2357d44a153', 0),
(1276, 1406149689, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '31fbc9f081eb823d4cccda6258eb017707ea7c08', 0),
(1277, 1406149692, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '3d753a7ba55446a3072bba7a833888e6e89d479c', 0),
(1278, 1406149694, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '373b351c66ee722ebf95be7c27d18fe19cff91d4', 0),
(1279, 1406149696, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '4b604fdd4785119ee37dd91cc8ad80a8583759bc', 0),
(1280, 1406149697, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '24d200a1a9ac55555d1866e1807913bccd31e705', 0),
(1281, 1406149700, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'ed633def932daf1a4805f25ac9edecf1be272a82', 0),
(1282, 1406149703, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '78dfee0343bc993930169f8b87a7dcdd1670a685', 0),
(1283, 1406149707, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', 'e4cd8dfca6012166dd427c178fcdd08f5415f155', 0),
(1284, 1406150722, '3bb4d93a34dfcc8651d94a42d9da4df735fa6be0', '88595c016b608cf795b66bb8d0fcb39aab2163ec', 0),
(1285, 1406151611, '0', 'b1a18a20b681320ffb74f864c5e3e40011e7b6df', 0),
(1286, 1406151611, '0', '4e36889589021c82c633ae1f0a6debcce9942897', 0),
(1287, 1406151611, '0', '913f5b8139fc458a72e5f9ebaf99bd3631807176', 1),
(1288, 1406151613, '0', 'c589de1988a7ae3edeb1471ddc0b693907ebb041', 0),
(1289, 1406151613, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '1d6e8ee12cf677fe410647ef5368e98a675584e0', 0),
(1290, 1406151615, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '09aec371ea8ec095795caab9b475511a52addd9b', 0),
(1291, 1406151620, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '482bf03fefa705a0cf6209e05ce7d92c3b073ed1', 1),
(1292, 1406151620, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '9f9adccc60f3731f7ae4e65935757461489e93b9', 0),
(1293, 1406151620, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'f653950f1a0007a6041f33a3b79c36800d5690e8', 0),
(1294, 1406151620, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'c16d3435a745aaee4312cab6ab9f08b8fabe0e3d', 0),
(1295, 1406151640, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '42a107cb32d0bae556b0a3c67a34dd3170af9826', 0),
(1296, 1406151641, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '942d27f5903877501ec714add518a98f71f4afff', 0),
(1297, 1406151643, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b7bf6633e361f53a901320c6671193f11cf1c9ec', 0),
(1298, 1406151713, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'd462482b8557abfd2f4dab3d7a342e472a2a1cf7', 1),
(1299, 1406151713, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'dfe03e138e2aab6e5717ef48805a2c5b1a548dfc', 0),
(1300, 1406151713, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'c4467fbd3a962f7b3a3c1a6069babaacc6b9abd1', 0),
(1301, 1406151713, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '7de6976efb2a466f4adddaa9075f311b0260e7b9', 0),
(1302, 1406152869, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'ce7b28eeb652fb1ced35ce9355693cb3aaed9ddb', 0),
(1303, 1406152869, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '0a610f5caf85993e46ecb2b1a668faa0915276b1', 0),
(1304, 1406152904, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '0f19e894957d4d94654290d21a9ce4c62511cc58', 0),
(1305, 1406152905, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'fbed6c5c25d8cdffd61639f6e7bb38ae309178ca', 0),
(1306, 1406152905, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '8f379102ece22aba40c48a335362e97ff3bfdd18', 0),
(1307, 1406152905, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b3904f7a2bf47d38ada96352bcde0dff688d854a', 0),
(1308, 1406153029, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'ca9eceb928d53252930ab21c3c5050d26abe9a5e', 0),
(1309, 1406153042, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '1bc0452587bffce0f5160e27817584f28381e5cc', 0),
(1310, 1406153048, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '5bf1a1537f9de0879f28fa48138e9844da79a04b', 0),
(1311, 1406153064, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'a9c4503dd74dfe10667dfda55d2640aebd630b24', 0),
(1312, 1406153068, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '97ea67800a30b4755dfaf1021abded3cad01724e', 1),
(1313, 1406153068, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'f2260af283c657c65ae230f75fff48fc2939da2b', 0),
(1314, 1406153069, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '6f03c70bb3bb0d2be039cee143bc8ed8cb963d50', 0),
(1315, 1406153069, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b3fe450cbcc69ce680baff34e59db76ca35773c7', 0),
(1316, 1406153102, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'bb8aa9d264270a26263df13e9b3e0cea97a4cd21', 0),
(1317, 1406153102, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'eb81a06403b5bf34cff9c1723fdfabd267321942', 0),
(1318, 1406153108, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b4666317dd6281a741b2c6d1bbdcc3e3c3b03c62', 0),
(1319, 1406153159, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'e8a31f0404e0b7243b598024a791e60782296a9f', 1),
(1320, 1406153160, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '7d48bc67fd2cef77ef85f7ff23a4253dbae8b5a0', 0),
(1321, 1406153160, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b86f9414a93848dc70ed37ed9f24b0569e8780f3', 0),
(1322, 1406153160, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '289ead998c2ce22d30d359adc2508571a4628538', 0),
(1323, 1406153247, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '3a1999df8eda8abfc4243f7b276a21916a4de4ec', 0),
(1324, 1406153247, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '4ab7d145ac363861c9354680d281d2b03bd65a24', 0),
(1325, 1406153252, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '245140c56d86b531abe5f961be08b74a3b698db7', 0),
(1326, 1406153278, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'ac1ca12326e5f61f2b8666ba02777ccb2be4f6be', 1),
(1327, 1406153278, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '8315180f844b3acf254b821483ca0968d6dbfe5a', 0),
(1328, 1406153278, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '76b048cabd1ecceb7bfbbf2720bafccef8439b31', 0),
(1329, 1406153278, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '280067662c9648dbd494049c33b117cfb46ffa5d', 0),
(1330, 1406154160, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'f8adccbb553e053ea72e7554d88065c91ed45b24', 0),
(1331, 1406154160, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b40f2166c3fdbb35b3e982082320f9cdf79eb3ae', 0),
(1332, 1406154167, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'c45b4219715c4df2d66b60159eb4000241a3eb8e', 0),
(1333, 1406154188, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '78dca9aaa8cbbe7b2e7629dc53be942f46b25f59', 0),
(1334, 1406154196, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '244c58d23176425f2230ace58ba2470803458bf0', 0),
(1335, 1406154202, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '7e25d475231d3516b47da695248ff72c35c9f413', 1),
(1336, 1406154202, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'c60682a7b806516f61a8b13f18a8ca2a45cbf29c', 0),
(1337, 1406154202, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'f0e0039155861c09d6cd5a302ae55b88556cbc38', 0),
(1338, 1406154203, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'b2d813439aa8e8c7e23190e2b0b40422884023e8', 0),
(1339, 1406154954, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '240fab14439cb790931b6b3e340627fe0c96ef31', 0),
(1340, 1406154954, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'ba8ecb225220ba21a9f1a66510e767d2ce1d1aaa', 0),
(1341, 1406154961, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'eb42927f0cc46882034f126a197c8d1601a6edc7', 0),
(1342, 1406154970, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'e5df311fd40ec28051a649304d7ad1211c4fb382', 0),
(1343, 1406154982, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '230825d41da997b4a2082b6d1265b3f86c03e6b3', 0),
(1344, 1406154984, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '1c7c3d34577d399c504678b7e3254b9ab904eee9', 0),
(1345, 1406154984, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '6dd730945f9d3e412ab112b3b087ad75f54356db', 0),
(1346, 1406154985, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', 'c126981d4986aa27a9b7d9f139831c677492f7d6', 0),
(1347, 1406154985, 'bc7afd28bcac6bbc09bf9e48f47b57e19d4727c7', '92071406a6d8383c89d9c3d870a52c018019cde1', 0),
(1348, 1406155222, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '82a05806b2e9a2590c3d596635c8a6dd075ddd1c', 0),
(1349, 1406155226, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '0b6146e9bea3f565233cbd20fb884451865b65fb', 0),
(1350, 1406155243, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '7b3cd778a1a3851a097aa49772e00f49ad3dd09d', 0),
(1351, 1406155264, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '01d6048627967337cdeaf6de4963552101668aed', 0),
(1352, 1406155268, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '0e58bceed339990324c38f00c69b9ad08ea4fd1c', 1),
(1353, 1406155268, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'f51cef8f3fde5db0f5e53d7e1483d06dcd59832f', 0),
(1354, 1406155268, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '64b99c6d351d586e9ea8fd35b2e04971f0531339', 0),
(1355, 1406155268, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'de8e1f6a4d05eaa1d445a47f25b725229acee5d3', 0),
(1356, 1406155438, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'eb048c425d1a652ef7d3969849f44d280ca54ef0', 0),
(1357, 1406155438, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '65088669ebc5f2333a0ebb7e5d17a3e72075e326', 0),
(1358, 1406155443, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '0cbda6bb3a1b1e98abb33616acb20e4d9dcf4aaf', 0),
(1359, 1406155453, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'c423c89e16480001f8efbbf6c9b20aceb6a75d39', 1),
(1360, 1406155453, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '64069491f44fede499df399d6a2b96b63fa19903', 0),
(1361, 1406155454, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '6b3bb90db00469fad77e5c7f5e3f1e76b5370790', 0),
(1362, 1406155454, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '1b406c56b0ba29d2a0fdeebef15d8101d52ad1e3', 0),
(1363, 1406155479, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '99b6bef4079fed0dd98ef8cda8c10a5a34145b19', 0),
(1364, 1406155479, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '842785caf03fadf87810f6a16ea12a993b327c20', 0),
(1365, 1406155484, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '318cab979e26c64dca59d030f0fbf475aeb4cae2', 0),
(1366, 1406155500, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'db69d574cdae24292a18940b3c955548969d7851', 1),
(1367, 1406155500, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'a8734e1761ab1bad7dc0c02fe417022aed11ae0d', 0),
(1368, 1406155500, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '93d19f6d5cb07b399aeafb5ec0107870d6a5cbbd', 0),
(1369, 1406155501, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '04e6b5d5a56f8f74d0ff612935359a5b6f76ff9c', 0),
(1370, 1406155515, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'dd1e32369d8353a2727d26926e0c38ae54214096', 0),
(1371, 1406155515, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '2f60ab5b49a3145f26fd2219fb6aa074046a287e', 0),
(1372, 1406155519, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '4aa9ed6f74e50782b80b146eb85d3220fbbdce89', 0),
(1373, 1406155625, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '97edaa22bed2171ffe477b0c5266c682c21b3ce5', 0),
(1374, 1406155632, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'f787f288b99bcf1668d1a22f382feacf483b595e', 0),
(1375, 1406155655, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '871af6f2f108c5cac99b8086c072cf710ade50d4', 0),
(1376, 1406155659, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '001925c7f3db0d00dd8201b223f90a57f0c555b1', 1),
(1377, 1406155659, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '3135c62ec0875f1d55e493f11ccd16b8c095b051', 0),
(1378, 1406155660, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '8cdab47110c2def5c31db8dd22723f38bacf8e25', 0),
(1379, 1406155660, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '2f710eea5f0630e9c45f3b9f374e733d5419cdc9', 0),
(1380, 1406155764, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '2396b06ccc91cca9c74249521cd2c5a026e35962', 0),
(1381, 1406155764, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '1d38906f9fd7d612a9c86758a8be8dd8419d8de8', 0),
(1382, 1406155773, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '756fce8d0204bbc6f2698e4cae50a7cac8918657', 0),
(1383, 1406155800, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '375998a45a0770a24950269657d46a1fa86d3345', 0),
(1384, 1406155815, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '8df743ae37d91cd1ffa3c27ed3705badd5940e1e', 1),
(1385, 1406155815, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '59a1385db6510c104c5627f5c60d282f73170bb1', 0),
(1386, 1406155815, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '576694e1f70b58720af64061a2f5cb1e5c441793', 0),
(1387, 1406155815, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '99494b873cbfb4aaaac7ad461b11d779a2b50be9', 0),
(1388, 1406155994, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'f378c1cdf379d52bf4169f7bafc7bb0d8f98a658', 0),
(1389, 1406155994, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '75802146b872c88adf6b3be1d027d57d10b1bbb4', 0),
(1390, 1406155999, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '2a9f6f97acd4bbd3256eed1daf1558c9f9c78d2f', 0),
(1391, 1406156006, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '64e22f200aa26517cc7e0ebbe25e501c050df051', 0),
(1392, 1406156019, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'a86a7a088722ef923f87206324a48020f7a24143', 0),
(1393, 1406156022, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '610b8a11fbbf25e0bf75835d48f007281d13ac7d', 1),
(1394, 1406156022, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '6ca8af2ca89b922c8035bb6fa286184d023c5f29', 0),
(1395, 1406156023, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'caf0ecd99f4845000855e18c26089bf08c822d81', 0),
(1396, 1406156023, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'e01d909ef60e0d59f9b923adcb0b5bfb4e8e7293', 0),
(1397, 1406156142, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'f36ae86d32e708c49ed04097df59f52b66967341', 0),
(1398, 1406156142, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '3cc1fd4201ff82c32b4c4c0426968bd8daf9c45d', 0),
(1399, 1406156150, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'f83a843a8611d737e084ad52b5a58bfcd92b1649', 0),
(1400, 1406156177, '1559ffdeb5b4adcf007c67068163eec980ecbb88', 'bebb9369868fcaa6a44660dd48a0a08038a3e30f', 0),
(1401, 1406156183, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '6112c114578e41637540a9d6becbcc0f8c232a94', 0),
(1402, 1406156193, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '6235a6e51a2b12ea542f6068a91794d76c139c98', 0),
(1403, 1406156204, '1559ffdeb5b4adcf007c67068163eec980ecbb88', '3a96919f28b0018f8e8b1112a307d1ea1b76db33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `sess_start`, `last_activity`) VALUES
('1559ffdeb5b4adcf007c67068163eec980ecbb88', 1, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '1e75a1e5da8c6102ebdd341b45f83030', 1406155222, 1406156204);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'SuperGeeks', 'default_site', NULL, 'YTo4Nzp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6Mjk6Imh0dHA6Ly93d3cuc3VwZXJnZWVrcy5jb20ubmcvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjM2OiJodHRwOi8vd3d3LnN1cGVyZ2Vla3MuY29tLm5nL3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoxNDoiamF2aWtAbGl2ZS5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjQ1OiJodHRwOi8vd3d3LnN1cGVyZ2Vla3MuY29tLm5nL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czo1NDoiL1VzZXJzL2phdmlrL0RvY3VtZW50cy93d3cvc3VwZXJnZWVrcy9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjEyOiJBZnJpY2EvTGFnb3MiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTI6InNlY3VyZV9mb3JtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6NDQ6Imh0dHA6Ly93d3cuc3VwZXJnZWVrcy5jb20ubmcvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQ1OiIvVXNlcnMvamF2aWsvRG9jdW1lbnRzL3d3dy9zdXBlcmdlZWtzL3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjt9', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDQ6Imh0dHA6Ly93d3cuc3VwZXJnZWVrcy5jb20ubmcvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo1MzoiL1VzZXJzL2phdmlrL0RvY3VtZW50cy93d3cvc3VwZXJnZWVrcy9pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NTA6Imh0dHA6Ly93d3cuc3VwZXJnZWVrcy5jb20ubmcvaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjU5OiIvVXNlcnMvamF2aWsvRG9jdW1lbnRzL3d3dy9zdXBlcmdlZWtzL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjU4OiJodHRwOi8vd3d3LnN1cGVyZ2Vla3MuY29tLm5nL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6Njc6Ii9Vc2Vycy9qYXZpay9Eb2N1bWVudHMvd3d3L3N1cGVyZ2Vla3MvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo2MDoiL1VzZXJzL2phdmlrL0RvY3VtZW50cy93d3cvc3VwZXJnZWVrcy9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo3MzoiL1VzZXJzL2phdmlrL0RvY3VtZW50cy93d3cvc3VwZXJnZWVrcy9zZ2FkbWluL2V4cHJlc3Npb25lbmdpbmUvdGVtcGxhdGVzLyI7fQ==', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToxOntzOjQ3OiIvVXNlcnMvamF2aWsvRG9jdW1lbnRzL3d3dy9zdXBlcmdlZWtzL2luZGV4LnBocCI7czozMjoiYjY2YTc5ZGJhNGY2MTg5NTYxNDA1YTliYWYwYjJkNDYiO30=', 'YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6MTA6e2k6MTtzOjg6Ii9jb250YWN0IjtpOjM7czoxMzoiL3RlY2gtc3VwcG9ydCI7aTo0O3M6MTY6Ii9maXgtYW5kLXJlcGFpcnMiO2k6NztzOjE0OiIvd2h5LWNob29zZS11cyI7aTo4O3M6NjoiL2Fib3V0IjtpOjk7czoyMDoiL3NhZmV0eS1hbmQtc2VjdXJpdHkiO2k6MTA7czoxNToiL3ByaXZhY3ktcG9saWN5IjtpOjExO3M6MjE6Ii90ZXJtcy1hbmQtY29uZGl0aW9ucyI7aToxMjtzOjQ6Ii9zZ3AiO2k6MTQ7czoxOiIvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6MTA6e2k6MTtzOjE6IjQiO2k6MztzOjE6IjQiO2k6NDtzOjE6IjQiO2k6NztzOjE6IjQiO2k6ODtzOjE6IjQiO2k6OTtzOjE6IjQiO2k6MTA7czoxOiI0IjtpOjExO3M6MToiNCI7aToxMjtzOjE6IjQiO2k6MTQ7czoxOiIxIjt9czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly93d3cuc3VwZXJnZWVrcy5jb20ubmcvIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color: #ffffff; \nmargin:        50px; \nfont-family:    Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:     11px;\ncolor:       #000;\nbackground-color:  #fff;\n}\n\na {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:   bold;\nletter-spacing:    .09em;\ntext-decoration:  none;\ncolor:       #330099;\nbackground-color: transparent;\n}\n  \na:visited {\ncolor:        #330099;\nbackground-color: transparent;\n}\n\na:hover {\ncolor:        #000;\ntext-decoration: underline;\nbackground-color: transparent;\n}\n\n#content  {\nborder:       #999999 1px solid;\npadding:      22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:   bold;\nfont-size:     14px;\ncolor:       #000;\nmargin-top:    0;\nmargin-bottom:    14px;\n}\n\np {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:       12px;\nfont-weight:     normal;\nmargin-top:    12px;\nmargin-bottom:     14px;\ncolor:         #000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color: #ffffff; \nmargin:        50px; \nfont-family:    Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:     11px;\ncolor:       #000;\nbackground-color:  #fff;\n}\n\na {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:    .09em;\ntext-decoration:  none;\ncolor:       #330099;\nbackground-color: transparent;\n}\n  \na:visited {\ncolor:        #330099;\nbackground-color: transparent;\n}\n\na:active {\ncolor:       #ccc;\nbackground-color:  transparent;\n}\n\na:hover {\ncolor:        #000;\ntext-decoration: underline;\nbackground-color: transparent;\n}\n\n#content  {\nborder:       #000 1px solid;\nbackground-color:  #DEDFE3;\npadding:      22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:   bold;\nfont-size:     14px;\ncolor:       #000;\nmargin-top:    0;\nmargin-bottom:    14px;\n}\n\np {\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:       12px;\nfont-weight:     normal;\nmargin-top:    12px;\nmargin-bottom:     14px;\ncolor:         #000;\n}\n\nul {\nmargin-bottom:    16px;\n}\n\nli {\nlist-style:     square;\nfont-family:   Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:       12px;\nfont-weight:     normal;\nmargin-top:    8px;\nmargin-bottom:    8px;\ncolor:        #000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(12, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(13, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(15, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'SuperGeeks', 12, 0, 0, 0, 1406147040, 0, 0, 1406156204, 6, 1406154961, 1406743995);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Statuses');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, 'index', 'y', 'webpage', '{embed="Main/.header" body_class="home"}\n\n<!--Homepage Banners Begins-->\n      <div class="SGBanners-container">\n          <div class="row SGBanners">\n        <div class="item">   \n            <img src="/assets/img/SuperGeeks-fix-install-service.jpg" alt="">\n        </div>\n      </div>\n      </div>\n      <!--Homepage Banners Ends-->\n\n      <!--SuperGeeks Slogan-->\n     <div class="row">\n        <h4 class="SGSlogan medium-12 large-8 column"><strong>SuperGeeks</strong> - <em>Stress-free Electronics &amp; Gadget Repairs</em></h4>\n\n        <div class="medium-12 large-4 column end quick-quote">\n            <button class="round"><strong>Get Quick Repair Quote</strong></button>\n        </div>\n     </div>\n\n     <div class="row">\n         <div class="homeinfopanel medium-6 column">\n            \n            <div class="medium-7 small-centered column">\n                <h2>Repairs</h2>\n                <img src="/assets/img/Supergeeks-repairs.svg" alt="SuperGeeks Repair Services">\n            </div>\n\n            <div class="medium-10 small-centered column">              \n                <p>Do you need a mobile phone repair? We carry out more than 30,000 mobile phone repairs every month – and we could help fix your phone today</p>\n            </div>             \n         </div>\n\n         <div class="homeinfopanel medium-6 column">\n            \n            <div class="medium-7 small-centered column">\n                <h2>Tech Support</h2>\n                <img src="/assets/img/SGP-repair-man.svg" alt="SuperGeeks Repair Services">\n            </div>\n\n            <div class="medium-10 small-centered column">              \n                <p>Do you need a mobile phone repair? We carry out more than 30,000 mobile phone repairs every month – and we could help fix your phone today</p>\n            </div>             \n         </div>\n\n         <div class="homeinfopanel medium-12 column">\n             <div class="SGPHome medium-5 column">\n                 <img src="/assets/img/gadget-protection.svg" alt="SuperGeeks Gadget Protection - SGP">\n             </div>\n\n             <div class="medium-7 column">\n                 <h2>SuperGeeks Gadget Protection</h2>\n\n                 <h4>The only device protection you will ever need</h4>\n\n                 <p>Do you need a mobile phone repair? We carry out more than 30,000 mobile phone repairs every month – and we could help fix your phone today</p>\n\n                 <a href="/sgp" class="button round"><strong>Learn more</strong></a>\n             </div>\n         </div>\n     </div>\n\n{embed="Main/.footer"}', NULL, 1406140858, 1, 'n', 0, '', 'n', 'n', 'o', 253),
(2, 1, 1, '.header', 'y', 'webpage', '<!DOCTYPE html>\n<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->\n<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->\n<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->\n  <head>\n    <meta charset="utf-8">\n        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n        <title>SuperGeeks - If we can''t fix it, no one else can</title>\n        <meta name="description" content="">\n        <meta name="viewport" content="width=device-width, initial-scale=1">\n        {exp:nsm_better_meta:template}\n    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,300">\n     <link rel="stylesheet" href="assets/css/app.css" />\n    <script src="bower_components/modernizr/modernizr.js"></script>\n  </head>\n  <body>\n      <div class="header-container"><div class="header row">\n        <a href="/" title="SuperGeeks - If we can''t fix it no one can">\n        <div class="SGLogo medium-3 medium-centered large-uncentered large-4 column">\n\n            <img src="/assets/img/supergeeks-logo.png" alt="SuperGeeks - If we can''t fix it, no one can">\n            \n            <h1>SuperGeeks</h1>\n\n            <h2>If We can''t fix it, no one can</h2>\n        </div></a>\n\n        <!--Main navigation Begins-->\n\n        <div class="medium-10 large-8 column end">\n          <div class="row">\n\n            <div class="quick-contact column end">\n              <h4>0815 092 GEEK (4335)</h4>  \n\n              <a href="{facebook_link}" title="SuperGeeks on Facebook"><span class="icon-facebook"></span></a>\n\n              <a href="{twitter_link}" title="SuperGeeks on Twitter"><span class="icon-twitter"></span></a>\n            </div>\n\n             <nav class="SGNav column end">\n              <ul>\n                  <li><a href="/SGP"><img src="/assets/img/SGP-gadget-protection.svg" alt="SuperGeeks Gadget Protection" width="120"></a></li>\n                  <li><a href="/tech-support">Tech Support</a></li>\n                  <li><a href="/fix-and-repairs">Repairs</a></li>\n                  <li><a href="/about">About</a></li>\n                  <li><a href="/contact">Contact</a></li>\n              </ul>\n          </nav>\n          </div>\n          \n        </div>\n        <!--Main navigation ends-->\n      </div>\n      </div>', '', 1406144817, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(3, 1, 1, '.footer', 'y', 'webpage', ' <footer class="footer">\n         <div class="row large-12">\n             <h2 class="slogan">IF WE CAN''T FIX IT, NO ONE CAN.</h2>\n\n             <div class="small-6 medium-8 column">\n                 <div class="row">\n                     <ul class="medium-3 column">\n                         <li><strong>Services</strong></li>\n                         <li><a href="/tech-support">Tech Support</a></li>\n                         <li><a href="/fix-and-repairs">Repairs</a></li>\n                     </ul>\n\n                     <ul class="medium-3 column">\n                         <li><strong>SuperGeeks</strong></li>\n                         <li><a href="/about">About</a></li>\n                         <li><a href="/contact">Contact</a></li>\n                     </ul>\n\n                      <ul class="medium-3 column">\n                         <li><a href="/why-choose-us">Why Choose Us</a></li>\n                         <li><a href="/safety-and-security">Safety &amp; Security</a></li>\n                     </ul>\n\n                     <ul class="medium-3 column">\n                         <li><a href="/privacy-policy">Privacy Policy</a></li>\n                         <li><a href="/terms-and-conditions">Terms &amp; Condition</a></li>\n                     </ul>\n                </div>\n                </div>\n\n                <ul class="small-6 medium-4 social-icons column end">\n                    <li><strong>Connect with us</strong></li>\n                    <li>\n                         <a href="{twitter_link}" title="Supergeeks on Twitter"><span class="icon-twitter"></span></a>\n                         <a href="{facebook_link}" title="Supergeeks on facebook"><span class="icon-facebook"></span></a>\n                         </li>\n                     </ul>\n            </div>\n\n         <div class="copyright row">\n             <div class="medium-12">\n                 &copy; 2014 SuperGeeks Ltd. All Rights Reserved.\n             </div>\n         </div>\n     </footer>\n    \n      \n\n    <script src="bower_components/jquery/dist/jquery.min.js"></script>\n    <script src="https://maps.googleapis.com/maps/api/js"></script>\n    <script src="/assets/js/app.js"></script>\n\n        <script>\n            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=\n            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;\n            e=o.createElement(i);r=o.getElementsByTagName(i)[0];\n            e.src=''//www.google-analytics.com/analytics.js'';\n            r.parentNode.insertBefore(e,r)}(window,document,''script'',''ga''));\n            ga(''create'',''UA-XXXXX-X'');ga(''send'',''pageview'');\n        </script>\n  </body>\n</html>', '', 1406144817, 1, 'n', 0, '', 'n', 'n', 'o', 29),
(4, 1, 1, 'page-template', 'y', 'webpage', '{embed="main/.header"}\n  {exp:channel:entries channel="pages"}\n    {content}\n  {/exp:channel:entries}\n{embed="Main/.footer"}', NULL, 1406144817, 1, 'n', 0, '', 'n', 'n', 'o', 448),
(5, 1, 2, '.footer', 'y', 'webpage', '  </body>\n</html>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(6, 1, 2, '.header', 'y', 'webpage', '<!DOCTYPE html>\n<html>\n <head>\n    {exp:nsm_better_meta:template}\n    <style type="text/css" media="screen">\n      html {font: normal normal normal 12px/18px Arial, sans-serif;}\n    </style>\n  </head>\n <body>\n', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(7, 1, 2, 'category-index', 'y', 'webpage', '{preload_replace:this_index_channel="news"}\n\n<p>Template: nsm_better_meta/category-index</p>\n\n\n{exp:channel:category_heading channel="{this_index_channel}"}\n  {if no_results}{redirect="404"}{/if}\n  {embed="nsm_better_meta/.header"\n    title="{category_name}"\n   title_suffix="nsm_better_meta/category-archive"\n   description="{category_description}"\n  }\n <h1>{category_name} <small> &mdash; Category archive</small></h1>\n{/exp:channel:category_heading}\n\n<ol>\n  {exp:channel:entries channel="{this_index_channel}"}\n  {if no_results}<li>No entries have been assigned to this category</li>{/if}\n <li><a href="{if page_uri}{page_uri}{if:else}{entry_id_path=''nsm_better_meta/entry''}{/if}">{title}</a></li>\n {/exp:channel:entries}\n</ol>\n\n{embed="nsm_better_meta/.footer"}', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(8, 1, 2, 'entry', 'y', 'webpage', '{preload_replace:this_page_channel="news"}\n\n<p>Template: nsm_better_meta/entry</p>\n\n{exp:channel:entries\n  _cache="yes"\n  disable="category_fields|pagination|member_data"\n  limit="1"\n refresh="10"\n  status="not closed"\n track_views="one"\n channel="{this_page_channel}"\n}\n  {embed="nsm_better_meta/.header"\n    entry_id="{entry_id}"\n   title_suffix="{channel_title}"\n  }\n   <h1>{title}</h1>\n    <p><a href="{path=nsm_better_meta/index}">Back to entry index</a></p>\n {embed="nsm_better_meta/.footer"}\n{/exp:channel:entries}', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(9, 1, 2, 'index', 'y', 'webpage', '{preload_replace:this_index_channel="news"}\n\n<p>Template: nsm_better_meta/index</p>\n\n{exp:channel:info channel="{this_index_channel}"}\n\n  {embed="nsm_better_meta/.header"\n    title="{channel_title}"\n   title_suffix="nsm_better_meta/index"\n    description="{channel_description}"\n }\n <h1>{channel_title} <small> &mdash; Index</small></h1>\n\n{/exp:channel:info}\n\n<h2>Published entries in {this_index_channel}</h2>\n<ol>\n {exp:channel:entries\n    _cache="yes"\n    disable="categories|category_fields|custom_fields|pagination|member_data"\n   limit="10"\n    refresh="10"\n    status="not closed"\n   channel="{this_index_channel}"\n  }\n   {if no_results}<li>No entries published in this channel</li>{/if}\n   <li><a href="{if page_uri}{page_uri}{if:else}{entry_id_path=''nsm_better_meta/entry''}{/if}">{title}</a></li>\n {/exp:channel:entries}\n</ol>\n\n<h2>Categories</h2>\n{exp:channel:categories channel="{this_index_channel}" style="nested"}\n  <a href="{path=''nsm_better_meta/category-index''}">{category_name}</a>\n{/exp:channel:categories}\n\n{embed="nsm_better_meta/.footer"}', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(10, 1, 3, 'index', 'y', 'webpage', '<?xml version="1.0" encoding="UTF-8"?>\n\n<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n\n   <sitemap>\n\n      <loc>http://www.ugiecarnival.com/index.php/xml-sitemaps/photos</loc>\n\n <lastmod>{current_time format="%Y-%m-%d"}</lastmod>\n\n   </sitemap>\n\n   <sitemap>\n\n      <loc>http://www.ugiecarnival.com/index.php/xml-sitemaps/videos</loc>\n\n      <lastmod>{current_time format="%Y-%m-%d"}</lastmod>\n\n   </sitemap>\n\n</sitemapindex>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(11, 1, 3, 'photos', 'y', 'xml', '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{exp:nsm_better_meta:entries_xml\n  loc="http://www.ugiecarnival.com/media/photos/{url_title}"\n  status="not closed"\n  channel="media"\n  category="1"\n}\n</urlset>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(12, 1, 3, 'photos.xml', 'y', 'xml', '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{exp:nsm_better_meta:entries_xml\n  loc="http://www.ugiecarnival.com/media/photos/{url_title}"\n  status="not closed"\n  channel="media"\n  category="1"\n}\n</urlset>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(13, 1, 3, 'videos', 'y', 'xml', '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{exp:nsm_better_meta:entries_xml\n  loc="http://www.ugiecarnival.com/media/videos/{url_title}"\n  status="not closed"\n  channel="media"\n  category="2"\n}\n</urlset>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(14, 1, 3, 'videos.xml', 'y', 'xml', '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n{exp:nsm_better_meta:entries_xml\n  loc="http://www.ugiecarnival.com/media/videos/{url_title}"\n  status="not closed"\n  channel="media"\n  category="2"\n}\n</urlset>', NULL, 1406144812, 1, 'n', 0, '', 'n', 'n', 'o', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'main', 1, 'y'),
(2, 1, 'nsm_better_meta', 2, 'n'),
(3, 1, 'xml-sitemaps', 3, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'Images', '/Users/javik/Documents/www/supergeeks/images/', 'http://www.supergeeks.com.ng/images/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);