module RelationshipsHelper

  def span_for_job_relationship_status(job, user)
    rel = job.relationship_for_user(user)
    return if !rel
    span_class, text = case rel.aasm_state
    when "like"
      ["label-info", "Liked"]
    when "pending"
      ["label-warning", "Update Status"]
    when "interviewing"
      ["label-success", "Interview Scheduled"]
    when "user_decline"
      ["label-inverse", "Student Declined"]
    when "company_decline"
      ["label-danger", "Company Declined"]
    when "offer_received"
      ["", "Offer Received"]
    when "offer_accepted"
      ["label-success", "Offer Accepted"]
    when "offer_declined"
      ["label-inverse", "Offer Declined"]
    end


    content_tag :span, :class => "label #{span_class}" do
      text
    end

  end
end
