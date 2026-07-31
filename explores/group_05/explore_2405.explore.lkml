# Update for 500 file diff target
# Explore: explore_2405
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07216.view.lkml"
include: "/views/domain_18/view_07218.view.lkml"
include: "/views/domain_19/view_07219.view.lkml"
include: "/views/domain_20/view_07220.view.lkml"

explore: explore_2405 {
  label: "Explore Explore 2405"
  description: "Comprehensive analytics explore joining base view_07216 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07216
  
  always_filter: {
    filters: [view_07216.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07216.created_at_date: "7 days"]
    unless: [view_07216.id, view_07216.status]
  }

  join: view_07218 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07216.user_id} = ${view_07218.id} ;;
    required_joins: []
  }

  join: view_07219 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07216.account_id} = ${view_07219.account_id} ;;
    required_joins: [view_07218]
  }

  join: view_07220 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07216.category} = ${view_07220.category} ;;
  }

  access_filter: {
    field: view_07216.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07216.is_deleted} = false ;;
}
