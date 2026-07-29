# Explore: explore_1395
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04186.view.lkml"
include: "/views/domain_38/view_04188.view.lkml"
include: "/views/domain_39/view_04189.view.lkml"
include: "/views/domain_40/view_04190.view.lkml"

explore: explore_1395 {
  label: "Explore Explore 1395"
  description: "Comprehensive analytics explore joining base view_04186 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04186
  
  always_filter: {
    filters: [view_04186.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04186.created_at_date: "7 days"]
    unless: [view_04186.id, view_04186.status]
  }

  join: view_04188 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04186.user_id} = ${view_04188.id} ;;
    required_joins: []
  }

  join: view_04189 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04186.account_id} = ${view_04189.account_id} ;;
    required_joins: [view_04188]
  }

  join: view_04190 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04186.category} = ${view_04190.category} ;;
  }

  access_filter: {
    field: view_04186.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04186.is_deleted} = false ;;
}
