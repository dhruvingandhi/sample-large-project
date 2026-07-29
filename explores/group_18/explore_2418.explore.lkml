# Explore: explore_2418
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07255.view.lkml"
include: "/views/domain_07/view_07257.view.lkml"
include: "/views/domain_08/view_07258.view.lkml"
include: "/views/domain_09/view_07259.view.lkml"

explore: explore_2418 {
  label: "Explore Explore 2418"
  description: "Comprehensive analytics explore joining base view_07255 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07255
  
  always_filter: {
    filters: [view_07255.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07255.created_at_date: "7 days"]
    unless: [view_07255.id, view_07255.status]
  }

  join: view_07257 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07255.user_id} = ${view_07257.id} ;;
    required_joins: []
  }

  join: view_07258 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07255.account_id} = ${view_07258.account_id} ;;
    required_joins: [view_07257]
  }

  join: view_07259 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07255.category} = ${view_07259.category} ;;
  }

  access_filter: {
    field: view_07255.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07255.is_deleted} = false ;;
}
