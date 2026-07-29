# Explore: explore_3232
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09697.view.lkml"
include: "/views/domain_49/view_09699.view.lkml"
include: "/views/domain_50/view_09700.view.lkml"
include: "/views/domain_01/view_09701.view.lkml"

explore: explore_3232 {
  label: "Explore Explore 3232"
  description: "Comprehensive analytics explore joining base view_09697 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09697
  
  always_filter: {
    filters: [view_09697.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09697.created_at_date: "7 days"]
    unless: [view_09697.id, view_09697.status]
  }

  join: view_09699 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09697.user_id} = ${view_09699.id} ;;
    required_joins: []
  }

  join: view_09700 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09697.account_id} = ${view_09700.account_id} ;;
    required_joins: [view_09699]
  }

  join: view_09701 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09697.category} = ${view_09701.category} ;;
  }

  access_filter: {
    field: view_09697.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09697.is_deleted} = false ;;
}
