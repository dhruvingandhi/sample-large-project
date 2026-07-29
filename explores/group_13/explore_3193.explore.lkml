# Explore: explore_3193
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09580.view.lkml"
include: "/views/domain_32/view_09582.view.lkml"
include: "/views/domain_33/view_09583.view.lkml"
include: "/views/domain_34/view_09584.view.lkml"

explore: explore_3193 {
  label: "Explore Explore 3193"
  description: "Comprehensive analytics explore joining base view_09580 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09580
  
  always_filter: {
    filters: [view_09580.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09580.created_at_date: "7 days"]
    unless: [view_09580.id, view_09580.status]
  }

  join: view_09582 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09580.user_id} = ${view_09582.id} ;;
    required_joins: []
  }

  join: view_09583 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09580.account_id} = ${view_09583.account_id} ;;
    required_joins: [view_09582]
  }

  join: view_09584 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09580.category} = ${view_09584.category} ;;
  }

  access_filter: {
    field: view_09580.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09580.is_deleted} = false ;;
}
