<?php
/**
 * This file to handle facebook authentication
 *
 * PHP version 5.0
 *
 * @category	Rayzz
 * @package		Members
 */
require_once('./common/functions.php'); //configurations
require_once('./tools/facebook/facebook.php');
class LoginFormHandler extends signupAndLoginHandler
    {
        public $user_details_arr = array();
        public $publickey;
        public $privatekey;
        public $error = null;
        public $resp = null;

        /**
         * LoginFormHandler::chkIsBrowserAcceptsCookies()
         *
         * To check whether the browser accepts cookies
         *
         * @return         boolean true/false
         * @access         public
         */
        public function chkIsBrowserAcceptsCookies()
            {
                return count($_COOKIE);
            }

        /**
         * LoginFormHandler::chkIsLoginSessionError()
         *
         * To check if any error has been set in session
         *
         * @return         boolean true/false
         * @access         public
         */
        public function chkIsLoginSessionError()
            {
                return isset($_SESSION['login_error']);
            }

        /**
         * LoginFormHandler::chkIsNoFormErrors()
         *
         * To check the form inputs alias for clarity
         *
         * @return         boolean true/false
         * @access         public
         */
        public function chkIsNoFormErrors()
            {
                return $this->isValidFormInputs();
            }

        /**
         * LoginFormHandler::chkIsValidLoginDetail()
         *
         * To check if the details provided are valid
         *
         * @param         string $err_tip
         * @return         boolean $is_ok valid login
         * @access         public
         */
        public function chkIsValidLoginDetail($err_tip='')
            {
                $column = 'user_name';
                if($this->CFG['admin']['email_using_to_login'])
                    $column = 'email';

                if($user_detail = $this->getUserDetail($column, $this->fields_arr['user_name']))
                    {
                        $this->user_details_arr = $user_detail;
                    }
                if($this->user_details_arr and !$this->chkAllowToLogin($column, $this->fields_arr['user_name']))
                    {
                        $this->LANG['login_reached_allowed_failure_attempt_count'] = $this->buildDisplaytext($this->LANG['login_reached_allowed_failure_attempt_count'], array('VAR_ALLOWED_FAILURE_COUNT'=>$this->CFG['auth']['session']['allowed_num_invalid_tries'], 'VAR_LOCK_DURAION'=>$this->CFG['auth']['session']['retry_duration_after_invalid_tries']));
                        $this->setCommonErrorMsg($this->LANG['login_reached_allowed_failure_attempt_count']);
                        return false;
                    }
                $is_ok = false;

                if($this->user_details_arr AND $user_detail['password'] == md5($this->fields_arr['password'].$user_detail['bba_token']))
                    {
                        switch($this->user_details_arr['usr_status'])
                            {
                                case 'ToActivate':
                                    $click_here  = getUrl('login');
                                    $click_here = '<a href="'.$click_here.'" onClick="document.errorForm.submit();return false;">'.$this->LANG['login_click_here'].'</a>';
                                    $this->setCommonErrorMsg(str_replace('VAR_CLICK_HERE', $click_here, $this->LANG['login_err_to_activate']));
                                    $this->setAllPageBlocksHide();
                                    $is_ok = false;
                                    break;
                                case 'Locked':
                                    $contact_us_link  = getUrl('contactus');
                                    $contact_us_link = '<a href="'.$contact_us_link.'">'.$this->LANG['login_contact_us_link'].'</a>';
                                    $this->setCommonErrorMsg(str_replace('VAR_CONTACT_US_LINK', $contact_us_link, $this->LANG['login_err_to_locked']));
                                    $is_ok = false;
                                    break;
                                case 'Ok':
                                    $is_ok = true;
                                    break;
                            }
                    }
                else
                    {
                        if($this->user_details_arr)
                            {
                                $this->increaseFailureLoginAttempt($this->user_details_arr['user_id']);
                            }
                         $is_ok = false;
                        $this->setFormFieldErrorTip('user_name', $err_tip);
                        $this->setFormFieldErrorTip('password', $err_tip);
                        if($this->CFG['admin']['email_using_to_login'])
                            $this->setCommonErrorMsg($this->LANG['login_email_error']);
                        else
                            $this->setCommonErrorMsg($this->LANG['login_username_error']);
                    }
                return $is_ok;
            }

        /**
         * LoginFormHandler::populatCookiesValue()
         * To check whether user_name stored in cookie
         *
         * @return    boolean true/false
         **/
        public function populatCookiesValue()
            {
                if(isset($_COOKIE[$this->CFG['cookie']['starting_text'].'_user_name']) and $_COOKIE[$this->CFG['cookie']['starting_text'].'_user_name'] and isset($_COOKIE[$this->CFG['cookie']['starting_text'].'_token']))
                    {
                        if($this->user_details_arr = $this->getUserDetail('user_name', $_COOKIE[$this->CFG['cookie']['starting_text'].'_user_name']))
                            {
                                $token_to_check = base64_decode($_COOKIE[$this->CFG['cookie']['starting_text'].'_token']);
                                if($token_to_check == $this->user_details_arr['bba_token'])
                                    {
                                        $this->fields_arr['remember'] = '1';
                                        $this->doLogin();
                                        return true;
                                    }
                            }
                    }
                return false;
            }

        /**
         * LoginFormHandler::sendActivationCode()
         * To send activation code through mail
         *
         * @return    void
         */
        public function sendActivationCode()
            {
                $code = urlencode($this->getActivationCode('Signup', $this->fields_arr['user_id']));
                $activation_link = getUrl('verify', '?code='.$code, '?code='.$code);
                $activation_link = $activation_link;

                $activation_subject = $this->LANG['reactivation_login_subject'];

                $link = $this->CFG['site']['url'];
                $activation_message = $this->LANG['reactivation_login_message'];

                $this->setEmailTemplateValue('link', $link);
                $this->setEmailTemplateValue('user_name', $this->fields_arr['username']);
                $this->setEmailTemplateValue('activation_link', $activation_link);

                $is_ok = $this->_sendMail($this->fields_arr['email'], $activation_subject, $activation_message, $this->CFG['site']['noreply_name'], $this->CFG['site']['noreply_email']);

                if($is_ok)
                    {
                        $this->setCommonSuccessMsg($this->LANG['login_activation_code_sent']);
                    }
                else
                    {
                        $this->setCommonSuccessMsg($this->LANG['login_activation_code_not_sent']);
                    }
            }

        /**
         * LoginFormHandler::sendCode()
         * To send activation code through mail
         *
         * @return    void
         */
        public function sendCode()
            {
                $add = ' user_name='.$this->dbObj->Param('user_name');
                if($this->CFG['admin']['email_using_to_login'])
                    $add = ' email='.$this->dbObj->Param('email');

                $sql = 'SELECT user_id,  email, user_name FROM '.$this->CFG['db']['tbl']['users'].
                        ' WHERE'.$add.' AND usr_status=\'ToActivate\'';

                $stmt = $this->dbObj->Prepare($sql);
                $rs = $this->dbObj->Execute($stmt, array($this->fields_arr['user_name']));
                if (!$rs)
                    trigger_db_error($this->dbObj);

                if($row = $rs->FetchRow())
                    {
                        $this->fields_arr['email'] = $row['email'];
                        $this->fields_arr['username'] = $row['user_name'];
                        $this->fields_arr['user_id'] = $row['user_id'];
                        $this->sendActivationCode();
                    }
            }

        /**
         * LoginFormHandler::displayMandatoryIcon()
         * Display the mandatory icon
         *
         * @param  string $field_name
         * @return string
         * @access public
         */
        public function displayMandatoryIcon($field_name='')
            {
                $mandatoryFields = array('user_name', 'password');
                if($field_name == '*' OR (in_array($field_name, $mandatoryFields)))
                    {
                        return $this->LANG['common_mandatory_field_icon'];
                    }
            }
    }
//<<<<<-------------- Class LoginFormHandler begins ---------------//
//-------------------- Code begins -------------->>>>>//
    $loginfrm = new LoginFormHandler();
    $loginfrm->chkIsNotEmpty('user_name', $LANG['login_err_tip_compulsory']);
    $loginfrm->chkIsNotEmpty('password', $LANG['login_err_tip_compulsory']);
    $loginfrm->chkIsBrowserAcceptsCookies() or
        $loginfrm->setCommonErrorMsg($LANG['login_err_cookies_not_set']);
    $loginfrm->chkIsNoFormErrors() and
        $loginfrm->chkIsValidLoginDetail($LANG['login_err_tip_invalid']);

    if($CFG['login']['captcha'])
        {
            if($CFG['login']['login_captcha_method'] == 'recaptcha' and $CFG['captcha']['public_key'] and $CFG['captcha']['private_key'])
                {
                    $loginfrm->chkIsNotEmpty('recaptcha_response_field', $LANG['common_err_tip_compulsory']) and
                    $loginfrm->chkCaptcha('recaptcha_response_field', $LANG['common_err_tip_invalid_captcha']);
                }
        }
    if ($loginfrm->isValidFormInputs())
        {
            $loginfrm->doLogin();
        }
    else
        {
            $remember = $loginfrm->getFormField('remember');
            $loginfrm->setFormField('remember', '');
            //$loginfrm->setCookieValue();
            $loginfrm->setPageBlockShow('form_error');
            $loginfrm->setFormField('remember', $remember);
        }
    $loginfrm->setFormField('password', '');
?>