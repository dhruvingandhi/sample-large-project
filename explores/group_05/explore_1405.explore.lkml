# Explore: explore_1405
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04216.view.lkml"
include: "/views/domain_18/view_04218.view.lkml"
include: "/views/domain_19/view_04219.view.lkml"
include: "/views/domain_20/view_04220.view.lkml"

explore: explore_1405 {
  label: "Explore Explore 1405"
  description: "Comprehensive analytics explore joining base view_04216 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04216
  
  always_filter: {
    filters: [view_04216.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04216.created_at_date: "7 days"]
    unless: [view_04216.id, view_04216.status]
  }

  join: view_04218 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04216.user_id} = ${view_04218.id} ;;
    required_joins: []
  }

  join: view_04219 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04216.account_id} = ${view_04219.account_id} ;;
    required_joins: [view_04218]
  }

  join: view_04220 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04216.category} = ${view_04220.category} ;;
  }

  access_filter: {
    field: view_04216.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04216.is_deleted} = false ;;
}
