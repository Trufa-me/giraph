/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.giraph.graph;

/**
 * A dumb implementation of {@link WorkerContext}. This is the default
 * implementation when no WorkerContext is defined by the user. It does
 * nothing.
 */
public class DefaultWorkerContext extends WorkerContext {

	@Override
	public void preApplication() throws InstantiationException,
            IllegalAccessException {
    }

    @Override
    public void postApplication() { }

    @Override
    public void preSuperstep() { }

    @Override
    public void postSuperstep() { }
}