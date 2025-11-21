from django.contrib import admin

# Guardamos el método original para usarlo como base
_original_get_app_list = admin.AdminSite.get_app_list

def _custom_get_app_list(self, request, *args, **kwargs):
    """Devuelve la lista de apps pero reordena los modelos de `trainingApp`.

    La lista `desired` contiene los nombres tal como aparecen en el sidebar
    (campo `name` de cada modelo en la estructura que devuelve Django).
    """
    app_list = _original_get_app_list(self, request, *args, **kwargs)
    for app in app_list:
        if app.get('app_label') == 'trainingApp':
            desired = [
                'Trainings',
                'Blocks',
                'Deploys',
                'Choices',
                'Block answers',
                'Comments',
                'Deploy answers',
                'Groups',
                
            ]
            models = app.get('models', [])
            name_map = {m['name']: m for m in models}
            ordered = [name_map[n] for n in desired if n in name_map]
            remaining = [m for m in models if m['name'] not in desired]
            app['models'] = ordered + remaining
    return app_list


# Reemplazamos el método de la clase AdminSite; se aplicará al `admin.site` existente
admin.AdminSite.get_app_list = _custom_get_app_list
