# Explore: explore_2738
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08215.view.lkml"
include: "/views/domain_17/view_08217.view.lkml"
include: "/views/domain_18/view_08218.view.lkml"
include: "/views/domain_19/view_08219.view.lkml"

explore: explore_2738 {
  label: "Explore Explore 2738"
  description: "Comprehensive analytics explore joining base view_08215 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08215
  
  always_filter: {
    filters: [view_08215.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08215.created_at_date: "7 days"]
    unless: [view_08215.id, view_08215.status]
  }

  join: view_08217 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08215.user_id} = ${view_08217.id} ;;
    required_joins: []
  }

  join: view_08218 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08215.account_id} = ${view_08218.account_id} ;;
    required_joins: [view_08217]
  }

  join: view_08219 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08215.category} = ${view_08219.category} ;;
  }

  access_filter: {
    field: view_08215.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08215.is_deleted} = false ;;
}
