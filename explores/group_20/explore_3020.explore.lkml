# Explore: explore_3020
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09061.view.lkml"
include: "/views/domain_13/view_09063.view.lkml"
include: "/views/domain_14/view_09064.view.lkml"
include: "/views/domain_15/view_09065.view.lkml"

explore: explore_3020 {
  label: "Explore Explore 3020"
  description: "Comprehensive analytics explore joining base view_09061 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09061
  
  always_filter: {
    filters: [view_09061.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09061.created_at_date: "7 days"]
    unless: [view_09061.id, view_09061.status]
  }

  join: view_09063 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09061.user_id} = ${view_09063.id} ;;
    required_joins: []
  }

  join: view_09064 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09061.account_id} = ${view_09064.account_id} ;;
    required_joins: [view_09063]
  }

  join: view_09065 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09061.category} = ${view_09065.category} ;;
  }

  access_filter: {
    field: view_09061.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09061.is_deleted} = false ;;
}
