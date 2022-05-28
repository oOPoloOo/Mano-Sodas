import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { AuthGuard } from '@nestjs/passport'
import { Request } from "express";

@Injectable()

//To invoke passport
//Custom Guard, kad butu galima naudot sessions+passport
export class LocalAuthGuard extends AuthGuard('local') {
    //ovverride canActivate
    async canActivate(context: ExecutionContext) {

        //result = Value indicating whether or not the 
        //current request is allowed to proceed.
        const result = (await super.canActivate(context)) as boolean;

        //gauna issiusta uzklausa
        const request = context.switchToHttp().getRequest();

        //logIn invokes passport, log in for us 
        //kviecia serializeUser metoda : utils/SessionSerializer.ts
        await super.logIn(request);

        return result;


    }
}

//Prieeigos uzdraudimui prie keliu, vartotojas neturi teisiu
@Injectable()
export class AuthenticatedGuard implements CanActivate {
    async canActivate(context: ExecutionContext): Promise<any> {
           //get request
           const req = context.switchToHttp().getRequest<Request>();
           //grazina authentikated ar ne
           return req.isAuthenticated();
    }
}
