import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {
  MatToolbarModule,
  MatIconModule,
  MatListModule,
  MatSidenavModule,
  MatButtonModule
} from '@angular/material';
import { FlexLayoutModule } from '@angular/flex-layout';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { TopToolbarComponent } from './component/top-toolbar/top-toolbar.component';
import { FavoriteListsComponent } from './component/favorite-lists/favorite-lists.component';
import { SideNavComponent } from './component/side-nav/side-nav.component';
import { AppRoutingModule } from './app-routing.module';
import { DashboardComponent } from './component/dashboard/dashboard.component';
import { SelfIntroComponent } from './component/self-intro/self-intro.component';

@NgModule({
  declarations: [
    AppComponent,
    TopToolbarComponent,
    FavoriteListsComponent,
    SideNavComponent,
    DashboardComponent,
    SelfIntroComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    MatToolbarModule,
    MatIconModule,
    MatListModule,
    MatButtonModule,
    MatSidenavModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {}
