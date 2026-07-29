# Explore: explore_0856
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02569.view.lkml"
include: "/views/domain_21/view_02571.view.lkml"
include: "/views/domain_22/view_02572.view.lkml"
include: "/views/domain_23/view_02573.view.lkml"

explore: explore_0856 {
  label: "Explore Explore 0856"
  description: "Comprehensive analytics explore joining base view_02569 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02569
  
  always_filter: {
    filters: [view_02569.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02569.created_at_date: "7 days"]
    unless: [view_02569.id, view_02569.status]
  }

  join: view_02571 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02569.user_id} = ${view_02571.id} ;;
    required_joins: []
  }

  join: view_02572 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02569.account_id} = ${view_02572.account_id} ;;
    required_joins: [view_02571]
  }

  join: view_02573 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02569.category} = ${view_02573.category} ;;
  }

  access_filter: {
    field: view_02569.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02569.is_deleted} = false ;;
}
