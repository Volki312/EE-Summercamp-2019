const proxy = require('http-proxy-middleware');

module.exports = {
  setupProxy: function(app) {
    app.use(proxy('/api', { target: 'http://localhost:9000/' }));
  }
};

module.exports = {
    //homepage: "http://student.oss.unist.hr/~jv46250/"
    homepage: "https://volki312.github.io/Phonebook/"
}
