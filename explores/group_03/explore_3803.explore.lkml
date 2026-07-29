# Explore: explore_3803
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11410.view.lkml"
include: "/views/domain_12/view_11412.view.lkml"
include: "/views/domain_13/view_11413.view.lkml"
include: "/views/domain_14/view_11414.view.lkml"

explore: explore_3803 {
  label: "Explore Explore 3803"
  description: "Comprehensive analytics explore joining base view_11410 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11410
  
  always_filter: {
    filters: [view_11410.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11410.created_at_date: "7 days"]
    unless: [view_11410.id, view_11410.status]
  }

  join: view_11412 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11410.user_id} = ${view_11412.id} ;;
    required_joins: []
  }

  join: view_11413 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11410.account_id} = ${view_11413.account_id} ;;
    required_joins: [view_11412]
  }

  join: view_11414 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11410.category} = ${view_11414.category} ;;
  }

  access_filter: {
    field: view_11410.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11410.is_deleted} = false ;;
}
