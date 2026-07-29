# Explore: explore_1327
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03982.view.lkml"
include: "/views/domain_34/view_03984.view.lkml"
include: "/views/domain_35/view_03985.view.lkml"
include: "/views/domain_36/view_03986.view.lkml"

explore: explore_1327 {
  label: "Explore Explore 1327"
  description: "Comprehensive analytics explore joining base view_03982 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03982
  
  always_filter: {
    filters: [view_03982.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03982.created_at_date: "7 days"]
    unless: [view_03982.id, view_03982.status]
  }

  join: view_03984 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03982.user_id} = ${view_03984.id} ;;
    required_joins: []
  }

  join: view_03985 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03982.account_id} = ${view_03985.account_id} ;;
    required_joins: [view_03984]
  }

  join: view_03986 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03982.category} = ${view_03986.category} ;;
  }

  access_filter: {
    field: view_03982.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03982.is_deleted} = false ;;
}
