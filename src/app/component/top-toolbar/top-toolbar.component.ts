import { Component, OnInit } from '@angular/core';
import { SideNavStatusService } from 'src/app/service/side-nav-status/side-nav-status.service';
@Component({
  selector: 'app-top-toolbar',
  templateUrl: './top-toolbar.component.pug',
  styleUrls: ['./top-toolbar.component.sass']
})
export class TopToolbarComponent implements OnInit {
  constructor(private sideNavStatusService: SideNavStatusService) {}

  ngOnInit() {
    this.sideNavStatusService.isOpen = false;
  }

  onMenuClicked() {
    return (this.menuClickedStatus = !this.menuClickedStatus);
  }
}
