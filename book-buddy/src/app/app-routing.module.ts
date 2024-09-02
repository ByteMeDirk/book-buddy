import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//Components
import { LoginComponent } from './Components/login/login.component';
import { SignupComponent } from './Components/signup/signup.component';
import { HomeComponent } from './Components/home/home.component';

const routes: Routes = [
  {path: "", component: LoginComponent},
  {path: "home", component: HomeComponent},
  {path: "signup", component: SignupComponent},
  {path: "**", redirectTo: ""},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
