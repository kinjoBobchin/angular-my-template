import { Component } from '@angular/core';
import { SideNavStatusService } from 'src/app/service/side-nav-status/side-nav-status.service';

@Component({
  selector: 'app-side-nav',
  templateUrl: './side-nav.component.pug',
  styleUrls: ['./side-nav.component.sass']
})
export class SideNavComponent {
  constructor(private sideNavStatusService: SideNavStatusService) {}

  title = 'app';

  get sideNavStatus() {
    return this.sideNavStatusService.isOpen;
  }
}
