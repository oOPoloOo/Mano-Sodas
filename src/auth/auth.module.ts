import { Module } from '@nestjs/common';
import { AuthService } from './services/auth/auth.service';
import { AuthController } from './controllers/auth/auth.controller';
import { LocalStrategy } from './utils/LocalStrategy';
import { UsersService } from 'src/users/services/users/users.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/typeorm/User';
import { UserData } from 'src/typeorm/UserData';
import { PassportModule } from '@nestjs/passport';
import { SessionSerializer } from './utils/SessionSerializer';

@Module({
  //TypeOrmModule reik, nes UsersService turi, o ji naudoju
  imports: [TypeOrmModule.forFeature([User, UserData]), PassportModule.register({
    session: true,
  }),
  ],
  controllers: [AuthController],
  providers: [
    {
      provide: 'AUTH_SERVICE', //token allows interfaces
      useClass: AuthService
    },
    {
      provide: 'USER_SERVICE',
      useClass: UsersService,
    },
    LocalStrategy,
    SessionSerializer,
  ]
})
export class AuthModule { }
