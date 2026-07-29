# Explore: explore_2051
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06154.view.lkml"
include: "/views/domain_06/view_06156.view.lkml"
include: "/views/domain_07/view_06157.view.lkml"
include: "/views/domain_08/view_06158.view.lkml"

explore: explore_2051 {
  label: "Explore Explore 2051"
  description: "Comprehensive analytics explore joining base view_06154 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06154
  
  always_filter: {
    filters: [view_06154.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06154.created_at_date: "7 days"]
    unless: [view_06154.id, view_06154.status]
  }

  join: view_06156 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06154.user_id} = ${view_06156.id} ;;
    required_joins: []
  }

  join: view_06157 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06154.account_id} = ${view_06157.account_id} ;;
    required_joins: [view_06156]
  }

  join: view_06158 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06154.category} = ${view_06158.category} ;;
  }

  access_filter: {
    field: view_06154.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06154.is_deleted} = false ;;
}
