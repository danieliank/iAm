//
//  iAmWidget.swift
//  iAmWidget
//
//  Created by Alfadli Maulana Siddik on 17/07/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), moods: Mood.allCases)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), moods: Mood.allCases)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let timeline = Timeline(entries: [SimpleEntry(date: Date(), moods: Mood.allCases)], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let moods: [Mood]
}

struct iAmWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("What do you feel?")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(entry.moods, id: \.self) { mood in
                    Link(destination: URL(string: "testNotes://createNotes/\(mood)")!) {
                        Image(mood.image)
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .padding()
    }
}

struct iAmWidget: Widget {
    let kind: String = "iAmWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                iAmWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                iAmWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("iAm Widget")
        .description("This is a widget to quick log a note")
    }
}

#Preview(as: .systemMedium) {
    iAmWidget()
} timeline: {
    SimpleEntry(date: .now, moods: Mood.allCases)
}
