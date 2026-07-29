# Explore: explore_2864
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08593.view.lkml"
include: "/views/domain_45/view_08595.view.lkml"
include: "/views/domain_46/view_08596.view.lkml"
include: "/views/domain_47/view_08597.view.lkml"

explore: explore_2864 {
  label: "Explore Explore 2864"
  description: "Comprehensive analytics explore joining base view_08593 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08593
  
  always_filter: {
    filters: [view_08593.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08593.created_at_date: "7 days"]
    unless: [view_08593.id, view_08593.status]
  }

  join: view_08595 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08593.user_id} = ${view_08595.id} ;;
    required_joins: []
  }

  join: view_08596 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08593.account_id} = ${view_08596.account_id} ;;
    required_joins: [view_08595]
  }

  join: view_08597 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08593.category} = ${view_08597.category} ;;
  }

  access_filter: {
    field: view_08593.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08593.is_deleted} = false ;;
}
