# Explore: explore_3083
# Auto-generated LookML Explore File

include: "/views/domain_50/view_09250.view.lkml"
include: "/views/domain_02/view_09252.view.lkml"
include: "/views/domain_03/view_09253.view.lkml"
include: "/views/domain_04/view_09254.view.lkml"

explore: explore_3083 {
  label: "Explore Explore 3083"
  description: "Comprehensive analytics explore joining base view_09250 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09250
  
  always_filter: {
    filters: [view_09250.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09250.created_at_date: "7 days"]
    unless: [view_09250.id, view_09250.status]
  }

  join: view_09252 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09250.user_id} = ${view_09252.id} ;;
    required_joins: []
  }

  join: view_09253 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09250.account_id} = ${view_09253.account_id} ;;
    required_joins: [view_09252]
  }

  join: view_09254 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09250.category} = ${view_09254.category} ;;
  }

  access_filter: {
    field: view_09250.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09250.is_deleted} = false ;;
}
