# Explore: explore_2523
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07570.view.lkml"
include: "/views/domain_22/view_07572.view.lkml"
include: "/views/domain_23/view_07573.view.lkml"
include: "/views/domain_24/view_07574.view.lkml"

explore: explore_2523 {
  label: "Explore Explore 2523"
  description: "Comprehensive analytics explore joining base view_07570 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07570
  
  always_filter: {
    filters: [view_07570.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07570.created_at_date: "7 days"]
    unless: [view_07570.id, view_07570.status]
  }

  join: view_07572 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07570.user_id} = ${view_07572.id} ;;
    required_joins: []
  }

  join: view_07573 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07570.account_id} = ${view_07573.account_id} ;;
    required_joins: [view_07572]
  }

  join: view_07574 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07570.category} = ${view_07574.category} ;;
  }

  access_filter: {
    field: view_07570.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07570.is_deleted} = false ;;
}
