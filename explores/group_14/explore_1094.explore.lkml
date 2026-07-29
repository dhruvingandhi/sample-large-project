# Explore: explore_1094
# Auto-generated LookML Explore File

include: "/views/domain_33/view_03283.view.lkml"
include: "/views/domain_35/view_03285.view.lkml"
include: "/views/domain_36/view_03286.view.lkml"
include: "/views/domain_37/view_03287.view.lkml"

explore: explore_1094 {
  label: "Explore Explore 1094"
  description: "Comprehensive analytics explore joining base view_03283 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03283
  
  always_filter: {
    filters: [view_03283.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03283.created_at_date: "7 days"]
    unless: [view_03283.id, view_03283.status]
  }

  join: view_03285 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03283.user_id} = ${view_03285.id} ;;
    required_joins: []
  }

  join: view_03286 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03283.account_id} = ${view_03286.account_id} ;;
    required_joins: [view_03285]
  }

  join: view_03287 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03283.category} = ${view_03287.category} ;;
  }

  access_filter: {
    field: view_03283.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03283.is_deleted} = false ;;
}
