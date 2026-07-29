# Explore: explore_1661
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04984.view.lkml"
include: "/views/domain_36/view_04986.view.lkml"
include: "/views/domain_37/view_04987.view.lkml"
include: "/views/domain_38/view_04988.view.lkml"

explore: explore_1661 {
  label: "Explore Explore 1661"
  description: "Comprehensive analytics explore joining base view_04984 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04984
  
  always_filter: {
    filters: [view_04984.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04984.created_at_date: "7 days"]
    unless: [view_04984.id, view_04984.status]
  }

  join: view_04986 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04984.user_id} = ${view_04986.id} ;;
    required_joins: []
  }

  join: view_04987 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04984.account_id} = ${view_04987.account_id} ;;
    required_joins: [view_04986]
  }

  join: view_04988 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04984.category} = ${view_04988.category} ;;
  }

  access_filter: {
    field: view_04984.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04984.is_deleted} = false ;;
}
