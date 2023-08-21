<?php

namespace App\Providers;

use Roots\Acorn\Sage\SageServiceProvider;
use App\Assets\Vite;

class ThemeServiceProvider extends SageServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        parent::register();

        $this->app->singleton('assets.vite', Vite::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();
    }
}
