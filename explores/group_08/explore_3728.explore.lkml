# Explore: explore_3728
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11185.view.lkml"
include: "/views/domain_37/view_11187.view.lkml"
include: "/views/domain_38/view_11188.view.lkml"
include: "/views/domain_39/view_11189.view.lkml"

explore: explore_3728 {
  label: "Explore Explore 3728"
  description: "Comprehensive analytics explore joining base view_11185 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11185
  
  always_filter: {
    filters: [view_11185.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11185.created_at_date: "7 days"]
    unless: [view_11185.id, view_11185.status]
  }

  join: view_11187 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11185.user_id} = ${view_11187.id} ;;
    required_joins: []
  }

  join: view_11188 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11185.account_id} = ${view_11188.account_id} ;;
    required_joins: [view_11187]
  }

  join: view_11189 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11185.category} = ${view_11189.category} ;;
  }

  access_filter: {
    field: view_11185.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11185.is_deleted} = false ;;
}
