/**
 * Copyright (c) 2009 Digital Primates IT Consulting Group
 * 
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author     Michael Labriola 
 * @version    
 **/ 
package org.flexunit.internals.runners.statements {
	import org.flexunit.constants.AnnotationConstants;
	import org.flexunit.internals.runners.statements.IAsyncStatement;
	import org.flexunit.internals.runners.statements.SequencerWithDecoration;
	import org.flexunit.runners.model.FrameworkMethod;
	
	/**
	 * The <code>RunBefores</code> is a <code>SequencerWithDecoration</code> for potential methods that have
	 * <code>Before</code> metadata and should be run before a test has started.  This class also determines
	 * whether methods tagged as before methods are asynchronous.
	 */
	public class RunBefores extends SequencerWithDecoration implements IAsyncStatement {
		
		/**
		 * @inheritDoc
		 */
		override protected function withPotentialAsync( method:FrameworkMethod, test:Object, statement:IAsyncStatement ):IAsyncStatement {
			var async:Boolean = ExpectAsync.hasAsync( method, AnnotationConstants.BEFORE );
			return async ? new ExpectAsync( test, statement ) : statement;
		}
		
		/**
		 * Constructor.
		 * 
		 * @param befores An array containing all statements that need to be executed before a test is executed.
		 * @param target The test class.
		 */
		public function RunBefores( befores:Array, target:Object, statement:IAsyncStatement=null ) {
			super( befores, target );
		}

		/**
		 * @private 
		 * @return 
		 */
		override public function toString():String {
			return "RunBefores";
		}
	}
}