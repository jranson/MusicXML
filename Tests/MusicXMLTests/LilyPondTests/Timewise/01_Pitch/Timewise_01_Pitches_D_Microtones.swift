//
//  Timewise_01_Pitches_D_Microtones.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

extension Timewise_01_Pitches {
    var D_Microtones: String {
        return """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Some microtones: c
                  flat-and-a-half, d half-flat, e half-sharp, f sharp-and-a half.
                  Once in the lower and once in the upper region of the
                  staff.</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
              <score-part id="P1">
                 <part-name>MusicXML Part</part-name>
              </score-part>
          </part-list>
           <measure number="1">
              <part id="P1">
                 <attributes>
                    <divisions>1</divisions>
                    <key>
                       <fifths>0</fifths>
                       <mode>major</mode>
                    </key>
                    <time symbol="common">
                       <beats>4</beats>
                       <beat-type>4</beat-type>
                    </time>
                    <clef>
                       <sign>G</sign>
                       <line>2</line>
                    </clef>
                 </attributes>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>-1.5</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-0.5</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>E</step>
                       <alter>0.5</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>F</step>
                       <alter>1.5</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
              </part>
           </measure>
           <measure number="2">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>-1.5</alter>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-0.5</alter>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>E</step>
                       <alter>0.5</alter>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>F</step>
                       <alter>1.5</alter>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <barline location="right">
                    <bar-style>light-heavy</bar-style>
                 </barline>
              </part>
           </measure>
        </score-timewise>
        """
    }
}
