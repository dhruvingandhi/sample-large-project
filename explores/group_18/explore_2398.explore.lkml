# Update for 2000 file diff target
# Explore: explore_2398
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07195.view.lkml"
include: "/views/domain_47/view_07197.view.lkml"
include: "/views/domain_48/view_07198.view.lkml"
include: "/views/domain_49/view_07199.view.lkml"

explore: explore_2398 {
  label: "Explore Explore 2398"
  description: "Comprehensive analytics explore joining base view_07195 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07195
  
  always_filter: {
    filters: [view_07195.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07195.created_at_date: "7 days"]
    unless: [view_07195.id, view_07195.status]
  }

  join: view_07197 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07195.user_id} = ${view_07197.id} ;;
    required_joins: []
  }

  join: view_07198 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07195.account_id} = ${view_07198.account_id} ;;
    required_joins: [view_07197]
  }

  join: view_07199 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07195.category} = ${view_07199.category} ;;
  }

  access_filter: {
    field: view_07195.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07195.is_deleted} = false ;;
}
