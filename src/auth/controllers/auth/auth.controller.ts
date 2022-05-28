import { Controller, Get, Post, Req, Session, UseGuards, Request as RequestNest} from '@nestjs/common';
import { AuthenticatedGuard, LocalAuthGuard } from 'src/auth/utils/LocalGuard';
import { Request } from 'express';

@Controller('auth')
export class AuthController {

    // jei nori, kad veiktu sessijos su passport reik kurt savo custom guard
    //@UseGuards(AuthGuard('local')) // toks netinka
    @UseGuards(LocalAuthGuard) // mano sukurtas 
    @Post('login')
    async login() { }


    // Testuoju sessijas tik su express-session ir cookies
    // @Get('')
    // Record - session is key value pair
    // async getAuthSession(@Session() session: Record<string, any>) {
    //     console.log(session);
    //     console.log(session.id);

    //     as soon as you modify the session object, 
    //     that is then it's considered initialized
    //     session.authenticated = true;
    //     return session;
    // }

    //Protected route - cant't be accesed
    //Negali, jei neturi authentifikation
    @UseGuards(AuthenticatedGuard) // Teisiu tikrinimui situ keliu
    @Get('status')
    async getAuthStatus(@Req() req: Request){
        return req.user;
    }
}