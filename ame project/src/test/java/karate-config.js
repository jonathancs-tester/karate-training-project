function fn () {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  var EnvSetup = function (property) { var javaConfig = Java.type('com.ame.challenge.config.EnvSetup');  return javaConfig.getInstance().prop.getProperty(property) }
  var config = {
    BACKEND_URL: 'http://'+EnvSetup('EMPLOYEE.SERVER')+'/v1',
    FRONTEND_BASE_URL: 'http://'+EnvSetup('FRONTEND.SERVER'),

  };

  karate.configure('connectTimeout', 30000);
  karate.configure('readTimeout', 30000);
  karate.configure('ssl', { trustAll: true });
  karate.configure('logPrettyRequest',true);
  karate.configure('logPrettyResponse',true);
  karate.configure('driver', { type: EnvSetup('FRONTEND.BROWSER') });
  karate.configure('retry',{ count:15, interval:5000});

  return config;
}