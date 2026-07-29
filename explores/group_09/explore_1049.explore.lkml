# Explore: explore_1049
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03148.view.lkml"
include: "/views/domain_50/view_03150.view.lkml"
include: "/views/domain_01/view_03151.view.lkml"
include: "/views/domain_02/view_03152.view.lkml"

explore: explore_1049 {
  label: "Explore Explore 1049"
  description: "Comprehensive analytics explore joining base view_03148 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03148
  
  always_filter: {
    filters: [view_03148.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03148.created_at_date: "7 days"]
    unless: [view_03148.id, view_03148.status]
  }

  join: view_03150 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03148.user_id} = ${view_03150.id} ;;
    required_joins: []
  }

  join: view_03151 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03148.account_id} = ${view_03151.account_id} ;;
    required_joins: [view_03150]
  }

  join: view_03152 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03148.category} = ${view_03152.category} ;;
  }

  access_filter: {
    field: view_03148.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03148.is_deleted} = false ;;
}
