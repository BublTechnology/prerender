module.exports = {
    onPhantomPageCreate: function(phantom, req, res, next) {

        req.prerender.page.run(function(resolve) {

            var customHeaders = this.customHeaders;

            customHeaders['X-Prerender'] = 1;
            customHeaders['Cache-Control'] = 'no-cache';
            this.customHeaders = customHeaders;

            resolve();

        }).then(function() {

            next();
        }).catch(function() {

            next();
        });
    }
}
