local chartboost = require( "plugin.chartboost" );
local widget = require( "widget" );
widget.setTheme( "widget_theme_ios" );

-- The ChartBoost listener function
local function chartBoostListener( event )
	for k, v in pairs( event ) do
		print( k, ":", v )
	end
end

-- Your ChartBoost app id
local yourAppID = "your_app_id";
-- Your ChartBoost app signature
local yourAppSignature = "your_app_signature";

-- Initialise ChartBoost
chartboost.init(
	{
		appID = yourAppID,
		appSignature = yourAppSignature, 
		listener = chartBoostListener,
	}
);

-- Show Ad button
local showAdButton = widget.newButton
{
	label = "Show Ad";
	onRelease = function( event )
		chartboost.show( "interstitial" );
	end,
}
showAdButton.x = display.contentCenterX;
showAdButton.y = 150;

-- Cache Default Ad
local cacheDefaultAd = widget.newButton
{
	label = "Cache Default Ad",
	onRelease = function( event )
		chartboost.cache();
	end,
}
cacheDefaultAd.x = display.contentCenterX;
cacheDefaultAd.y = showAdButton.y + showAdButton.contentHeight + cacheDefaultAd.contentHeight * 0.5;

-- Cache More Apps
local cacheMoreAppsButton = widget.newButton
{
	label = "Cache More Apps",
	onRelease = function( event )
		chartboost.cache( "moreApps" );
	end,
}
cacheMoreAppsButton.x = display.contentCenterX;
cacheMoreAppsButton.y = cacheDefaultAd.y + cacheDefaultAd.contentHeight + cacheMoreAppsButton.contentHeight * 0.5;

-- Show More Apps button
local showMoreAppsButton = widget.newButton
{
	label = "Show More Apps";
	onRelease = function( event )
		chartboost.show( "moreApps" );
	end,
}
showMoreAppsButton.x = display.contentCenterX;
showMoreAppsButton.y = cacheMoreAppsButton.y + cacheMoreAppsButton.contentHeight + showMoreAppsButton.contentHeight * 0.5;
