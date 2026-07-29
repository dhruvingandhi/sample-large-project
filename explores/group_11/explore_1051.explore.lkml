# Explore: explore_1051
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03154.view.lkml"
include: "/views/domain_06/view_03156.view.lkml"
include: "/views/domain_07/view_03157.view.lkml"
include: "/views/domain_08/view_03158.view.lkml"

explore: explore_1051 {
  label: "Explore Explore 1051"
  description: "Comprehensive analytics explore joining base view_03154 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03154
  
  always_filter: {
    filters: [view_03154.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03154.created_at_date: "7 days"]
    unless: [view_03154.id, view_03154.status]
  }

  join: view_03156 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03154.user_id} = ${view_03156.id} ;;
    required_joins: []
  }

  join: view_03157 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03154.account_id} = ${view_03157.account_id} ;;
    required_joins: [view_03156]
  }

  join: view_03158 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03154.category} = ${view_03158.category} ;;
  }

  access_filter: {
    field: view_03154.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03154.is_deleted} = false ;;
}
