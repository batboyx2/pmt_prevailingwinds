// ====================================================================================
// Scripts made by Phantactical Mod Development Team for the Prevailing Winds Addon
// We can be found here: www.phantactical.com
// Last Edited: 4:19 PM 28/1/2014
// No derivative works allowed without permission. Just ask, we will see your request.
// ====================================================================================
//Backward reference: initializer.sqf
_myBird = (_this select 0);
_windFactor = (_this select 1);
_posFrontSpatial = (_this select 2);
_posRearSpatial = (_this select 3);
_posTopSpatial = (_this select 4);
_posBottomSpatial = (_this select 5);
_posRightSpatial = (_this select 6);
_posLeftSpatial = (_this select 7);
_posCenterSpatial = (_this select 8);

while {true} do {
	sleep .01;
	// ===========================================================
	// ===========================================================
	// FRONT GETTING CODE
	_posFront = [
		((getPos _myBird) select 0) + (_posFrontSpatial select 0)),
		((getPos _myBird) select 1) + (_posFrontSpatial select 1)),
		((getPos _myBird) select 2) + (_posFrontSpatial select 2))
	];
	_posFront_WV = [
		(_posFront select 0) + (3 *(wind select 0)),
		(_posFront select 1) + (3 *(wind select 1)),
		(_posFront select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posFront, _posFront_WV, _myBird]) then {
		FrontIntersects = 1;
	} else {
		FrontIntersects = 0;
	};
	// ===========================================================
	// ===========================================================
	// REAR GETTING CODE
	_posRear = [
		((getPos _myBird) select 0) + (_posRearSpatial select 0)),
		((getPos _myBird) select 1) + (_posRearSpatial select 1)),
		((getPos _myBird) select 2) + (_posRearSpatial select 2))
	];
	_posRear_WV = [
		(_posRear select 0) + (3 *(wind select 0)),
		(_posRear select 1) + (3 *(wind select 1)),
		(_posRear select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posRear, _posRear_WV, _myBird]) then {
		RearIntersects = 1;
	} else {
		RearIntersects = 0;
	}; 
	// ===========================================================
	// ===========================================================
	// TOP GETTING CODE
	_posTop = [
		((getPos _myBird) select 0) + (_posTopSpatial select 0)),
		((getPos _myBird) select 1) + (_posTopSpatial select 1)),
		((getPos _myBird) select 2) + (_posTopSpatial select 2))
	];
	_posTop_WV = [
		(_posTop select 0) + (3 *(wind select 0)),
		(_posTop select 1) + (3 *(wind select 1)),
		(_posTop select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posTop, _posTop_WV, _myBird]) then {
		TopIntersects = 1;
	} else {
		TopIntersects = 0;
	};
	// ===========================================================
	// ===========================================================
	// BOTTOM GETTING CODE
	_posBottom = [
		((getPos _myBird) select 0) + (_posBottomSpatial select 0)),
		((getPos _myBird) select 1) + (_posBottomSpatial select 1)),
		((getPos _myBird) select 2) + (_posBottomSpatial select 2))
	];
	_posBottom_WV = [
		(_posBottom select 0) + (3 *(wind select 0)),
		(_posBottom select 1) + (3 *(wind select 1)),
		(_posBottom select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posBottom, _posBottom_WV, _myBird]) then {
		BottomIntersects = 1;
	} else {
		BottomIntersects = 0;
	};
	// ===========================================================
	// ===========================================================
	// RIGHT GETTING CODE
	_posRight = [
		((getPos _myBird) select 0) + (_posRightSpatial select 0)),
		((getPos _myBird) select 1) + (_posRightSpatial select 1)),
		((getPos _myBird) select 2) + (_posRightSpatial select 2))
	];
	_posRight_WV = [
		(_posRight select 0) + (3 *(wind select 0)),
		(_posRight select 1) + (3 *(wind select 1)),
		(_posRight select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posRight, _posRight_WV, _myBird]) then {
		RightIntersects = 1;
	} else {
		RightIntersects = 0;
	}; 
	// ===========================================================
	// ===========================================================
	// LEFT GETTING CODE
	_posLeft = [
		((getPos _myBird) select 0) + (_posLeftSpatial select 0)),
		((getPos _myBird) select 1) + (_posLeftSpatial select 1)),
		((getPos _myBird) select 2) + (_posLeftSpatial select 2))
	];
	_posLeft_WV = [
		(_posLeft select 0) + (3 *(wind select 0)),
		(_posLeft select 1) + (3 *(wind select 1)),
		(_posLeft select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posLeft, _posLeft_WV, _myBird]) then {
		LeftIntersects = 1;
	} else {
		LeftIntersects = 0;
	};
	// ===========================================================
	// ===========================================================
	// CENTER GETTING CODE
	_posCenter = [
		((getPos _myBird) select 0) + (_posCenterSpatial select 0)),
		((getPos _myBird) select 1) + (_posCenterSpatial select 1)),
		((getPos _myBird) select 2) + (_posCenterSpatial select 2))
	];
	_posCenter_WV = [
		(_posCenter select 0) + (3 *(wind select 0)),
		(_posCenter select 1) + (3 *(wind select 1)),
		(_posCenter select 2) + (3 *(wind select 2))
	];	
	if (lineIntersects [_posCenter, _posCenter_WV, _myBird]) then {
		CenterIntersects = 1;
	} else {
		CenterIntersects = 0;
	};
	// ===========================================================
	// ===========================================================
	// Velocity-Setting
	intersectionArray = [FrontIntersects,RearIntersects,TopIntersects,BottomIntersects,RightIntersects,LeftIntersects,CenterIntersects];
	
	_pushRatio = (7 - FrontIntersects - RearIntersects - TopIntersects - BottomIntersects - RightIntersects - LeftIntersects - CenterIntersects) / 7;
	if (_pushRatio == 1) then {
		_myBird setVelocity [
		((velocity _myBird) select 0) + (wind select 0) / _windFactor,
		((velocity _myBird) select 1) + (wind select 1) / _windFactor,
		((velocity _myBird) select 2) + (wind select 2) / _windFactor
		];
	};
	
	
	
	
	
	
	
	
	
};