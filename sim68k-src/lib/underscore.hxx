/*
Copyright (C) 2014 Vittorio Zaccaria

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#ifndef UNDERSCORE_HXX
#define UNDERSCORE_HXX

namespace _ {

	/* Warning, this assumes there are no two values with the same key */

	static json11::Json indexBy(json11::Json j1, string key) {
		json11::Json::object ret; 
		for(const auto v: j1.array_items()) {
			auto kk = v[key].string_value();
			ret[kk] = v;
		}
		return ret;
	}

	json11::Json map(json11::Json j1, std::function<json11::Json(json11::Json)> fun) {
		vector<json11::Json> res;
		for(const auto v: j1.array_items()) {
			auto x = fun(v);
			if(!x.is_null()) {
				res.push_back(x);
			}
		}
		return res;
	}

} // underscore

#endif // UNDERSCORE_HXX
