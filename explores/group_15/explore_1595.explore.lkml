# Explore: explore_1595
# Auto-generated LookML Explore File

include: "/views/domain_36/view_04786.view.lkml"
include: "/views/domain_38/view_04788.view.lkml"
include: "/views/domain_39/view_04789.view.lkml"
include: "/views/domain_40/view_04790.view.lkml"

explore: explore_1595 {
  label: "Explore Explore 1595"
  description: "Comprehensive analytics explore joining base view_04786 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04786
  
  always_filter: {
    filters: [view_04786.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04786.created_at_date: "7 days"]
    unless: [view_04786.id, view_04786.status]
  }

  join: view_04788 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04786.user_id} = ${view_04788.id} ;;
    required_joins: []
  }

  join: view_04789 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04786.account_id} = ${view_04789.account_id} ;;
    required_joins: [view_04788]
  }

  join: view_04790 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04786.category} = ${view_04790.category} ;;
  }

  access_filter: {
    field: view_04786.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04786.is_deleted} = false ;;
}
