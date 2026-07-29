# Explore: explore_3776
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11329.view.lkml"
include: "/views/domain_31/view_11331.view.lkml"
include: "/views/domain_32/view_11332.view.lkml"
include: "/views/domain_33/view_11333.view.lkml"

explore: explore_3776 {
  label: "Explore Explore 3776"
  description: "Comprehensive analytics explore joining base view_11329 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11329
  
  always_filter: {
    filters: [view_11329.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11329.created_at_date: "7 days"]
    unless: [view_11329.id, view_11329.status]
  }

  join: view_11331 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11329.user_id} = ${view_11331.id} ;;
    required_joins: []
  }

  join: view_11332 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11329.account_id} = ${view_11332.account_id} ;;
    required_joins: [view_11331]
  }

  join: view_11333 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11329.category} = ${view_11333.category} ;;
  }

  access_filter: {
    field: view_11329.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11329.is_deleted} = false ;;
}
