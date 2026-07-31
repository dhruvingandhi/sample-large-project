# Update for 2000 file diff target
# Explore: explore_3778
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11335.view.lkml"
include: "/views/domain_37/view_11337.view.lkml"
include: "/views/domain_38/view_11338.view.lkml"
include: "/views/domain_39/view_11339.view.lkml"

explore: explore_3778 {
  label: "Explore Explore 3778"
  description: "Comprehensive analytics explore joining base view_11335 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11335
  
  always_filter: {
    filters: [view_11335.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11335.created_at_date: "7 days"]
    unless: [view_11335.id, view_11335.status]
  }

  join: view_11337 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11335.user_id} = ${view_11337.id} ;;
    required_joins: []
  }

  join: view_11338 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11335.account_id} = ${view_11338.account_id} ;;
    required_joins: [view_11337]
  }

  join: view_11339 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11335.category} = ${view_11339.category} ;;
  }

  access_filter: {
    field: view_11335.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11335.is_deleted} = false ;;
}
