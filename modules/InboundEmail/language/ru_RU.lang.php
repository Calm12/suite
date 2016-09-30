<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 ********************************************************************************/

/*********************************************************************************

 * Description:  TODO: To be written.
 * Portions created by SugarCRM are Copyright (C) SugarCRM, Inc.
 * All Rights Reserved.
 * Contributor(s): ______________________________________..
 ********************************************************************************/

$mod_strings = array(


	'LBL_RE'					=> 'RE:',

	'ERR_BAD_LOGIN_PASSWORD'=> 'Неверный логин или пароль',
	'ERR_BODY_TOO_LONG'		=> '\rТекст письма слишком длинный. Часть текста удалена.',
	'ERR_INI_ZLIB'			=> 'Невозможно временно отключить zlib-сжатие. Тестирование установок может закончиться неудачно.',
	'ERR_MAILBOX_FAIL'		=> 'Невозможно получить ни одной учётной записи.',
	'ERR_NO_IMAP'			=> 'Не найдены библиотеки IMAP. Пожалуйста, решите эту проблему перед тем. как продолжить работу с входящей почтой',
	'ERR_NO_OPTS_SAVED'		=> 'Оптимальные настройки не были сохранены для входящих писем. Пожалуйста, проверьте соответствующие настройки',
	'ERR_TEST_MAILBOX'		=> 'Пожалуйста, проверьте Ваши настройки и попробуйте ещё раз.',

	'LBL_APPLY_OPTIMUMS'	=> 'Применить оптимальные настройки',
	'LBL_ASSIGN_TO_USER'	=> 'Назначить пользователю',
	'LBL_AUTOREPLY_OPTIONS'	=> 'Опции автоответа',
	'LBL_AUTOREPLY'			=> 'Шаблон автоматического ответа',
	'LBL_AUTOREPLY_HELP'	=> 'Информировать отправителей электронных писем о том, что их сообщение было получено.',
	'LBL_BASIC'				=> 'Информация об учётной записи',
	'LBL_CASE_MACRO'		=> 'Макрос для Обращений',
	'LBL_CASE_MACRO_DESC'	=> 'Укажите макрос, который будет проанализирован и использован для связи импортированного E-mail с Обращением.',
	'LBL_CASE_MACRO_DESC2'	=> 'Вы можете установить любое значение вместо <b>CASE</b>, но не меняйте значение <b>"%1"</b>.',
	'LBL_CERT_DESC'			=> 'Включить проверку почтовых сертификатов сервера - не использовать, если используется автоподписка.',
	'LBL_CERT'				=> 'Проверка сертификата',
	'LBL_CLOSE_POPUP'		=> 'Закрыть окно',
	'LBL_CREATE_NEW_GROUP'	=> '--Создать почтовую группу при сохранении--',
	'LBL_CREATE_TEMPLATE'	=> 'Создать',
	'LBL_SUBSCRIBE_FOLDERS'	=> 'Subscribe Folders',
	'LBL_DEFAULT_FROM_ADDR'	=> 'По умолчанию: ',
	'LBL_DEFAULT_FROM_NAME'	=> 'По умолчанию: ',
	'LBL_DELETE_SEEN'		=> 'Удалить прочтённые письма после импортирования',
	'LBL_EDIT_TEMPLATE'		=> 'Править',
	'LBL_EMAIL_OPTIONS'		=> 'Параметры обработки почты',
	'LBL_EMAIL_BOUNCE_OPTIONS' => 'Параметры обработки возвращаемых E-mail',
	'LBL_FILTER_DOMAIN_DESC'=> 'Укажите домен, на который не будут отправляться автоматические ответы.',
	'LBL_ASSIGN_TO_GROUP_FOLDER_DESC'=> 'Автоматически импортировать в систему все входящие электронные письма.',
	'LBL_POSSIBLE_ACTION_DESC'		=> 'Для того, чтобы воспользоваться данной функцией, необходимо выбрать групповую папку',
	'LBL_FILTER_DOMAIN'		=> 'Не отправлять автоответ на этот домен',
	'LBL_FIND_OPTIMUM_KEY'	=> 'f',
	'LBL_FIND_OPTIMUM_MSG'	=> 'Поиск оптимальных настроек соединения.',
	'LBL_FIND_OPTIMUM_TITLE'=> 'Найти оптимальную конфигурацию',
	'LBL_FIND_SSL_WARN'		=> 'Тестирование SSL может занять продолжительное время. Пожалуйста, подождите...',
	'LBL_FORCE_DESC'		=> 'Некоторые IMAP/POP3 серверы требуют специальные ключи. Проверьте принудительное использование негативных ключей во время соединения (например, /notls)',
	'LBL_FORCE'				=> 'Принудительное использование отрицательных ключей',
	'LBL_FOUND_MAILBOXES'	=> 'Найдены следующие почтовые ящики:',
	'LBL_FOUND_OPTIMUM_MSG'	=> 'Найдены оптимальные настройки. Нажмите нижеуказанную кнопку для того, чтобы применить их к вашему почтовому ящику.',
	'LBL_FROM_ADDR'			=> 'С адреса',
    // as long as XTemplate doesn't support output escaping, transform
    // quotes to html-entities right here (bug #48913)
    'LBL_FROM_ADDR_DESC'    => " Указанный здесь электронный адрес может не отображаться в поле <b><От></b> отправляемого письма из-за возможных ограничений, налагаемых почтовым провайдером. В этом случае будет использоваться адрес сервера исходящей почты.",
	'LBL_FROM_NAME_ADDR'	=> 'От имени/С адреса',
	'LBL_FROM_NAME'			=> 'От имени',
	'LBL_GROUP_QUEUE'		=> 'Приписать к группе',
    'LBL_HOME'              => 'Главная',
	'LBL_LIST_MAILBOX_TYPE'	=> 'Действие',
	'LBL_LIST_NAME'			=> 'Учётная запись',
	'LBL_LIST_GLOBAL_PERSONAL'			=> 'Тип',
	'LBL_LIST_SERVER_URL'	=> 'Почтовый сервер',
	'LBL_LIST_STATUS'		=> 'Статус',
	'LBL_LOGIN'				=> 'Логин',
	'LBL_MAILBOX_DEFAULT'	=> 'ВХОДЯЩИЕ',
	'LBL_MAILBOX_SSL_DESC'	=> 'Использовать SSL при соединении. Если SSL не работает, то проверьте наличие параметра "--with-imap-ssl" при конфигурировании исходных текстов PHP.',
	'LBL_MAILBOX_SSL'		=> 'Использовать SSL',
	'LBL_MAILBOX_TYPE'		=> 'Возможные действия',
	'LBL_DISTRIBUTION_METHOD' => 'Алгоритм назначения ответственного',
	'LBL_CREATE_CASE_REPLY_TEMPLATE' => 'Шаблон автоответа при создании нового Обращения',
	'LBL_CREATE_CASE_REPLY_TEMPLATE_HELP' => 'Автоматически информировать отправителей электронных писем о создании нового Обращения. В теме письма будет содержаться номер Обращения, формат которого будет сформирован на основе макроса Обращения. Авто-ответ будет отправлен только при получении <b>первого</b> письма от отправителя.',
	'LBL_MAILBOX'			=> 'Проверяемые папки',
	'LBL_TRASH_FOLDER'		=> 'Удаленные',
	'LBL_GET_TRASH_FOLDER'	=> 'Получить папку "Удаленные"',
	'LBL_SENT_FOLDER'		=> 'Отправленные',
	'LBL_GET_SENT_FOLDER'	=> 'Получить папку "Отправленные"',
	'LBL_SELECT'				=> 'Выбрать',
	'LBL_MARK_READ_DESC'	=> 'Помечать сообщения как прочитанные на почтовом сервере при импорте; не удалять сообщения с сервера.',
	'LBL_MARK_READ_NO'		=> 'E-mail помечаются удалёнными после импортирования',
	'LBL_MARK_READ_YES'		=> 'Оставлять E-mail на сервере при импорте',
	'LBL_MARK_READ'			=> 'Оставлять сообщения на сервере',
	'LBL_MAX_AUTO_REPLIES'	=> 'Ограничение количества автоответов',
	'LBL_MAX_AUTO_REPLIES_DESC'	=> 'Установка максимального количества отправляемых автоматических ответов на уникальный E-mail в течение 24 часов.',
	'LBL_PERSONAL_MODULE_NAME' => 'Персональная учётная запись E-mail',
	'LBL_CREATE_CASE'      => 'Создать Обращение из E-mail',
	'LBL_CREATE_CASE_HELP'  => 'Автоматически создавать Обращения из входящих электронных писем.',
	'LBL_MODULE_NAME'		=> 'Групповая учётная запись E-mail',
	'LBL_BOUNCE_MODULE_NAME' => 'Учётная запись для обработки возвращаемых E-mail',
	'LBL_MODULE_TITLE'		=> 'Входящие E-mail',
	'LBL_NAME'				=> 'Имя',
    'LBL_NONE'              => '--не выбрано--',
	'LBL_NO_OPTIMUMS'		=> 'Невозможно определить оптимальные настройки. Пожалуйста, проверьте ваши настройки и попробуйте ещё раз.',
	'LBL_ONLY_SINCE_DESC'	=> 'При использовании протокола POP3, PHP не может отличать новые/непрочитанные сообщения. Эта опция позволяет проверять сообщения, появившиеся после последнего опроса почтового ящика. Это значительно улучшит производительность системы, если ваш почтовый сервер не поддерживает протокол IMAP.',
	'LBL_ONLY_SINCE_NO'		=> 'Нет. Проверьте соответствующие письма на почтовом сервере.',
	'LBL_ONLY_SINCE_YES'	=> 'Да.',
	'LBL_ONLY_SINCE'		=> 'Импорт только новых сообщений:',
	'LBL_OUTBOUND_SERVER'	=> 'Сервер исходящей почты',
	'LBL_PASSWORD_CHECK'	=> 'Контрольный пароль',
	'LBL_PASSWORD'			=> 'Пароль',
	'LBL_POP3_SUCCESS'		=> 'Тест POP3 успешно пройден.',
	'LBL_POPUP_FAILURE'		=> 'Тестирование соединения  прошло неудачно. Ошибка показана ниже.',
	'LBL_POPUP_SUCCESS'		=> 'Успешное тестирование соединения.  Ваши настройки работают.',
	'LBL_POPUP_TITLE'		=> 'Тестирование настроек...',
	'LBL_GETTING_FOLDERS_LIST' 		=> 'Получение списка папок',
	'LBL_SELECT_SUBSCRIBED_FOLDERS' 		=> 'Выбрать папку/папки',
	'LBL_SELECT_TRASH_FOLDERS' 		=> 'Выбрать папку "Удалённые"',
	'LBL_SELECT_SENT_FOLDERS' 		=> 'Выбрать папку "Отправленные"',
	'LBL_DELETED_FOLDERS_LIST' 		=> 'Следующие папки не существуют или были удалены с сервера: %s',
	'LBL_PORT'				=> 'Порт',
	'LBL_QUEUE'				=> 'Почтовая очередь',
	'LBL_REPLY_NAME_ADDR'	=> 'Ответить на имя/адрес)',
	'LBL_REPLY_TO_NAME'		=> 'Ответить на имя',
	'LBL_REPLY_TO_ADDR'		=> 'Ответить на адрес',
	'LBL_SAME_AS_ABOVE'		=> 'Использовать Имя/Адрес',
	'LBL_SAVE_RAW'			=> 'Сохранять исходный текст',
	'LBL_SAVE_RAW_DESC_1'	=> 'Выберите "Да", если вы хотите сохранить исходный текст каждого поступившего письма.',
	'LBL_SAVE_RAW_DESC_2'	=> 'Большие вложения могут стать причиной ошибки в неверно сконфигурированных БД.',
	'LBL_SERVER_OPTIONS'	=> 'Опции почтового сервера',
	'LBL_SERVER_TYPE'		=> 'Протокол почтового сервера',
	'LBL_SERVER_URL'		=> 'Сервер входящей почты',
	'LBL_SSL_DESC'			=> 'Если ваш почтовый сервер поддерживает SSL-соединения, то включение данной опции приведёт к автоматическому созданию SSL-соединения при импорте сообщений.',
	'LBL_ASSIGN_TO_TEAM_DESC' => 'У выбранной команды есть доступ к учетной почтовой записи.',
	'LBL_SSL'				=> 'Использовать SSL',
	'LBL_STATUS'			=> 'Статус',
	'LBL_SYSTEM_DEFAULT'	=> 'По умолчанию',
	'LBL_TEST_BUTTON_KEY'	=> 't',
	'LBL_TEST_BUTTON_TITLE'	=> 'Тестирование',
	'LBL_TEST_SETTINGS'		=> 'Тест настроек',
	'LBL_TEST_SUCCESSFUL'	=> 'Соединение успешно установлено.',
	'LBL_TEST_WAIT_MESSAGE'	=> 'Пожалуйста, подождите...',
	'LBL_TLS_DESC'			=> 'Использование TLS при соединении с почтовым сервером - используйте этот параметр только в случае поддержки данного протокола почтовым сервером.',
	'LBL_TLS'				=> 'Использовать TLS',
	'LBL_WARN_IMAP_TITLE'	=> 'IMAP-предупреждение',
	'LBL_WARN_IMAP'			=> 'Предупреждения:',
	'LBL_WARN_NO_IMAP'		=> 'Эта система не имеет IMAP-клиента, откомпилированного в PHP-модуле (--with-imap=/path/to/imap_c-client_library).  Пожалуйста, свяжитесь с Вашим администратором для решений этой проблемы.',

	'LNK_CREATE_GROUP'		=> 'Создать новую группу',
	'LNK_LIST_CREATE_NEW_GROUP'	 => 'Создать групповую учётную запись',
	'LNK_LIST_CREATE_NEW_BOUNCE' => 'Создать учётную запись для обработки возвращаемой почты',
	'LNK_LIST_MAILBOXES'	=> 'Все учётные записи',
	'LNK_LIST_QUEUES'		=> 'Все очереди',
	'LNK_LIST_SCHEDULER'	=> 'Планировщик',
	'LNK_LIST_TEST_IMPORT'	=> 'Тестирование импортирования почты',
	'LNK_NEW_QUEUES'		=> 'Создать новую очередь',
	'LNK_SEED_QUEUES'		=> 'Создать очередь из групп',
	'LBL_GROUPFOLDER_ID'	=> 'Групповая папка(ID)',
	'LBL_ASSIGN_TO_GROUP_FOLDER' => 'Назначить групповой папке',
    'LBL_ALLOW_OUTBOUND_GROUP_USAGE' => 'Разрешить пользователям отправлять письма, используя в качестве адреса для ответа данные поля <<b>От</b>>',
    'LBL_ALLOW_OUTBOUND_GROUP_USAGE_DESC' => 'Имя и адрес групповой учётной записи появятся в поле <<b>От</b>> при отправке писем пользователям, являющимся членами данной групповой учётной записи.',
    'LBL_STATUS_ACTIVE'     => 'Активна',
    'LBL_STATUS_INACTIVE'   => 'Не активна',
    'LBL_IS_PERSONAL' => 'Персональная',
    'LBL_IS_GROUP' => 'Групповая',
    'LBL_ENABLE_AUTO_IMPORT' => 'Автоматически импортировать E-mail',
    'LBL_WARNING_CHANGING_AUTO_IMPORT' => 'Предупреждение: Вы изменяете параметр автоматического импорта, что может привести к потере данных.',
    'LBL_WARNING_CHANGING_AUTO_IMPORT_WITH_CREATE_CASE' => 'Предупреждение: При автоматическом создании Обращений автоиморт также должен быть включён.',
	'LBL_EDIT_LAYOUT' => 'Изменить макет' /*for 508 compliance fix*/,
);
?>
