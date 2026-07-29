# Explore: explore_2068
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06205.view.lkml"
include: "/views/domain_07/view_06207.view.lkml"
include: "/views/domain_08/view_06208.view.lkml"
include: "/views/domain_09/view_06209.view.lkml"

explore: explore_2068 {
  label: "Explore Explore 2068"
  description: "Comprehensive analytics explore joining base view_06205 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06205
  
  always_filter: {
    filters: [view_06205.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06205.created_at_date: "7 days"]
    unless: [view_06205.id, view_06205.status]
  }

  join: view_06207 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06205.user_id} = ${view_06207.id} ;;
    required_joins: []
  }

  join: view_06208 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06205.account_id} = ${view_06208.account_id} ;;
    required_joins: [view_06207]
  }

  join: view_06209 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06205.category} = ${view_06209.category} ;;
  }

  access_filter: {
    field: view_06205.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06205.is_deleted} = false ;;
}
