# Explore: explore_2261
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06784.view.lkml"
include: "/views/domain_36/view_06786.view.lkml"
include: "/views/domain_37/view_06787.view.lkml"
include: "/views/domain_38/view_06788.view.lkml"

explore: explore_2261 {
  label: "Explore Explore 2261"
  description: "Comprehensive analytics explore joining base view_06784 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06784
  
  always_filter: {
    filters: [view_06784.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06784.created_at_date: "7 days"]
    unless: [view_06784.id, view_06784.status]
  }

  join: view_06786 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06784.user_id} = ${view_06786.id} ;;
    required_joins: []
  }

  join: view_06787 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06784.account_id} = ${view_06787.account_id} ;;
    required_joins: [view_06786]
  }

  join: view_06788 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06784.category} = ${view_06788.category} ;;
  }

  access_filter: {
    field: view_06784.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06784.is_deleted} = false ;;
}
