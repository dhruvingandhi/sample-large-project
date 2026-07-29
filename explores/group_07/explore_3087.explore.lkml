# Explore: explore_3087
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09262.view.lkml"
include: "/views/domain_14/view_09264.view.lkml"
include: "/views/domain_15/view_09265.view.lkml"
include: "/views/domain_16/view_09266.view.lkml"

explore: explore_3087 {
  label: "Explore Explore 3087"
  description: "Comprehensive analytics explore joining base view_09262 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09262
  
  always_filter: {
    filters: [view_09262.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09262.created_at_date: "7 days"]
    unless: [view_09262.id, view_09262.status]
  }

  join: view_09264 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09262.user_id} = ${view_09264.id} ;;
    required_joins: []
  }

  join: view_09265 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09262.account_id} = ${view_09265.account_id} ;;
    required_joins: [view_09264]
  }

  join: view_09266 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09262.category} = ${view_09266.category} ;;
  }

  access_filter: {
    field: view_09262.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09262.is_deleted} = false ;;
}
