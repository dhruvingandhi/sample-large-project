# Explore: explore_2346
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07039.view.lkml"
include: "/views/domain_41/view_07041.view.lkml"
include: "/views/domain_42/view_07042.view.lkml"
include: "/views/domain_43/view_07043.view.lkml"

explore: explore_2346 {
  label: "Explore Explore 2346"
  description: "Comprehensive analytics explore joining base view_07039 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07039
  
  always_filter: {
    filters: [view_07039.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07039.created_at_date: "7 days"]
    unless: [view_07039.id, view_07039.status]
  }

  join: view_07041 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07039.user_id} = ${view_07041.id} ;;
    required_joins: []
  }

  join: view_07042 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07039.account_id} = ${view_07042.account_id} ;;
    required_joins: [view_07041]
  }

  join: view_07043 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07039.category} = ${view_07043.category} ;;
  }

  access_filter: {
    field: view_07039.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07039.is_deleted} = false ;;
}
