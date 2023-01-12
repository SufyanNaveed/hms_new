<?php if(inicompute($room)) { ?>
		<div class="profile-view-dis">
		    <div class="row">
			    <div class="col-sm-12">
				    <p><span class="font-weight-bold"><?=$this->lang->line('room_name')?></span> : <?=$room->name?></p>
			    </div>
		    </div>
		    <div class="row">
			    <div class="col-sm-12">
				    <p><span class="font-weight-bold"><?=$this->lang->line('room_description')?></span> : <?=$room->description?></p>
				</div>
			</div>
		</div>
	<?php } else { ?>
		<div class="error-card">
            <div class="error-title-block">
                <h1 class="error-title">404</h1>
                <h2 class="error-sub-title"> Sorry, data not found </h2>
            </div>
        </div>
<?php } ?>