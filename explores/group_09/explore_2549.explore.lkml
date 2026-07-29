# Explore: explore_2549
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07648.view.lkml"
include: "/views/domain_50/view_07650.view.lkml"
include: "/views/domain_01/view_07651.view.lkml"
include: "/views/domain_02/view_07652.view.lkml"

explore: explore_2549 {
  label: "Explore Explore 2549"
  description: "Comprehensive analytics explore joining base view_07648 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07648
  
  always_filter: {
    filters: [view_07648.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07648.created_at_date: "7 days"]
    unless: [view_07648.id, view_07648.status]
  }

  join: view_07650 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07648.user_id} = ${view_07650.id} ;;
    required_joins: []
  }

  join: view_07651 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07648.account_id} = ${view_07651.account_id} ;;
    required_joins: [view_07650]
  }

  join: view_07652 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07648.category} = ${view_07652.category} ;;
  }

  access_filter: {
    field: view_07648.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07648.is_deleted} = false ;;
}
