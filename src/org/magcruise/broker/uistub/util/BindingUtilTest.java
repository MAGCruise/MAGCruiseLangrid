/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 MAGCruise
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.magcruise.broker.uistub.util;

import gnu.lists.LList;

import java.net.URL;
import java.util.Arrays;

import jp.go.nict.langrid.client.RequestAttributes;
import jp.go.nict.langrid.client.jsonrpc.JsonRpcClientFactory;
import jp.go.nict.langrid.commons.cs.binding.BindingNode;
import jp.go.nict.langrid.commons.rpc.intf.Parameter;
import jp.go.nict.langrid.repackaged.net.arnx.jsonic.JSON;
import jp.go.nict.langrid.service_1_2.bilingualdictionary.Translation;
import kawa.standard.Scheme;

import org.junit.Test;
import org.magcruise.gaming.langrid.BindingUtil;

public class BindingUtilTest {
	public static void hello(LList list) throws Exception {
		int n = list.size();
		if (n == 0)
			return;
		Runnable r = new JsonRpcClientFactory().create(Runnable.class, new URL(
				"http://localhost/dummy"));
		BindingUtil.setBindings(r, list);
		RequestAttributes reqAttrs = (RequestAttributes) r;
		for (BindingNode node : reqAttrs.getTreeBindings()) {
			System.out.println(JSON.encode(node));
		}
		System.out.println("hello");
	}

	public static String translate(
			@Parameter(name = "sourceLang") String sourceLang,
			@Parameter(name = "targetLang") String targetLang,
			@Parameter(name = "source") String source,
			@Parameter(name = "temporalDict") Translation[] temporalDict,
			@Parameter(name = "dictTargetLang") String dictTargetLang) {
		return source;
	}

	@Test
	public void test() throws Throwable {
		Scheme s = Scheme.getInstance();
		s.eval("(define (f v . bindings) (jp.ac.waseda.qcom.util.BindingUtilTest:hello bindings))"
				+ "(f '((\"name\" \"value\" ((\"childName\" \"childValue\")))))");

	}

	@Test
	public void test2() throws Throwable {
		Scheme s = Scheme.getInstance();
		s.eval("(jp.ac.waseda.qcom.util.BindingUtilTest:translate \"en\" \"ja\" \"hello\""
				+ " (jp.ac.waseda.qcom.util.ConvertUtil:listToTranslations '()) \"ja\")");
	}

	@Test
	public void test3() throws Throwable {
		Scheme s = Scheme.getInstance();
		System.out
				.println(Arrays.toString((Object[]) s
						.eval("(jp.go.nict.langrid.commons.util.ArrayUtil:array String '(\"hello\" \"world\"))")));
	}
}
