import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//Componentes
import { DetailsComponent } from './details/details.component';
import { HomeComponent } from './home/home.component';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';


//Componente
const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'details',
    component: DetailsComponent
  }
  
];

@NgModule({
  imports: [RouterModule.forChild(routes),
    FormsModule,
    ReactiveFormsModule
  ],
  exports: [RouterModule]
})
export class RoutingModule { }
