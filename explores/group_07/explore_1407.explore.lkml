# Explore: explore_1407
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04222.view.lkml"
include: "/views/domain_24/view_04224.view.lkml"
include: "/views/domain_25/view_04225.view.lkml"
include: "/views/domain_26/view_04226.view.lkml"

explore: explore_1407 {
  label: "Explore Explore 1407"
  description: "Comprehensive analytics explore joining base view_04222 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04222
  
  always_filter: {
    filters: [view_04222.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04222.created_at_date: "7 days"]
    unless: [view_04222.id, view_04222.status]
  }

  join: view_04224 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04222.user_id} = ${view_04224.id} ;;
    required_joins: []
  }

  join: view_04225 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04222.account_id} = ${view_04225.account_id} ;;
    required_joins: [view_04224]
  }

  join: view_04226 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04222.category} = ${view_04226.category} ;;
  }

  access_filter: {
    field: view_04222.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04222.is_deleted} = false ;;
}
