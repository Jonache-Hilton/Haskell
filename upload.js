var fs = require('fs');
var s3 = require('s3-node-client');

var aws = JSON.parse(fs.readFileSync('/Users/' + process.env.USER + '/.aws/acnt_1.json', 'utf8'));

var client = s3.createClient({
	s3Options: aws
});

var params = {
	// localFile: './dist/index_bundle.js',
	localFile: './info.json',
	s3Params: {
		Bucket: 'jp-remote-assets',
		Key: 'moonshot/payments/test/info.json',
		// Key: 'moonshot/payments/test/Merchants-Jio-index_bundle.js',
		// Key: 'moonshot/payments/test/Merchants-Redbus-index_bundle.js',
		ACL: 'public-read'
	}
};

var uploader = client.uploadFile(params);

uploader.on('error', function (err) {
	console.error('unable to upload:', err.stack);
});

uploader.on('progress', function () {
	process.stdout.write('Progress: ' + parseInt(uploader.progressAmount / uploader.progressTotal * 100) + '%' + '\r');
});

uploader.on('end', function () {
	console.log(
		'Progress: Done and Dusted! \nFile Size: ' + parseFloat(uploader.progressTotal / 1024).toFixed(3) + 'KB'
	);
});
