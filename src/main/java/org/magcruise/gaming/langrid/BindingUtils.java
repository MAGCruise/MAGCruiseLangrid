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
package org.magcruise.gaming.langrid;

import gnu.lists.LList;
import jp.go.nict.langrid.client.RequestAttributes;
import jp.go.nict.langrid.commons.cs.binding.BindingNode;

public class BindingUtils {

	public static void setBindings(Object client, BindingNode[] bindings) {
		for (BindingNode binding : bindings) {
			setBinding(client, binding);
		}
	}

	public static Object setBindings(Object client, LList bindings) {
		for (int i = 0; i < bindings.size(); i++) {
			BindingNode node = newBindingNode((LList) bindings.get(i));
			setBinding(client, node);
		}
		return client;
	}

	private static void setBinding(Object client, BindingNode binding) {
		// clientはjava.rmi.Remoteを使っている．キャストが成立する理由がよく分からないがnakaguchiさん実装なので信じる．
		RequestAttributes reqAttrs = (RequestAttributes) client;
		reqAttrs.getTreeBindings().add(binding);
	}

	private static BindingNode newBindingNode(LList list) {
		if (list.size() < 2)
			throw new RuntimeException("invalid binding.");
		BindingNode ret = new BindingNode(list.get(0).toString(),
				list.get(1).toString());
		if (list.size() == 3) {
			LList children = (LList) list.get(2);
			int n = children.size();
			for (int i = 0; i < n; i++) {
				ret.addChild(newBindingNode((LList) children.get(i)));
			}
		}
		return ret;
	}

}
