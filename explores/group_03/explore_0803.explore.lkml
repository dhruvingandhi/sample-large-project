# Explore: explore_0803
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02410.view.lkml"
include: "/views/domain_12/view_02412.view.lkml"
include: "/views/domain_13/view_02413.view.lkml"
include: "/views/domain_14/view_02414.view.lkml"

explore: explore_0803 {
  label: "Explore Explore 0803"
  description: "Comprehensive analytics explore joining base view_02410 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02410
  
  always_filter: {
    filters: [view_02410.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02410.created_at_date: "7 days"]
    unless: [view_02410.id, view_02410.status]
  }

  join: view_02412 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02410.user_id} = ${view_02412.id} ;;
    required_joins: []
  }

  join: view_02413 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02410.account_id} = ${view_02413.account_id} ;;
    required_joins: [view_02412]
  }

  join: view_02414 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02410.category} = ${view_02414.category} ;;
  }

  access_filter: {
    field: view_02410.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02410.is_deleted} = false ;;
}
