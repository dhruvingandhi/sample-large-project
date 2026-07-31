# Update for 500 file diff target
# Explore: explore_3065
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09196.view.lkml"
include: "/views/domain_48/view_09198.view.lkml"
include: "/views/domain_49/view_09199.view.lkml"
include: "/views/domain_50/view_09200.view.lkml"

explore: explore_3065 {
  label: "Explore Explore 3065"
  description: "Comprehensive analytics explore joining base view_09196 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09196
  
  always_filter: {
    filters: [view_09196.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09196.created_at_date: "7 days"]
    unless: [view_09196.id, view_09196.status]
  }

  join: view_09198 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09196.user_id} = ${view_09198.id} ;;
    required_joins: []
  }

  join: view_09199 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09196.account_id} = ${view_09199.account_id} ;;
    required_joins: [view_09198]
  }

  join: view_09200 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09196.category} = ${view_09200.category} ;;
  }

  access_filter: {
    field: view_09196.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09196.is_deleted} = false ;;
}
