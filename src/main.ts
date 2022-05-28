import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as session from 'express-session';
import * as passport from 'passport';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  //app.setGlobalPrefix('mano-sodas'); // neveikia su cloud - nevest i kelia
  //Anable sessions
  app.use(session({
    name: 'SESSION_ID',
    secret: 'NDUIFBSUGBDVFSBGYOURTTHARPWLEWKBM', // TO DECRIPT COOKIE
    resave: false, // Do not forsfully resave to session store
    saveUninitialized: false, // Nekurt sesijos, jei vartotojas neatlika veiksmu, tik apsilanko app
    cookie: {
      maxAge: 60000, //po kiek laiko baigiasi galiojimas 1 min
    }
  }));
  //Anable passport
  app.use(passport.initialize());
  //Anable passport with session
  app.use(passport.session());
  await app.listen(3000);
}
bootstrap();
