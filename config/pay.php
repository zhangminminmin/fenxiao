<?php

return [
        'alipay' => [
            'app_id' => '2021002114619353',
//            'ali_public_key' => 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB',
            'private_key' => 'MIIEpAIBAAKCAQEArVvM4xEgcOu7QwsJCX4YgJ+W5H0EECC5gGefMq0QydwxpXWIP05Q/HlppftDY5J4l609QTVMheqo2YaOVClzpbzE33s/xlBzwC3fNrzPm7i4Dnx4ukZqaMnVBeJlZiZaDi1hw5d41H1SW4LEPBU24tTXYj6veVQz4xzM2+QeH+46HqultKR/1tmNQN93QtEXURiY+l/pqf/WS/3Ta3NEyIOFDbTsH+4I5Td3NxR4gILfTK0Y0v6LpRf1njR7xdTY+050/9wUoD6oOGCC+JE1pdYaLqGaffDL4dR9EFWa+7pm0TgdNbgCmVZcgUlD0OgiEWHRD97sVF08psBPvwPXWwIDAQABAoIBAB8XedW3uqPGA53wmrxTGz3mYX+1VEc4N0zqSMkj9QDfNyA/xiHkf+3oMKSOPfXbzTkW3weU8ZaLEaGB2oEJti4hfwW96yA8SaZME96TWoDJTml6tYRjIK6OlGArzJfXhQtJ5GDaB9fEakLzXxKPk3p3RfHe4EXYbj3ramp9rVF4cuqsPRqo/8oVBu/Bv/9dCfEW8awyissdiiGzFiptSgcyfBSdxr+SUrKz2gI/p/VwSYvV5QqgaTgfjlx1cR9B5B46UIJ6Y2YcIPM0vG3EkJti5/aWglXDgKF4hgW+0wFLKgdvhjw+RY8i5yPwkl69tf09PeOGx+yxCM5rZO1GaMECgYEA1zYzRXCuHatrWcugtbEmFfXgWA0xu/0L9qwBeT1DdxvgCfVGR0iWD+7bofIrNsOP+7ONrVivHF7vE9AbmVd/d0mOqFHnMAd7A/Ut+WXJ9S4wRJKgBPtKU6qmMGFbLJjccHtlEgyxzkElglLALj68k5UewTbOSKm3HzcmLzcWEcsCgYEAzjbwhLSP1ZRCv/bdGcvtn4TBn8ZG5hItkBoDaW/XzZOfy0PG9ADVKDPEDklcjfy2+R0qB38+lJfRL5otq+wy5V9eVy6RlGSAwSgygHVamx21LntpzVkN6kbsn2W8bfKygSWR7dmEUF3Bo3PYWyaTeVaZgNMre+h7kXJ4/g+LXrECgYBI9pQ9Z61wW6yinfnXf77E1T6BO7/v1yPWNoytWQrld+rmFWUFR+OwdS+7YQorn/PRxxcyfQ2pVbpCglzJCTQq8iJOiK4Tx4V6WwaCNnNZD5bHuNpNthCF+yYq4ubxYMXj0MH8c5dYsReRbpK/Wv++HWF26ijX08pE6AKnIUr3LwKBgQDH2v8n3kc4W8SFf5+xjK7z1xpA202DVULLUirUWQzxtI091qZPfS8ZE3KD1h3Zjn9W2CkPswbXxHt8gxSYdwasvs0T+ZImG3GdwnOPhC0YAKbEMd/MoO6Xi71wjo0ckgbmm57ewd02dmdhHrklPjHXe1KyQ/b009BOmn8g27fbQQKBgQCxo6ojqMXQdQtP8gBPDRbtUkaWWkcjXR4oAm7MhLoXcjFIUrVxThfQG8ZJ0gwZUiM8j3MZV6IQR4XiTXkTZbIonQNUB9ou/xKAa4O9FrIpPLWWpKF6i2CggdJ35MdLcfRrGxMJO9PbsSUSz2aXymbtRuTckjjRgcq4DyNVBVDXSw==',
            'app_cert_public_key' => base_path() . '/cert/appCertPublicKey_2021002114619353.crt', //????????????????????????
            'ali_public_key'     =>  base_path() . '/cert/alipayCertPublicKey_RSA2.crt', //???????????????????????????
            'alipay_root_cert'    =>  base_path() . '/cert/alipayRootCert.crt', //????????????????????????
            'log' => [ // optional
                'file' => './logs/alipay.log',
                'level' => 'info', // ????????????????????????????????? info?????????????????? debug
                'type' => 'single', // optional, ?????? daily.
                'max_file' => 30, // optional, ??? type ??? daily ?????????????????? 30 ???
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
                // ???????????????????????? [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
            ],
//            'mode' => 'dev', // optional,???????????????????????????????????????
        ],
];
